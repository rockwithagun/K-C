//This should hold all the werewolf related powers

/mob/proc/werewolf_power(required_sanity=0, max_stat=0)

	if(!src.mind)		return 0
	if(!ishuman(src))
		src << "<span class='warning'>You are in too weak of a form to do this!</span>"
		return 0

	var/datum/werewolf/werewolf = src.mind.werewolf

	if(!werewolf)
		world.log << "[src] has werewolf verbs but isn't a werewolf."
		return 0

	var/fullpower = (WERE_FULL in werewolf.powers)

	if(src.stat > max_stat)
		src << "<span class='warning'>You are incapacitated.</span>"
		return 0

	if(werewolf.nullified)
		if(!fullpower)
			src << "<span class='warning'>Something is blocking your powers!</span>"
			return 0
	if(werewolf.sanityusable < required_sanity)
		src << "<span class='warning'>You require at least [required_sanity] units of usable sanity to do that!</span>"
		return 0
	//chapel check
	if(istype(loc, /turf))
		var/turf/T = loc
		if(T.holy)
			if(!fullpower)
				src << "<span class='warning'>Your powers are useless on this holy ground.</span>"
				return 0
	return 1

/mob/proc/werewolf_affected(datum/mind/M)
	//Other werewolf aren't affected
	if(mind && mind.werewolf) return 0
	//werewolf who have reached their full potential can affect nearly everything
	if(M && M.werewolf && (WERE_FULL in M.werewolf.powers))
		return 1
	//Chaplains are resistant to vampire powers
	if(mind && mind.assigned_role == "Chaplain")
		return 0
	return 1

/mob/proc/werewolf_can_reach(mob/M as mob, active_range = 1)
	if(M.loc == src.loc) return 1 //target and source are in the same thing
	if(!isturf(src.loc) || !isturf(M.loc)) return 0 //One is inside, the other is outside something.
	if(Adjacent(M))//If a path exists, good!
		return 1
	return 0

/client/proc/werewolf_shapeshift()
	set category = "Werewolf"
	set name = "Shapeshift"
	set desc = "Change your form, has a cooldown of 3 minutes."
	var/mob/living/carbon/human/H = src
	if(!H) return
	if(H.current.vampire_power(0, 0))
		H = H.werewolfize
		spawn(1800) H.current.verbs += /client/proc/werewolf_shapeshift
		H.visible_message("<span class='warning'>[H] transforms!</span>")

/*
//Transform into a human
/mob/proc/werewolf_lesser_transform()
	set category = "Werewolf"
	set name = "Transform (1)"

	if(!werewolf)	return

	var/list/names = list()
	for(var/datum/dna/DNA in werewolf.absorbed_dna)
		names += "[DNA.real_name]"

	var/S = input("Select the target DNA: ", "Target DNA", null) as null|anything in names
	if(!S)	return

	var/datum/dna/chosen_dna = werewolf.GetDNA(S)
	if(!chosen_dna)
		return

	var/mob/living/carbon/human/C = src

	C.visible_message("<span class='warning'>[C] transforms!</span>")
	C.dna = chosen_dna.Clone()
*/

/client/proc/werewolf_roar()
	set category = "Werewolf"
	set name = "Roar (30)"
	set desc = "An extremely loud roar that stuns nearby humans and breaks glass as well."
	var/datum/mind/M = usr.mind
	if(!M) return
	if(M.current.werewolf_power(30, 0))
		M.current.visible_message("<span class='warning'> [M.current.name] lets out an ear piercing roar!</span>", "<span class='warning'> You let out a loud roar.</span>", "<span class='warning'> You hear a loud, painful roar!</span>")
		for(var/mob/living/carbon/C in hearers(4, M.current))
			if(C == M.current) continue
			if(ishuman(C) && C:is_on_ears(/obj/item/clothing/ears/earmuffs)) continue
			if(!C.werewolf_affected(M)) continue
			C << "<span class='warning'><font size='3'><b>You hear a ear piercing roar and your senses dull!</font></b></span>"
			C.Weaken(8)
			C.ear_deaf = 20
			C.stuttering = 20
			C.Stun(8)
			C.make_jittery(150)
		//sonic grenade code copypasta, more elegant than my method
		for(var/obj/structure/window/W in view(4, M.current.loc)) //Shatters windows
			W.hit(20,1)
			if(get_dist(W, M.current.loc) <= 3) //Reinf windows
				W.hit(60,0)
			if(get_dist(W, M.current.loc) <= 1)
				W.hit(40,0)
		for(var/obj/machinery/door/window/D in view(4, M.current.loc)) //Busting windoors
			D.take_damage(150)
			if(get_dist(D, M.current.loc) <= 2)
				D.take_damage(150)

		playsound(M.current.loc, 'sound/urist/creepyshriek.ogg', 100, 1)
		M.current.remove_werewolf_sanity(30)
		M.current.verbs -= /client/proc/werewolf_roar
		spawn(1800) M.current.verbs += /client/proc/werewolf_roar


/mob/proc/remove_werewolf_sanity(amount = 0)
	var/sanityold
	if(!mind || !mind.werewolf)
		return
	sanityold = mind.werewolf.sanityusable
	mind.werewolf.sanityusable = max(0, (mind.werewolf.sanityusable - amount))
	if(sanityold != mind.werewolf.sanityusable)
		src << "<span class='notice'> <b>You have [mind.werewolf.sanityusable] left to use.</b></span>"

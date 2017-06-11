/turf/simulated/floor/jungle
	var/bushes_spawn = 1
	var/plants_spawn = 1
	var/small_trees = 1
	var/large_trees_low = 0
	var/large_trees_high = 0
	var/reeds_spawn = 0
	name = "dirt"
	desc = "It's dirt."
	icon = 'icons/jungle.dmi'
	icon_state = "grass1"
	var/icon_spawn_state = "grass1"
//	luminosity = 3
	var/farmed = 0
	light_color = null
	light_power = 1
	light_range = 5 //for some reason, range 1 doesn't apply at all.
	var/bushspawnchance = 35 //let's try it, why not

/turf/simulated/floor/jungle/update_air_properties() //No, you can't flood the jungle with phoron silly.
	return

/turf/simulated/floor/jungle/New()
	if(icon_spawn_state)
		icon_state = icon_spawn_state

	update_light()

/turf/simulated/floor/jungle/ex_act(severity)
	return

/turf/simulated/floor/jungle/attackby(var/obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/weapon/shovel))
		if(!farmed) //todo; add a way to remove the soil
			user.visible_message("<span class='notice'>[user] starts to dig up some soil and prepare the ground for planting.</span>", \
			"<span class='notice'>You start to dig up some soil and prepare the ground for planting.</span>")
			if (do_after(user, 30, src))
				new /obj/machinery/portable_atmospherics/hydroponics/soil(src)
				user.visible_message("<span class='notice'>[user] digs up some soil and prepares the ground for planting.</span>", \
				"<span class='notice'>You dig up some soil and prepares the ground for planting.</span>")
				src.farmed = 1
				src.overlays = null

/turf/simulated/floor/jungle/med
	large_trees_low = 1
	icon_state = "grass4" //4
	icon_spawn_state = "grass1"
	bushspawnchance = 54

/turf/simulated/floor/jungle/thick
	large_trees_high = 1
	icon_state = "grass3" //3
	icon_spawn_state = "grass1"
	bushspawnchance = 73

/turf/simulated/floor/jungle/clear
	bushes_spawn = 0
	plants_spawn = 0
	small_trees = 0
	icon_state = "grass3" //clear
//	icon_spawn_state = "grass3"
	icon_spawn_state = null

/turf/simulated/floor/jungle/clear/New()
	//set_light(2)

	update_light()

/turf/simulated/floor/jungle/clear/grass1
	bushes_spawn = 0
	plants_spawn = 0
	small_trees = 0
	icon_state = "grass1" //clear
//	icon_spawn_state = "grass3"
	icon_spawn_state = null

/turf/simulated/floor/jungle/clear/dark
	icon_state = "grass1" //clear
//	icon_spawn_state = "grass1"
	luminosity = 0
	icon_spawn_state = null

/turf/simulated/floor/jungle/path
	bushes_spawn = 0
	small_trees = 0
	name = "wet grass"
	desc = "thick, long wet grass"
	icon = 'icons/jungle.dmi'
	icon_state = "grass_path" //path
	icon_spawn_state = "grass2"


/turf/simulated/floor/jungle/proc/Spread(var/probability, var/prob_loss = 50)
	if(probability <= 0)
		return

	//world << "<span class='notice'> Spread([probability])</span>"
	for(var/turf/simulated/floor/jungle/J in orange(1, src))
		if(!J.bushes_spawn)
			continue

		var/turf/simulated/floor/jungle/P = null
		if(J.type == src.type)
			P = J
		else
			P = new src.type(J)

		if(P && prob(probability))
			P.Spread(probability - prob_loss)

/turf/simulated/floor/jungle/impenetrable
	bushes_spawn = 0
	small_trees = 0
	large_trees_high = 1
	large_trees_low = 1
	icon_state = "grass_impenetrable" //impenetrable
	icon_spawn_state = "grass1"

//copy paste from asteroid mineral turfs
/turf/simulated/floor/jungle/rock
	bushes_spawn = 0
	small_trees = 0
	plants_spawn = 0
	density = 1
	opacity = 1
	name = "impassable rock wall"
	desc = "A massive wall of natural rock. No point in trying to mine it, try underground."
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock"
//	icon_spawn_state = "rock"
	icon_spawn_state = null
	light_range = 0
	light_power = 0

/turf/simulated/floor/jungle/rock/attackby()
	return

/turf/simulated/floor/jungle/rock/New()
	spawn(1)
		var/turf/T
		if(!istype(get_step(src, NORTH), /turf/simulated/floor/jungle/rock) && !istype(get_step(src, NORTH), /turf/unsimulated/wall))
			T = get_step(src, NORTH)
			if (T)
				T.overlays += image('icons/urist/turf/uristturf.dmi', "rock_side_s")
		if(!istype(get_step(src, SOUTH), /turf/simulated/floor/jungle/rock) && !istype(get_step(src, SOUTH), /turf/unsimulated/wall))
			T = get_step(src, SOUTH)
			if (T)
				T.overlays += image('icons/urist/turf/uristturf.dmi', "rock_side_n", layer=6)
		if(!istype(get_step(src, EAST), /turf/simulated/floor/jungle/rock) && !istype(get_step(src, EAST), /turf/unsimulated/wall))
			T = get_step(src, EAST)
			if (T)
				T.overlays += image('icons/urist/turf/uristturf.dmi', "rock_side_w", layer=6)
		if(!istype(get_step(src, WEST), /turf/simulated/floor/jungle/rock) && !istype(get_step(src, WEST), /turf/unsimulated/wall))
			T = get_step(src, WEST)
			if (T)
				T.overlays += image('icons/urist/turf/uristturf.dmi', "rock_side_e", layer=6)
		update_light()

/turf/simulated/floor/jungle/water
	bushes_spawn = 0
	small_trees = 0 //fucking rivers winning the small tree RNG
	plants_spawn = 0 //until I get a metric for spawning reeds only
	reeds_spawn = 1 //get dem reeds boi
	name = "sea water"
	desc = "Clear sea water"
	icon = 'icons/urist/jungle/turfs.dmi'
	icon_state = "rivernew"
	var/fishleft = 3 //how many fish are left? todo: replenish this shit over time
	var/fishing = 0 //are we fishing
	var/busy = 0

/turf/simulated/floor/jungle/water/deep/New()
	..()
	fishleft = rand(1,6)

/turf/simulated/floor/jungle/water/deep/attackby(var/obj/item/I, mob/user as mob)
	if(istype(I, /obj/item/weapon/fishingrod))
		if(fishleft && !fishing)
			if(prob(1))
				to_chat(user, "<span class='notice'>Cast away, it's time to catch some fucking fish, because why the fuck not.</span>")

			else
				to_chat(user, "<span class='notice'>You cast your line into the water. Hold still and hopefully you can catch some fish.</span>")

			var/obj/item/weapon/fishingrod/F = I
			var/fishtime = (rand(40,140)) //test this shit
			fishtime *= F.fishingpower //here we account for using shitty improvised fishing rods, which increase the time
			fishing = 1

			if (do_after(user, fishtime, src))
				to_chat(user, "<span class='notice'>You feel a tug on your line!</span>")
				src.overlays += image('icons/urist/jungle/turfs.dmi', "exclamation", layer=2.1)	//exclamation mark
				fishing = 2
				var/tempfish = fishleft
				spawn(rand(35,70))
					if(fishing && fishleft == tempfish)
						to_chat(user, "<span class='notice'>Looks like it got away...</span>")
						fishing = 0
						src.overlays -= image('icons/urist/jungle/turfs.dmi', "exclamation", layer=2.1)

		else if(fishleft && fishing == 2)
			var/obj/item/F

			if(prob(1))
				F = new	/obj/item/weapon/beartrap(user.loc)
			else
				F = new/obj/item/fish(user.loc)

			src.overlays -= image('icons/urist/jungle/turfs.dmi', "exclamation", layer=2.1)
			fishleft -= 1
			fishing = 0
			user << "<span class='notice'>You yank on your line, pulling up [F]!</span>"

		else if(!fishleft)
			to_chat(user, "<span class='notice'>You've fished too much in this area, try fishing somewhere else.</span>")
			return

/turf/simulated/floor/jungle/water/Entered(atom/movable/O)
	..()
	if(density) //to account for deep water
		return

	else if(istype(O, /mob/living/))
		var/mob/living/M = O
		//slip in the murky water if we try to run through it
		if(prob(10 + (M.m_intent == "run" ? 40 : 0)))
			M << pick("<span class='notice'> You slip on something slimy.</span>","<span class='notice'> You fall over into the murk.</span>")
			M.Stun(2)
			M.Weaken(1)

		//piranhas - 25% chance to be an omnipresent risk, although they do practically no damage
		if(prob(25)) //however, I'm going to bump up the risk soon, and add a buildable bridge.
			M << "<span class='notice'> You feel something slithering around your legs.</span>"
			spawn(rand(25,50))
				M << pick("<span class='warning'> Something sharp bites you!</span>","<span class='warning'> Sharp teeth grab hold of you!</span>","<span class='warning'> You feel something bite into your leg!</span>")
				M.apply_damage(rand(3,5), BRUTE, sharp=1)


/turf/simulated/floor/jungle/water/deep
	plants_spawn = 0
	density = 1
	reeds_spawn = 0 //too deep for reeds
	icon_state = "deepnew"
//	icon_spawn_state = "deepnew"


/turf/simulated/floor/jungle/water/edge
	name = "sea water"
	desc = "Clear sea water"
	icon = 'icons/urist/jungle/turfs.dmi'
	icon_state = "test"
	icon_spawn_state = null

/turf/simulated/floor/jungle/clear/underground
	name = "dirt"
	icon = 'icons/turf/floors.dmi'
	icon_state = "asteroid"
	light_range = 0
	light_power = 0

//King&Cunt

/turf/simulated/floor/jungle/king/New()

	update_light()

/turf/simulated/floor/jungle/king
	name = "dirt"
	desc = "It's dirt."
	icon = 'icons/king/dirt.dmi'
	icon_state = "full"
	initial_flooring = null
	temperature = T20C
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	var/dug = 0       //0 = has not yet been dug, 1 = has already been dug
	var/overlay_detail
	has_resources = 1

/turf/simulated/floor/jungle/king/is_plating()
	return 1


/turf/simulated/floor/jungle/king/grass
	name = "grass"
	desc = "Thick grass."
	icon = 'icons/king/grass.dmi'
	icon_state = "full"
	temperature = T20C
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD

/turf/simulated/floor/jungle/king/cobble
	name = "cobble stone"
	desc = "It's a set of rocks put together. One might even say cobbled together."
	icon = 'icons/king/Cobblestone.dmi'
	icon_state = "cobblestone"
	temperature = T20C
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD

obj/effect/decal/jungle/king/grass
	name = "grass"
	desc = "Thick grass."
	icon = 'icons/king/grass.dmi'
	icon_state = "full"
	layer = -997

obj/effect/decal/jungle/king/dirt
	name = "dirt"
	desc = "It's dirt."
	icon = 'icons/king/dirt.dmi'
	icon_state = "full"
	layer = -997
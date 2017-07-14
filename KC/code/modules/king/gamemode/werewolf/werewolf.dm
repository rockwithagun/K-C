/datum/game_mode/werewolf
	antag_tags = list(MODE_WEREWOLF)
	name = "Werewolf"
	round_description = "There are Vampires from Space Transylvania on the station!"
	extended_round_description = "Posing as ordinary crewmembers, unholy creatures have infiltrated the station! Keep your blood close and neck safe!"
	config_tag = "werewolf"
	required_players = 1
	required_enemies = 1
	end_on_antag_death = 0
	antag_scaling_coeff = 7


/datum/werewolf
	var/sanitytotal = 0
	var/sanityusable = 0
	var/mob/living/owner = null
	var/gender = FEMALE
	var/list/powers = list() // list of available powers and passives, see defines in setup.dm
	var/nullified = 0 //Nullrod makes them useless for a short while.
	var/torpor = 0 // handles coffinsleep

/datum/werewolf/New(gend = FEMALE)
	gender = gend

/mob/proc/make_werewolf()
	if(!mind)				return
	if(!mind.werewolf)
		mind.werewolf = new /datum/werewolf(gender)
		mind.werewolf.owner = src
	if(!mind in were.current_antagonists)
		were.add_antagonist(src.mind)

	verbs += /mob/proc/changeling_lesser_form
	verbs += /mob/proc/changeling_lesser_transform

	for(var/i = 1; i <= 3; i++)
		if(!(i in mind.werewolf.powers))
			mind.werewolf.powers.Add(i)

/*
	for(var/n in mind.werewolf.powers)
		switch(n)
			if(WERE_POWER1)
				verbs += /client/proc/werewolf_shapeshift
			if(WERE_POWER2)
				verbs += /client/proc/werewolf_roar
//			if(WERE_POWER3)
//				verbs += /client/proc/vampire_disease
			if(WERE_FULL)
				continue

/mob/proc/remove_werewolf_powers()

	verbs -= /client/proc/werewolf_shapeshift
	verbs -= /client/proc/werewolf_roar


/mob/proc/handle_sanity(mob/living/carbon/human/H)
	var/sanity = 0
	var/sanitytotal = 0 //used to see if we increased our sanity total
	var/sanityusable = 0 //used to see if we increased our sanity usable

/mob/proc/handle_sanity/tick()
	sanity += 1
	src.mind.werewolf.sanitytotal += sanity


/mob/proc/check_werewolf_upgrade(datum/mind/v)
	if(!v) return
	if(!v.werewolf) return
	var/datum/werewolf/were = v.werewolf
	var/list/old_powers = were.powers.Copy()

	// TIER 1
	if(were.sanitytotal >= 100)
		if(!(WERE_POWER1 in were.powers))
			were.powers.Add(WERE_POWER1)

	// TIER 2
	if(were.sanitytotal >= 150)
		if(!(WERE_POWER2 in were.powers))
			were.powers.Add(WERE_POWER2)


	announce_new_power(old_powers, were.powers)

/mob/proc/announce_new_powers(list/old_powers, list/new_powers)
	for(var/n in new_powers)
		if(!(n in old_powers))
			switch(n)
				if(WERE_POWER1)
					src << "<span class='notice'> You have gained the shapeshifting ability, at the cost of stored blood you can change your form permanently.</span>"
					verbs += /client/proc/vampire_shapeshift
				if(WERE_POWER2)
					src << "<span class='notice'> Your vampiric vision has improved.</span>"
					verbs += /client/proc/vampire_shapeshift
				if(WERE_POWER3)
					src << "<span class='notice'> Your vampiric vision has improved.</span>"
					verbs += /client/proc/vampire_shapeshift
				if(WERE_FULL)
					src << "<span class='notice'> You have reached your full potential and are no longer weak to the effects of anything holy and your vision has been improved greatly.</span>"
					//no verb

/datum/antagonist/werewolf/remove_antagonist(var/datum/mind/player, var/show_message, var/implanted)
	player.current.remove_werewolf_powers()
	..()
*/

/mob/living/carbon/human/proc/handle_werewolf()
//removed blood HUD code here, because of it causing Bad Things clientside, moved it to Status tab.
	mind.werewolf.nullified = max(0, mind.werewolf.nullified - 1)

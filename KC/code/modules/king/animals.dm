/mob/living/simple_animal/hostile/wolf
	name = "wolf"
	desc = "You should know what a wolf is."
	icon = 'icons/mob/animal.dmi'
	icon_state = "wolf"
	icon_living = "wolf"
	icon_dead = "wolf_dead"
	icon_gib = null
	speak = list("RAWR!","Rawr!","GRR!","Growl!")
	speak_emote = list("growls", "roars")
	emote_hear = list("rawrs","grumbles","grawls")
	emote_see = list("stares ferociously", "stomps")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	stop_automated_movement_when_pulled = 0
	maxHealth = 25
	health = 25

	harm_intent_damage = 2
	melee_damage_lower = 3
	melee_damage_upper = 10
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'

	faction = "undead"
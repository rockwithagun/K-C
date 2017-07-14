var/datum/antagonist/werewolf/were

/proc/iswerewolf(var/mob/player)
	if(!were || !player.mind)
		return 0
	if(player.mind in were.current_antagonists)
		return 1

/datum/antagonist/werewolf
	id = MODE_WEREWOLF
	role_text = "Werewolf"
	role_text_plural = "Werewolves"
	feedback_tag = "werewolf_objective"
	restricted_jobs = list("Chaplain")
	protected_jobs = list(null)
	welcome_text = "TODO, avoid the Slayer."
	flags = ANTAG_SUSPICIOUS | ANTAG_RANDSPAWN
	antag_indicator = null
	initial_spawn_req = 1
	initial_spawn_target = 1
	hard_cap = 999	//should be able to multiply freely, if costs are met
	hard_cap_round = 3
	faction = "undead"


/datum/antagonist/werewolf/New()
	..()
	were = src

/datum/antagonist/werewolf/update_antag_mob(var/datum/mind/player)
	..()
	player.current.make_werewolf()

/datum/antagonist/werewolf/add_antagonist(var/datum/mind/player)
	. = ..()
	if(.)
		player.current.make_werewolf()

/datum/antagonist/werewolf/remove_antagonist(var/datum/mind/player)
	player.werewolf = null
	..()

/datum/antagonist/werewolf/create_objectives(var/datum/mind/werewolf)
	if(!..())
		return

	var/datum/objective/assassinate/kill_objective = new
	kill_objective.owner = werewolf
	kill_objective.find_target()
	werewolf.objectives += kill_objective


	var/datum/objective/survive/survive_objective = new
	survive_objective.owner = werewolf
	werewolf.objectives += survive_objective
	return

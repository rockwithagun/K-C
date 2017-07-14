var/datum/antagonist/renegade/renegades

/datum/antagonist/renegade
	role_text = "Renegade"
	role_text_plural = "Renegades"
	welcome_text = "Shouldn't see this"

	antag_text = "You are a <b>minor</b> antagonist! Within the rules, \
		try to protect yourself and what's important to you. You aren't here to cause trouble, \
		you're just more willing (and equipped) to go to extremes to stop it than others are. \
		Your job is to somewhat oppose the other antagonists, should they threaten you, in ways that aren't quite legal themselves. \
		Try to make sure other players have <i>fun</i>! If you are confused or at a loss, always adminhelp, \
		and before taking extreme actions, please try to also contact the administration! \
		Think through your actions and make the roleplay immersive! <b>Please remember all \
		rules aside from those without explicit exceptions apply to antagonists.</b>"

	id = MODE_RENEGADE
	flags = ANTAG_SUSPICIOUS | ANTAG_IMPLANT_IMMUNE | ANTAG_RANDSPAWN | ANTAG_VOTABLE
	hard_cap = 2
	hard_cap_round = 5

	hard_cap = 2
	hard_cap_round = 5
	initial_spawn_req = 3
	initial_spawn_target = 6


/datum/antagonist/renegade/New()
	..()
	renegades = src

	welcome_text = pick(
	"You keep hearing talk about something called 'Cthulhu Mythos.' You're not sure what it is, but you want to stay staff.",
	"Something's going to go wrong today, you can just feel it.")

/datum/antagonist/renegade/create_objectives(var/datum/mind/player)

	if(!..())
		return

	var/datum/objective/survive/survive = new
	survive.owner = player
	player.objectives |= survive

	var/datum/objective/happens/happens_objective = new
	happens_objective.owner = player
	player.objectives += happens_objective
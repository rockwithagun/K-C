/datum/game_mode/extended
	name = "Extended"
	config_tag = "extended"
	required_players = 0
	round_description = "Enjoy yourself and role-play."
	extended_round_description = "There will be antags."
	addantag_allowed = ADDANTAG_ADMIN // No add antag vote allowed on extended, except when manually called by admins.
	antag_tags = list(MODE_VAMPIRE, MODE_TRAITOR)
	latejoin_antag_tags = list(MODE_TRAITOR)
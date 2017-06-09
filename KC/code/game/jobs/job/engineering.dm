/datum/job/chief_engineer
	title = "Foreman Construction Adviser"
	head_position = 1
	department = "Engineering"
	department_flag = ENG|COM
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the duke"
	selection_color = "#7f6e2c"
	req_admin_notify = 1
	economic_modifier = 10
	ideal_character_age = 50
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/engineering/foreman
	announced = 0

/datum/job/engineer
	title = "Builder"
	department = "Engineering"
	department_flag = ENG
	faction = "Station"
	total_positions = 8
	spawn_positions = 7
	supervisors = "the Foreman"
	selection_color = "#5b4d20"
	economic_modifier = 5
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/engineering/builder

/datum/job/lumber
	title = "Woodsmen"
	department = "Engineering"
	department_flag = ENG
	faction = "Station"
	total_positions = 8
	spawn_positions = 7
	supervisors = "the Foreman"
	selection_color = "#5b4d20"
	economic_modifier = 5
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/engineering/lumberjack

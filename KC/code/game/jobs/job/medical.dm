/datum/job/cmo
	title = "Royal Alchemist"
	head_position = 1
	department = "Medical"
	department_flag = MED|COM
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Mayor"
	selection_color = "#026865"
	req_admin_notify = 1
	economic_modifier = 10
	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/courtphysician
	announced = 0

/datum/job/doctor
	title = "Barber-Surgeon"
	department = "Medical"
	department_flag = MED
	faction = "Station"
	minimal_player_age = 3
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Mayor"
	selection_color = "#013d3b"
	economic_modifier = 7
	outfit_type = /decl/hierarchy/outfit/job/doctorbarber

/*
/datum/job/chemist
	title = "Plague Doctor"
	department = "Medical"
	department_flag = MED
	faction = "Station"
	minimal_player_age = 0
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Mayor"
	selection_color = "#013d3b"
	economic_modifier = 5
	outfit_type = /decl/hierarchy/outfit/job/plague
*/

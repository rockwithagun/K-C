var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Mayor"
	department = "Command"
	head_position = 1
	department_flag = COM
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Yourself"
	selection_color = "#1d1d4f"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	economic_modifier = 20

	ideal_character_age = 70 // Old geezer captains ftw
	outfit_type = /decl/hierarchy/outfit/duke
	announced = 0

/datum/job/captain/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

/datum/job/captain/get_access()


/datum/job/hop
	title = "Mayor Advisor"
	head_position = 1
	department_flag = COM|CIV
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Mayor"
	selection_color = "#2f2f7f"
	req_admin_notify = 1
	minimal_player_age = 14
	economic_modifier = 10
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/senioradvisor
	announced = 0
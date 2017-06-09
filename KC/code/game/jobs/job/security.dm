/datum/job/hos
	title = "Captain of the Guard"
	head_position = 1
	department = "Security"
	department_flag = SEC|COM
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the duke"
	selection_color = "#8e2929"
	alt_titles = list("Military Adviser", "Field marshal")
	req_admin_notify = 1
	economic_modifier = 10
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/security/cotg
	announced = 0

/datum/job/warden
	title = "Jailer"
	department = "Security"
	department_flag = SEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captian of the Guard"
	selection_color = "#601c1c"
	alt_titles = list("Prison Steward")
	economic_modifier = 5
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/security/jailer

/datum/job/officer
	title = "Guard"
	department = "Security"
	department_flag = SEC
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Captian of the Guard"
	selection_color = "#601c1c"
	economic_modifier = 4
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/security/guard

/datum/job/slayer
	title = "Slayer"
	department = "Security"
	department_flag = SEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	slayer = 1
	supervisors = "the Duke"
	selection_color = "#601b4b"
	economic_modifier = 4
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/security/slayer

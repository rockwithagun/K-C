//Food

/datum/job/chef
	title = "Butcher"
	department = "Service"
	department_flag = SRV
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the duke"
	selection_color = "#b23939"
	alt_titles = list("Cook")
	outfit_type = /decl/hierarchy/outfit/butcher

/datum/job/hydro
	title = "Farmer"
	department = "Service"
	department_flag = SRV
	faction = "Station"
	total_positions = 2
	spawn_positions = 1
	supervisors = "the duke"
	selection_color = "#627749"
	alt_titles = list("Planter")
	outfit_type = /decl/hierarchy/outfit/farmer

/datum/job/innkeeper
	title = "Innkeeper"
	department = "Service"
	department_flag = SRV
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the duke"
	selection_color = "#63472a"
	outfit_type = /decl/hierarchy/outfit/innkeeper

/datum/job/hunter
	title = "Hunter"
	department = "Service"
	department_flag = SRV
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the duke"
	selection_color = "#63472a"
	outfit_type = /decl/hierarchy/outfit/job/hunter

//Cargo

/datum/job/mining
	title = "Blacksmith"
	department = "Supply"
	department_flag = SUP
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Duke"
	selection_color = "#635C4D"
	economic_modifier = 5
	outfit_type = /decl/hierarchy/outfit/job/blacksmith

/datum/job/mining
	title = "Miner"
	department = "Supply"
	department_flag = SUP
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Blacksmith"
	selection_color = "#515151"
	economic_modifier = 5
	alt_titles = list("Prospector")
	outfit_type = /decl/hierarchy/outfit/job/miner
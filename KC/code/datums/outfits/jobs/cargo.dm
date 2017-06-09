/decl/hierarchy/outfit/job/cargo
	l_ear = /obj/item/device/radio/headset/headset_cargo
	hierarchy_type = /decl/hierarchy/outfit/job/cargo

/decl/hierarchy/outfit/job/cargo/mining
	name = OUTFIT_JOB_NAME("Shaft miner")
	uniform = /obj/item/clothing/under/rank/miner
	backpack = /obj/item/weapon/storage/backpack/industrial
	satchel_one  = /obj/item/weapon/storage/backpack/satchel_eng
	pda_type = /obj/item/device/pda/shaftminer
	backpack_contents = list(/obj/item/weapon/crowbar = 1, /obj/item/weapon/storage/ore = 1)
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

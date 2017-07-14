// Gloves
/datum/gear/gloves
	cost = 2
	slot = slot_gloves
	sort_category = "Gloves and Handwear"
	category = /datum/gear/gloves

/datum/gear/gloves/colored
	display_name = "gloves, colored"
	flags = GEAR_HAS_COLOR_SELECTION
	path = /obj/item/clothing/gloves/color

/datum/gear/gloves/evening
	display_name = "gloves, evening"
	path = /obj/item/clothing/gloves/color/evening
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/gloves/ring
	display_name = "ring"
	path = /obj/item/clothing/ring
	cost = 2

/datum/gear/gloves/ring/New()
	..()
	var/ringtype = list()
	ringtype["engagement ring"] = /obj/item/clothing/ring/engagement
	ringtype["signet ring"] = /obj/item/clothing/ring/seal/signet
	ringtype["masonic ring"] = /obj/item/clothing/ring/seal/mason
	ringtype["ring, bronze"] = /obj/item/clothing/ring/material/bronze
	ringtype["ring, silver"] = /obj/item/clothing/ring/material/silver
	ringtype["ring, gold"] = /obj/item/clothing/ring/material/gold
	ringtype["ring, glass"] = /obj/item/clothing/ring/material/glass
	ringtype["ring, wood"] = /obj/item/clothing/ring/material/wood
	gear_tweaks += new/datum/gear_tweak/path(ringtype)
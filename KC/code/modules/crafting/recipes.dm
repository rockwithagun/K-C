
/datum/crafting_recipe
	var/name = "" //in-game display name
	var/reqs[] = list() //type paths of items consumed associated with how many are needed
	var/result //type path of item resulting from this craft
	var/tools[] = list() //type paths of items needed but not consumed
	var/time = 30 //time in deciseconds
	var/parts[] = list() //type paths of items that will be placed in the result
	var/chem_catalysts[] = list() //like tools but for reagents
	var/category = CAT_NONE //where it shows up in the crafting UI

/datum/crafting_recipe/test
	name = "pick"
	result = /obj/item/weapon/pickaxe/silver
	reqs = list(/obj/item/stack/material/iron = 1, /obj/item/stack/rods = 1)
//	tools = list(/obj/item/weapon/wrench, /obj/item/weapon/screwdriver)
	category = CAT_MISC

/datum/crafting_recipe/toysword
	name = "Toy Sword"
	reqs = list(/obj/item/weapon/light/bulb = 1, /obj/item/stack/cable_coil = 1)
	result = /obj/item/toy/sword
	category = CAT_MISC

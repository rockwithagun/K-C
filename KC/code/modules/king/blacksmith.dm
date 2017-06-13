/obj/structure/smelter
	name = "furnace"
	desc = "A pretty hot furnance. Care while using."
	icon = 'icons/king/blacksmithing.dmi'
	icon_state = "furnace"
	density = 1
	anchored = 1

/obj/structure/smelter/attackby(obj/item/W, mob/user, var/click_params)
	if(istype(W, /obj/item/weapon/ore/iron))
		user.drop_item(W)
		playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
		qdel(W)
		sleep(180)
		visible_message("<span class='notice'>The ore finished smelting.</span>")
		var/obj/item/weapon/ore/king/iron/I = new()
		I.forceMove(get_turf(src))

	else if(istype(W, /obj/item/weapon/ore/gold))
		user.drop_item(W)
		playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
		qdel(W)
		sleep(200)
		visible_message("<span class='notice'>The ore finished smelting.</span>")
		var/obj/item/weapon/ore/king/gold/I = new()
		I.forceMove(get_turf(src))

	else if(istype(W, /obj/item/weapon/ore/silver))
		user.drop_item(W)
		playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
		qdel(W)
		sleep(190)
		visible_message("<span class='notice'>The ore finished smelting.</span>")
		var/obj/item/weapon/ore/king/silver/I = new()
		I.forceMove(get_turf(src))

	else if(istype(W, /obj/item/weapon/ore/diamond))
		user.drop_item(W)
		playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
		qdel(W)
		sleep(220)
		visible_message("<span class='notice'>The ore finished smelting.</span>")
		var/obj/item/stack/material/diamond/I = new()
		I.forceMove(get_turf(src))

	else if(istype(W, /obj/item/weapon/ore/glass))
		user.drop_item(W)
		playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
		qdel(W)
		sleep(150)
		visible_message("<span class='notice'>The ore finished smelting.</span>")
		var/obj/item/stack/material/sandstone/I = new()
		I.forceMove(get_turf(src))

	else
		..()

/obj/structure/smelter/object
	name = "furnace"
	desc = "The furnace wall, warm to the touch."
	icon = 'icons/king/furnace.dmi'
	icon_state = "furnace"
	density = 0
	anchored = 1


//
//Hammer
//
/obj/item/weapon/hammer
	name = "hammer"
	desc = "Hmm it's shaped like a hammer, I wonder what it could be?"
	icon = 'icons/obj/items.dmi'
	icon_state = "hammer"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 7.0
	throwforce = 5.0
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 150)
	center_of_mass = "x=17;y=16"
	attack_verb = list("bashed", "battered", "bludgeoned", "whacked")

/obj/item/weapon/hammer/smithing
	name = "smithing hammer"
	desc = "Hmm it's shaped like a hammer, I wonder what it could be?"
	icon_state = "hammers"

//THANKS ZUHAYR FOR CRAFTING CODE
//
//Crafting
//
var/list/techniques = list(
	"Longsword" = list("path" = /obj/item/weapon/material/sword/king/longsword,  "cost" = 10),
	"Saber" = list("path" = /obj/item/weapon/material/sword/king/saber, "cost" = 5),
	"Knife" = list("path" = /obj/item/weapon/material/sword/king/knife, "cost" = 3),
	"Pickaxe" = list("path" = /obj/item/weapon/pickaxe/silver, "cost" = 7),
	"Axe" = list("path" = /obj/item/weapon/material/twohanded/fireaxe, "cost" = 10),
	"Rapier" = list("path" = /obj/item/weapon/material/sword/king/rapier, "cost" = 7)
	)


/obj/item/stack/material/proc/metal_technique(var/mob/user)

	var/technique = input("Select an item to forge..","Techniques") as null|anything in techniques

	var/list/build_data = techniques[technique]
	if(!islist(build_data) || !ispath(build_data["path"]))
		return

	if(get_amount() < build_data["cost"])
		user << "There is not enough material in this stack to make that."
		return

	if(!do_after(user, 300, src))
		return

	var/building_path = build_data["path"]
	new building_path(get_turf(src), material.name)
	use(build_data["cost"])


/*
	if("Upsetting")
		dostuff
*/


//THANKS TO NAX FOR DOING MAJORITY OF THE STUFF.

//
//ORE
//
/obj/item/weapon/ore/king
	name = "hot ingot"
	desc = "A hot ingot. Duh."
	icon = 'icons/king/blacksmithing.dmi'
	icon_state = "iron"
	var/busy
	var/output

/obj/item/weapon/ore/king/New()
	..()
	spawn(2400) //Four minutes
		new output(get_turf(src))
		qdel(src)


/obj/item/weapon/ore/king/attackby(obj/item/W, mob/user, var/click_params)
	if((istype(W, /obj/item/weapon/hammer)) && (locate(/obj/structure/anvil) in loc))
		if(!busy)
			busy = 1
			playsound(loc, 'sound/king/metalsmack.ogg', 100, 20, 20)
			if(do_after(user, 10, src)) //One second
				to_chat(usr, "<font color='red'>You hit the [name]!</font>")

				if(prob(25))
					new output(get_turf(src))
					to_chat(usr, "<font color='red'>The [name] forms.</font>")
					qdel(src)

				else if(prob(2))
					new /obj/item/weapon/ore/slag(get_turf(src))
					to_chat(usr, "<font color='red'>The [name] forms into a block of slag...</font>")
					qdel(src)

			else
				to_chat(usr, "<font color='red'>You must stand still while hammering the [name]!</font>")
	busy = 0

/obj/item/weapon/ore/king/iron
	name = "hot iron"
	desc = "A hot piece of iron. Duh."
	icon = 'icons/king/blacksmithing.dmi'
	output = /obj/item/stack/material/iron

/obj/item/weapon/ore/king/gold
	name = "hot gold"
	desc = "A hot piece of gold. Duh."
	icon = 'icons/king/blacksmithing.dmi'
	icon_state = "gold"
	output = /obj/item/stack/material/gold

/obj/item/weapon/ore/king/silver
	name = "hot silver"
	desc = "A hot piece of silver. Duh."
	icon = 'icons/king/blacksmithing.dmi'
	icon_state = "silver"
	output = /obj/item/stack/material/silver


//
//Anvil
//
/obj/structure/anvil
	name = "anvil"
	icon = 'icons/king/blacksmithing.dmi'
	icon_state = "anvil"
	density = 1
	anchored = 1

/obj/structure/anvil/attackby(obj/item/W, mob/user)
	user.drop_from_inventory(W, src.loc)


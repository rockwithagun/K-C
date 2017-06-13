//PARTS

/obj/item/weapon/gunsmith/stock
	name = "error"
	icon = 'icons/king/gunsmith.dmi'
	icon_state = null
	slot_flags = SLOT_BELT
	force = 4.0
	throwforce = 3.0

/obj/item/weapon/gunsmith/stock/long
	name = "long rifle stock"
	desc = "It's a stock, for a rifle."
	icon_state = "longrifle1"

/obj/item/weapon/gunsmith/stock/short
	name = "short rifle stock"
	desc = "It's a stock, for a rifle."
	icon_state = "shortrifle1"

/obj/item/weapon/gunsmith/stock/flintlock
	name = "flintlock stock"
	desc = "It's a stock, for a flintlock."
	icon_state = "flintlock1"
/////////////////////////////////////
/obj/item/weapon/gunsmith/barrel
	name = "error"
	icon = 'icons/king/gunsmith.dmi'
	icon_state = null
	slot_flags = SLOT_BELT
	force = 5.0
	throwforce = 3.0

/obj/item/weapon/gunsmith/barrel/long
	name = "long rifle barrel"
	desc = "It's a barrel, for a rifle."
	icon_state = "riflebarrel"

/obj/item/weapon/gunsmith/barrel/short
	name = "short rifle barrel"
	desc = "It's a barrel, for a rifle."
	icon_state = "riflebarrel"

/obj/item/weapon/gunsmith/barrel/flintlock
	name = "flintlock barrel"
	desc = "It's a barrel, for a flintlock."
	icon_state = "flintlockbarrel"

/obj/item/weapon/gunsmith/parts
	name = "gun parts"
	desc = "Some finishing gun parts."
	icon = 'icons/king/gunsmith.dmi'
	icon_state = "parts"
/////////////////////////////////////
/obj/item/weapon/gunsmith/gun2
	name = "error"
	icon = 'icons/king/gunsmith.dmi'
	icon_state = null
	slot_flags = SLOT_BELT
	force = 4.0
	throwforce = 3.0

/obj/item/weapon/gunsmith/gun2/long
	name = "long rifle half-built"
	desc = "It's a half-built rifle."
	icon_state = "longrifle2"

/obj/item/weapon/gunsmith/gun2/short
	name = "short rifle half-built"
	desc = "It's a half-built rifle."
	icon_state = "shortrifle2"

/obj/item/weapon/gunsmith/gun2/flintlock
	name = "flintlock half-built"
	desc = "It's a half-built flintlock."
	icon_state = "flintlock2"
/////////////////////////////////////
//CRAFTING
/////////////////////////////////////
var/list/guntechniques = list(
	"long rifle barrel" = list("path" = /obj/item/weapon/gunsmith/barrel/long,  "cost" = 15),
	"short rifle barrel" = list("path" = /obj/item/weapon/gunsmith/barrel/short, "cost" = 12),
	"flintlock barrel" = list("path" = /obj/item/weapon/gunsmith/barrel/flintlock, "cost" = 10),
	"gun parts" = list("path" = /obj/item/weapon/gunsmith/parts, "cost" = 5)
	)

/obj/item/stack/material/iron/proc/gun_technique(var/mob/user)

	var/technique = input("Select an item to forge..","Techniques") as null|anything in guntechniques

	var/list/build_data = guntechniques[technique]
	if(!islist(build_data) || !ispath(build_data["path"]))
		return

	if(get_amount() < build_data["cost"])
		user << "There is not enough material in this stack to make that."
		return

	if(!do_after(user, 150, src))
		return

	var/building_path = build_data["path"]
	new building_path(get_turf(src), material.name)
	use(build_data["cost"])
/////////////////////////////////////
/obj/item/weapon/gunsmith/stock/long/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gunsmith/barrel/long))
		var/obj/item/weapon/gunsmith/gun2/long/I = new()
		I.forceMove(get_turf(src))
		to_chat(user, "You put the barrel onto the stock.")
		qdel(W)
		qdel(src)
	else
		..()

/obj/item/weapon/gunsmith/stock/short/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gunsmith/barrel/short))
		var/obj/item/weapon/gunsmith/gun2/short/I = new()
		I.forceMove(get_turf(src))
		to_chat(user, "You put the barrel onto the stock.")
		qdel(W)
		qdel(src)
	else
		..()

/obj/item/weapon/gunsmith/stock/flintlock/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gunsmith/barrel/flintlock))
		var/obj/item/weapon/gunsmith/gun2/flintlock/I = new()
		I.forceMove(get_turf(src))
		to_chat(user, "You put the barrel onto the stock.")
		qdel(W)
		qdel(src)
	else
		..()
/////////////////////////////////////
/obj/item/weapon/gunsmith/gun2/long/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gunsmith/parts))
		var/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/king/I = new()
		I.forceMove(get_turf(src))
		to_chat(user, "You put the parts onto the unfinished gun.")
		qdel(W)
		qdel(src)
	else
		..()

/obj/item/weapon/gunsmith/gun2/short/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gunsmith/parts))
		var/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/king/short/I = new()
		I.forceMove(get_turf(src))
		to_chat(user, "You put the parts onto the unfinished gun.")
		qdel(W)
		qdel(src)
	else
		..()

/obj/item/weapon/gunsmith/gun2/flintlock/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gunsmith/parts))
		var/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/king/flintlock/I = new()
		I.forceMove(get_turf(src))
		to_chat(user, "You put the parts onto the unfinished gun.")
		qdel(W)
		qdel(src)
	else
		..()
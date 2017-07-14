/obj/item/ammo_casing/king
	desc = "A ball for a long rifle."
	caliber = "balllong"
	projectile_type = /obj/item/projectile/bullet/rifle/king
	icon = 'icons/king/gunsmith.dmi'
	icon_state = "bullet"
	spent_icon = "bullet-left"

/obj/item/ammo_casing/king/short
	desc = "A ball for a short rifle."
	caliber = "ballshort"
	projectile_type = /obj/item/projectile/bullet/rifle/king/short
	icon_state = "bullets"

/obj/item/ammo_casing/king/flintlock
	desc = "A ball for a flintlock."
	caliber = "ballflintlock"
	projectile_type = /obj/item/projectile/bullet/rifle/king/flintlock
	icon_state = "bulletf"

//

/obj/item/projectile/bullet/rifle/king
	icon = 'icons/king/gunsmith.dmi'
	icon_state = "bullet-fire"
	fire_sound = 'sound/weapons/gunshot/gunshot3.ogg'
	damage = 30
	armor_penetration = 25

/obj/item/projectile/bullet/rifle/king/short
	damage = 22
	armor_penetration = 15

/obj/item/projectile/bullet/rifle/king/flintlock
	damage = 15
	armor_penetration = 5

//

/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/king
	name = "long rifle"
	desc = "It's a long rifle"
	icon = 'icons/king/gunsmith.dmi'
	icon_state = "longrifle"
	item_state = "mosin"
	caliber = "balllong"
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rifle_load.ogg'
	casingsound = 'sound/weapons/guns/misc/casingfall1.ogg'
	pumpsound = 'sound/weapons/boltpump.ogg'
	ammo_type = /obj/item/ammo_casing/king
	w_class = ITEM_SIZE_NORMAL
	max_shells = 1
	var/datum/effect/effect/system/smoke_spread/bad/smoke

/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/king/handle_post_fire(mob/user, atom/target)
	var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
	smoke.set_up(1,0, src.loc, 0)
	smoke.start()
	..()
	if(chambered)
		chambered.expend()
		process_chambered()

/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/king/short
	name = "short rifle"
	desc = "It's a short rifle"
	icon = 'icons/king/gunsmith.dmi'
	icon_state = "shortrifle"
	item_state = "mosin"
	caliber = "ballshort"
	ammo_type = /obj/item/ammo_casing/king
	w_class = ITEM_SIZE_NORMAL

/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/king/flintlock
	name = "flintlock"
	desc = "It's a flintlock, it fires."
	icon = 'icons/king/gunsmith.dmi'
	icon_state = "flintlock"
	item_state = "mosin"
	caliber = "ballflintlock"
	ammo_type = /obj/item/ammo_casing/king
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
//

/obj/item/weapon/storage/bullet
	name = "bullet bag"
	desc = "Leather bag for holding all the bullets you could need."
	icon = 'icons/king/gunsmith.dmi'
	icon_state = "bag"
	slot_flags = SLOT_BELT
	max_storage_space = 200
	max_w_class = ITEM_SIZE_NORMAL
	w_class = ITEM_SIZE_LARGE
	can_hold = list(/obj/item/ammo_casing/king, /obj/item/ammo_casing/king/short, /obj/item/ammo_casing/king/flintlock)
	allow_quick_gather = 1
	allow_quick_empty = 1
	use_to_pickup = 1
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

/obj/item/weapon/gun/projectile/shotgun/pump/boltaction/king/flintlock
	name = "flintlock"
	desc = "It's a flintlock, it fires."
	icon = 'icons/king/gunsmith.dmi'
	icon_state = "flintlock"
	item_state = "mosin"
	caliber = "ballflintlock"
	ammo_type = /obj/item/ammo_casing/king
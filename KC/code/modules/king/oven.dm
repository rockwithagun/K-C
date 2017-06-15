/obj/structure/king/oven
	name = "stone oven"
	desc = "A large stone oven."
	icon = 'icons/king/oven.dmi'
	icon_state = "oven"
	density = 1
	anchored = 1
	var/busy

/obj/structure/king/oven/attackby(obj/item/W, mob/user, var/click_params)
	if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/meat/beef))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(180)
			visible_message("<span class='notice'>The meat finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/meatsteak/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()

	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/meat/goat))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(150)
			visible_message("<span class='notice'>The meat finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/meatsteak/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()

	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/meat/chicken))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(150)
			visible_message("<span class='notice'>The meat finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/meatsteak/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()

	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/meat))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(150)
			visible_message("<span class='notice'>The meat finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/meatsteak/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()

	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/fishmeat))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(150)
			visible_message("<span class='notice'>The meat finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/meatsteak/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()


	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/snacks/king/flour))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(100)
			visible_message("<span class='notice'>The dough finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/dough/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()

	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/dough))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(150)
			visible_message("<span class='notice'>The dough finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/tastybread/bread/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()

	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/rawsticks))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(100)
			visible_message("<span class='notice'>The dough finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/fries/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()

	else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/egg))
		if(!busy)
			busy = 1
			update_icon()
			user.drop_item(W)
			playsound(loc, 'sound/king/furnace.ogg', 100, 5, 5)
			qdel(W)
			sleep(100)
			visible_message("<span class='notice'>The dough finished cooking.</span>")
			var/obj/item/weapon/reagent_containers/food/snacks/friedegg/I = new()
			I.forceMove(get_turf(src))
			busy = 0
			update_icon()

	else
		..()

/obj/structure/king/oven/update_icon()
	if(!busy)
		icon_state = "oven"
	else
		icon_state = "oven-on"

/obj/structure/king/ovenobject
	name = "stone oven"
	desc = "The stone oven, warm to the touch."
	icon = 'icons/king/ovenlarge.dmi'
	icon_state = "oven"
	density = 0
	anchored = 1
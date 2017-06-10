/obj/item/stack/material/wetleather/attackby(obj/item/W, mob/user, var/click_params)
	if(	istype(W, /obj/item/weapon/material/knife) || \
		istype(W, /obj/item/weapon/material/kitchen/utensil/knife) || \
		istype(W, /obj/item/weapon/material/sword) || \
		istype(W, /obj/item/weapon/material/twohanded/fireaxe) || \
		istype(W, /obj/item/weapon/material/hatchet))
		if(!busy)
			busy = 1
			if(do_after(user, 50, src)) //Five seconds
				to_chat(usr, "<font color='red'>You cut the hair off the wet leather.</font>")
				new /obj/item/stack/material/leather(get_turf(src))
				new /obj/item/stack/material/leather(get_turf(src))
				new /obj/item/stack/material/leather(get_turf(src))
				qdel(src)
			else
				to_chat(usr, "<font color='red'>You must stand still while finishing the leather!</font>")
	busy = 0
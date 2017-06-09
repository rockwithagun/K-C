// SEE code/modules/materials/materials.dm FOR DETAILS ON INHERITED DATUM.
// This class of weapons takes force and appearance data from a material datum.
// They are also fragile based on material data and many can break/smash apart.
/obj/item/clothing/suit/armor/king/material
	name = "heavy armour"
	desc = "A heavy suit of armour."
	icon_state = "greyarmour"
	item_state = "greyarmour"
	gender = NEUTER
	armor = list(melee = null)
	w_class = ITEM_SIZE_HUGE//bulky item
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

	var/applies_material_colour = 1
	var/unbreakable
	var/force_divisor = 0.5
	var/thrown_force_divisor = 0.5
	var/default_material = DEFAULT_WALL_MATERIAL
	var/material/material
	var/drops_debris = 1

/obj/item/clothing/suit/armor/king/material/pickup(mob/user)
	. = ..()
	material.pickup(user, src)


/obj/item/clothing/suit/armor/king/material/New(var/newloc, var/material_key)
	..(newloc)
	if(!material_key)
		material_key = default_material
	set_material(material_key)
	if(!material)
		qdel(src)
		return

	matter = material.get_matter()
	if(matter.len)
		for(var/material_type in matter)
			if(!isnull(matter[material_type]))
				matter[material_type] *= force_divisor // May require a new var instead.

/obj/item/clothing/suit/armor/king/material/get_material()
	return material

/obj/item/clothing/suit/armor/king/material/proc/update_force()
	if(edge || sharp)
		force = material.get_edge_damage()
	else if(vampdam)
		force = material.silver_vamp_damage()
	else
		force = material.get_blunt_damage()
	force = round(force*force_divisor)
	throwforce = round(material.get_blunt_damage()*thrown_force_divisor)
	//spawn(1)
//		log_debug("[src] has force [force] and throwforce [throwforce] when made from default material [material.name]")


/obj/item/clothing/suit/armor/king/material/proc/set_material(var/new_material)
	material = get_material_by_name(new_material)
	if(!material)
		qdel(src)
	else
		name = "[material.display_name] [initial(name)]"
		health = round(material.integrity/10)
		if(applies_material_colour)
			color = material.icon_colour
		if(material.products_need_process())
			processing_objects |= src
		if(material.conductive)
			flags |= CONDUCT
		else
			flags &= (~CONDUCT)
		update_force()

/obj/item/clothing/suit/armor/king/material/Destroy()
	processing_objects -= src
	. = ..()

/obj/item/clothing/suit/armor/king/material/apply_hit_effect()
	. = ..()
	if(!unbreakable)
		if(!prob(material.hardness))
			if(material.is_brittle())
				health = 0
			else
				health--
		check_health()

/obj/item/clothing/suit/armor/king/material/proc/check_health(var/consumed)
	if(health<=0)
		shatter(consumed)

/obj/item/clothing/suit/armor/king/material/proc/shatter(var/consumed)
	var/turf/T = get_turf(src)
	T.visible_message("<span class='danger'>\The [src] [material.destruction_desc]!</span>")
	if(istype(loc, /mob/living))
		var/mob/living/M = loc
		M.drop_from_inventory(src)
	playsound(src, "shatter", 70, 1)
	if(!consumed && drops_debris) material.place_shard(T)
	qdel(src)
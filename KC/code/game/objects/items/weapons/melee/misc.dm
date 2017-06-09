/obj/item/weapon/melee/whip
	name = "whip"
	desc = "A generic whip."
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")


/obj/item/weapon/melee/whip/abyssal
	name = "abyssal whip"
	desc = "A weapon from the abyss. Requires 70 attack to wield."
	icon_state = "whip"
	item_state = "whip"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 16 //max hit with 60 strength and no equipment. Duel Arena no No forfeit - Snapshot
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")

/obj/item/weapon/melee/whip/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	icon_state = "chain"
	item_state = "whip"

/obj/item/weapon/material/sword/replica/officersword
	name = "fleet officer's sword"
	desc = "A polished sword issued to officers of the fleet."
	icon_state = "officersword"
	item_state = "officersword"
	slot_flags = SLOT_BELT
	applies_material_colour = FALSE

/obj/item/weapon/material/sword/replica/officersword/marine
	name = "marine NCO's sword"
	desc = "A polished sword issued to SCG Marine NCOs."
	icon_state = "marinesword"

/obj/item/weapon/material/sword/replica/officersword/marineofficer
	name = "marine officer's sword"
	desc = "A curved sword issued to SCG Marine officers."
	icon_state = "marineofficersword"
	item_state = "marineofficersword"

/obj/item/weapon/material/sword/replica/officersword/pettyofficer
	name = "chief petty officer's cutlass"
	desc = "A polished cutlass issued to chief petty officers of the fleet."
	icon_state = "pettyofficersword"
	item_state = "pettyofficersword"

//King&Cunt

/obj/item/weapon/material/sword/king/longsword
	name = "longsword"
	desc = "A polished, straight edged long sword."
	icon_state = "longsword"
	item_state = "pettyofficersword"
	force = 14
	throwforce = 7
	sharp = 1
	edge = 1
	slot_flags = SLOT_BELT
	default_material = "iron"
	force_divisor = 0.3

/obj/item/weapon/material/sword/king/longswordrust
	name = "rusty longsword"
	desc = "A rusted, dull long sword."
	icon_state = "longswordrust"
	item_state = "pettyofficersword"
	force = 14
	throwforce = 3
	sharp = 1
	edge = 1
	slot_flags = SLOT_BELT
	default_material = "iron"
	force_divisor = 0.22

/obj/item/weapon/material/sword/king/saber
	name = "saber"
	desc = "A polished, curved sword."
	icon_state = "sabre"
	item_state = "pettyofficersword"
	force = 9
	throwforce = 5
	sharp = 1
	edge = 1
	default_material = "iron"
	force_divisor = 0.25

/obj/item/weapon/material/sword/king/knife
	name = "knife"
	desc = "A polished knife."
	icon_state = "knife"
	item_state = "pettyofficersword"
	force = 5
	throwforce = 5
	w_class = 2
	sharp = 1
	edge = 1
	default_material = "iron"
	force_divisor = 0.072

/obj/item/weapon/material/sword/king/rapier
	name = "rapier"
	desc = "A polished rapier."
	icon_state = "rapier"
	item_state = "pettyofficersword"
	force = 13
	throwforce = 7
	sharp = 1
	edge = 1
	slot_flags = SLOT_BELT
	default_material = "iron"
	force_divisor = 0.3

/obj/item/weapon/material/sword/king/longsword/silver
	name = "longsword"
	desc = "A polished, straight edged long sword."
	icon_state = "longsword"
	item_state = "pettyofficersword"
	force = 14
	throwforce = 7
	sharp = 1
	edge = 1
	slot_flags = SLOT_BELT
	default_material = "silver"
	force_divisor = 0.3

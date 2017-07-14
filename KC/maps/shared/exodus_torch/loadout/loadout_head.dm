/datum/gear/head
	display_name = "natural philosopher's wig"
	path = /obj/item/clothing/head/philosopher_wig
	slot = slot_head
	sort_category = "Hats and Headwear"

/datum/gear/head/bandana
	display_name = "bandana selection"
	path = /obj/item/clothing/head/bandana

/datum/gear/head/bandana/New()
	..()
	var/bandanas = list()
	bandanas["green bandana"] = /obj/item/clothing/head/greenbandana
	bandanas["orange bandana"] = /obj/item/clothing/head/orangebandana
	bandanas["pirate bandana"] = /obj/item/clothing/head/bandana
	gear_tweaks += new/datum/gear_tweak/path(bandanas)

/datum/gear/head/bow
	display_name = "hair bow"
	path = /obj/item/clothing/head/hairflower/bow
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/hairflower
	display_name = "hair flower pin"
	path = /obj/item/clothing/head/hairflower

/datum/gear/head/formalhat
	display_name = "formal hat selection"
	path = /obj/item/clothing/head/hasturhood

/datum/gear/head/formalhat/New()
	..()
	var/formalhats = list()
	formalhats["boatsman hat"] = /obj/item/clothing/head/boaterhat
	formalhats["bowler hat"] = /obj/item/clothing/head/bowler
	formalhats["top hat"] = /obj/item/clothing/head/that

	gear_tweaks += new/datum/gear_tweak/path(formalhats)

/datum/gear/head/hairflower/New()
	..()
	var/pins = list()
	pins["blue pin"] = /obj/item/clothing/head/hairflower/blue
	pins["pink pin"] = /obj/item/clothing/head/hairflower/pink
	pins["red pin"] = /obj/item/clothing/head/hairflower
	pins["yellow pin"] = /obj/item/clothing/head/hairflower/yellow
	gear_tweaks += new/datum/gear_tweak/path(pins)

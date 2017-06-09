/datum/category_item/underwear/bottom/none
	name = "None"
	always_last = TRUE

/datum/category_item/underwear/bottom/briefs
	name = "Briefs"
	icon_state = "briefs"
	has_color = TRUE

/datum/category_item/underwear/bottom/briefs/is_default(var/gender)
	return gender != FEMALE

/datum/category_item/underwear/bottom/boxers
	name = "Boxers"
	icon_state = "boxers"
	has_color = TRUE

/datum/category_item/underwear/bottom/panties
	name = "Panties"
	icon_state = "panties"
	has_color = TRUE

/datum/category_item/underwear/bottom/panties/is_default(var/gender)
	return gender == FEMALE

/datum/category_item/underwear/bottom/thong
	name = "Thong"
	icon_state = "thong"
	has_color = TRUE

/datum/category_item/underwear/bottom/longjon
	name = "Long John Bottoms"
	icon_state = "ljonb"
	has_color = TRUE
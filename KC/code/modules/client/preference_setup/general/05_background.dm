/datum/category_item/player_setup_item/general/background
	name = "Background"
	sort_order = 5

/datum/category_item/player_setup_item/general/background/load_character(var/savefile/S)
	S["home_system"]			>> pref.home_system
	S["citizenship"]			>> pref.citizenship
	S["faction"]				>> pref.faction
	S["religion"]				>> pref.religion
	S["nanotrasen_relation"]	>> pref.nanotrasen_relation

/datum/category_item/player_setup_item/general/background/save_character(var/savefile/S)
	S["home_system"]			<< pref.home_system
	S["citizenship"]			<< pref.citizenship
	S["faction"]				<< pref.faction
	S["religion"]				<< pref.religion
	S["nanotrasen_relation"]	<< pref.nanotrasen_relation

/datum/category_item/player_setup_item/general/background/sanitize_character()
	if(!pref.citizenship) pref.citizenship = "None"

	if(!pref.religion)    pref.religion =    "None"

	pref.nanotrasen_relation = sanitize_inlist(pref.nanotrasen_relation, COMPANY_ALIGNMENTS, initial(pref.nanotrasen_relation))

/datum/category_item/player_setup_item/general/background/content(var/mob/user)
	. += "<b>Background Information</b><br>"
	. += "Kingdom Relation: <a href='?src=\ref[src];nt_relation=1'>[pref.nanotrasen_relation]</a><br/>"
	. += "Religion: <a href='?src=\ref[src];religion=1'>[pref.religion]</a><br/>"

/datum/category_item/player_setup_item/general/background/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["nt_relation"])
		var/new_relation = input(user, "Choose your relation to the Kingdom.", "Character Preference", pref.nanotrasen_relation)  as null|anything in COMPANY_ALIGNMENTS
		if(new_relation && CanUseTopic(user))
			pref.nanotrasen_relation = new_relation
			return TOPIC_REFRESH

	else if(href_list["citizenship"])
		var/choice = input(user, "Please choose your current citizenship.", "Character Preference", pref.citizenship) as null|anything in citizenship_choices + list("None","Other")
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		if(choice == "Other")
			var/raw_choice = sanitize(input(user, "Please enter your current citizenship.", "Character Preference") as text|null, MAX_NAME_LEN)
			if(raw_choice && CanUseTopic(user))
				pref.citizenship = raw_choice
		else
			pref.citizenship = choice
		return TOPIC_REFRESH

	else if(href_list["religion"])
		var/choice = input(user, "Please choose a religion.", "Character Preference", pref.religion) as null|anything in religion_choices + list("None")
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		if(choice == "Other")
			var/raw_choice = sanitize(input(user, "Please enter a religon.", "Character Preference")  as text|null, MAX_NAME_LEN)
			if(raw_choice)
				pref.religion = sanitize(raw_choice)
		else
			pref.religion = choice
		return TOPIC_REFRESH

	return ..()

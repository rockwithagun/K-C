
/datum/reagent/solis
	name = "solis"
	id = "solis"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/corporis
	name = "corporis remedium"
	id = "corporis"
	description = "A unrefined healing reagent commonly found in the plant solis."
	color = "#e16496"
	overdose = REAGENTS_OVERDOSE
	state_change_ratio = 0.5
	states = list(DISTILLATION = "corporismedium")
	state_change_msg = list(DISTILLATION = "becomes a greyish liquid.")

/datum/reagent/corporis/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.heal_organ_damage(3.5 * removed, 0)

/datum/reagent/corporismedium
	name = "expergiscimini corpus"
	id = "corporismedium"
	color = "#a6a9ad"
	overdose = REAGENTS_OVERDOSE
	states = list(FILTRATION = "corporispura")
	state_change_msg = list(FILTRATION = "liquefies into a bright pink color.")

/datum/reagent/corporismedium/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_chemical_effect(CE_STABLE)

/datum/reagent/impuricorporis
	name = "impuri corporis remedium"
	id = "corporispura"
	color = "#ff7de1"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/corporispura/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.heal_organ_damage(6.5 * removed, 0)

/datum/reagent/argentum
	name = "argentum potabile"
	id = "argentum"
	taste_description = "expensive yet reasonable metal"
	color = "#e5e5e5"

/datum/reagent/argentum/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.heal_organ_damage(3 * removed, 3 * removed)

/datum/reagent/aurum
	name = "aurum potabile"
	id = "aurum"
	taste_description = "expensive metal"
	color = "#c89632"

/datum/reagent/aurum/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.heal_organ_damage(5 * removed, 5 * removed)

/datum/reagent/purifvenenum
	name = "venenum purificatione"
	id = "purifvenenum"
	color  = "#19ffc8"

/datum/reagent/purifvenenum/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustToxLoss(-5 * removed)
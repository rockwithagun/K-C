/////////////////////////////////////////////////////////
/* A FILE FOR ASSORTED HELPER PROCS USED BY king CODE */
/////////////////////////////////////////////////////////

//vg/ proc, used by vampire mode. Should be self-explanatory.//
/mob/living/carbon/human/proc/is_on_ears(var/typepath)
	return max(istype(l_ear,typepath),istype(r_ear,typepath))



//Monkeys et al being a human type mess with the purpose of regular ishuman; ishumanoid is intended to check strictly 'sentient' races
/proc/ishumanoid(A)
	if(istype(A, /mob/living/carbon/human) && !(istype (A, /mob/living/carbon/human/monkey)) && !(istype (A, /mob/living/carbon/human/mouse)) && !(istype (A, /mob/living/carbon/human/farwa))) // && !(istype (A, /mob/living/carbon/human/neara)))
		return 1 //whoever thought subtyping all these under /human/monkey or whatever was a bad idea is literally Hitler
	return 0

/proc/get_light_amt(var/turf/T, var/ignore_red = 0)
	// Stolen from diona/life.dm since it was needed in various places. Ignore_red parameter for extra spoopy.
	var/light_amount = 0
	var/atom/movable/lighting_overlay/L = locate(/atom/movable/lighting_overlay) in T

	if(L)
		if(ignore_red)
			light_amount = L.lum_g + L.lum_b
		else
			light_amount = L.lum_r + L.lum_g + L.lum_b //hardcapped so it's not abused by having a ton of flashlights
	else
		light_amount =  10

	return light_amount

/proc/shadow_check(var/turf/T, var/max_light = 2, var/or_equal = 0)
	//True if light below max_light threshold, false otherwise
	var/light_amt = get_light_amt(T)
	if(or_equal)
		if(light_amt <= max_light)
			return 1
	else
		if(light_amt < max_light)
			return 1
	return 0
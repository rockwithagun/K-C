
var/list/dreams = list(
	"a bottle","a familiar face","a townie",
	"voices from all around","a doctor","a traitor","an ally","darkness",
	"light","a monkey","a catastrophe","a loved one","a gun","warmth","freezing","the sun",
	"a hat","a planet","air","blinking lights",
	"a blue light","an abandoned laboratory","pirates","blood","healing","power","respect",
	"riches","a crash","happiness","pride","a fall","water","flames","ice","melons","flying","the eggs","money",
	"a beach","a smokey room","a voice","the cold","a mouse","an operating table","the rain",
	)

mob/living/carbon/proc/dream()
	dreaming = 1

	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			to_chat(src, "<span class='notice'><i>... [pick(dreams)] ...</i></span>")
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(client && !dreaming && prob(5))
		dream()

mob/living/carbon/var/dreaming = 0

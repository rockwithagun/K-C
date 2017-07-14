/obj/structure/emptyspace
	name = null
	desc = null
	icon = null
	anchored = 1
	density = 1

/obj/structure/fountain
	name = "fountain"
	desc = "A stone fountain build apon a fresh water source."
	icon = 'icons/urist/jungle/64x64.dmi'
	icon_state = "fountain"
	anchored = 1
	density = 1

/obj/structure/freemasonry
	name = "freemasonry"
	desc = "A freemasonry symbol."
	icon = 'icons/king/misc.dmi'
	icon_state = "mason"
	anchored = 1
	density = 0

obj/effect/decal/jungle/king/flower
	name = "flowers"
	desc = "flowers."
	icon = 'icons/king/misc.dmi'
	icon_state = "multiflower"
	layer = -997

obj/effect/decal/jungle/king/flower/pink
	icon_state = "pinkflower"

obj/effect/decal/jungle/king/flower/blue
	icon_state = "blueflower"

obj/effect/decal/jungle/king/flower/yellow
	icon_state = "yellowflower"

/obj/structure/boat
	name = "half buried boat"
	desc = "An old row boat leave out to rot and sink into the ground."
	icon = 'icons/king/boat.dmi'
	icon_state = "wreckedboat"
	anchored = 1
	density = 0

/obj/structure/painting
	name = "landscape painting"
	desc = "A fairly pretty landscape. Signed by the great Galavant."
	icon = 'icons/obj/objects.dmi'
	icon_state = "landscape"
	anchored = 1
	density = 0

/obj/structure/painting/colour
	name = "colours painting"
	desc = "A mix of many colours. Signed by the great Galavant."
	icon_state = "colour"

/obj/structure/painting/map
	name = "town map"
	desc = "A large town map. Signed by the great Galavant."
	icon = 'icons/king/map.dmi'
	icon_state = "map"
	anchored = 1
	density = 0

/obj/structure/shoppole
	name = "shop pole"
	desc = "A red and white shop pole."
	icon = 'icons/obj/objects.dmi'
	icon_state = "pole"
	anchored = 1
	density = 0

/obj/structure/noticeboard/king
	name = "notice board"
	desc = "A board for pinning important notices upon."
	icon = 'icons/obj/noticeboard.dmi'
	icon_state = "nboard00"
	density = 0
	anchored = 1

/obj/structure/noticeboard/king/initialize()
	for(var/obj/item/I in loc)
		if(notices > 4) break
		if(istype(I, /obj/item/weapon/paper))
			I.loc = src
			notices++
	icon_state = "nboard0[notices]"

//attaching papers!!
/obj/structure/noticeboard/king/attackby(var/obj/item/weapon/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/weapon/paper) || istype(O, /obj/item/weapon/photo))
		if(notices < 5)
			O.add_fingerprint(user)
			add_fingerprint(user)
			user.drop_from_inventory(O,src)
			notices++
			icon_state = "nboard0[notices]"	//update sprite
			to_chat(user, "<span class='notice'>You pin the paper to the noticeboard.</span>")
		else
			to_chat(user, "<span class='notice'>You reach to pin your paper to the board but hesitate. You are certain your paper will not be seen among the many others already attached.</span>")

/obj/structure/noticeboard/king/attack_hand(var/mob/user)
	examine(user)

// Since Topic() never seems to interact with usr on more than a superficial
// level, it should be fine to let anyone mess with the board other than ghosts.
/obj/structure/noticeboard/king/examine(var/mob/user)
	if(!user)
		user = usr
	if(user.Adjacent(src))
		var/dat = "<B>Noticeboard</B><BR>"
		for(var/obj/item/weapon/paper/P in src)
			dat += "<A href='?src=\ref[src];read=\ref[P]'>[P.name]</A> <A href='?src=\ref[src];write=\ref[P]'>Write</A> <A href='?src=\ref[src];remove=\ref[P]'>Remove</A><BR>"
		for(var/obj/item/weapon/photo/P in src)
			dat += "<A href='?src=\ref[src];look=\ref[P]'>[P.name]</A> <A href='?src=\ref[src]; <A href='?src=\ref[src];remove=\ref[P]'>Remove</A><BR>"
		user << browse("<HEAD><TITLE>Notices</TITLE></HEAD>[dat]","window=noticeboard")
		onclose(user, "noticeboard")
	else
		..()

/obj/structure/noticeboard/king/Topic(href, href_list)
	..()
	usr.set_machine(src)
	if(href_list["remove"])
		if((usr.stat || usr.restrained()))	//For when a player is handcuffed while they have the notice window open
			return
		var/obj/item/P = locate(href_list["remove"])
		if(P && P.loc == src)
			P.loc = get_turf(src)	//dump paper on the floor because you're a clumsy fuck
			P.add_fingerprint(usr)
			add_fingerprint(usr)
			notices--
			icon_state = "nboard0[notices]"
	if(href_list["write"])
		if((usr.stat || usr.restrained())) //For when a player is handcuffed while they have the notice window open
			return
		var/obj/item/P = locate(href_list["write"])
		if((P && P.loc == src)) //ifthe paper's on the board
			if(istype(usr.r_hand, /obj/item/weapon/pen)) //and you're holding a pen
				add_fingerprint(usr)
				P.attackby(usr.r_hand, usr) //then do ittttt
			else
				if(istype(usr.l_hand, /obj/item/weapon/pen)) //check other hand for pen
					add_fingerprint(usr)
					P.attackby(usr.l_hand, usr)
				else
					to_chat(usr, "<span class='notice'>You'll need something to write with!</span>")
	if(href_list["read"])
		var/obj/item/weapon/paper/P = locate(href_list["read"])
		if((P && P.loc == src))
			P.show_content(usr)
	if(href_list["look"])
		var/obj/item/weapon/photo/P = locate(href_list["look"])
		if((P && P.loc == src))
			P.show(usr)
	return

/obj/structure/signpost
	name = "sign post"
	desc = "You shouldn't see this."
	icon = 'icons/king/misc.dmi'
	icon_state = "signpost"
	anchored = 1
	density = 1

/obj/structure/bell
	name = "jail bell"
	desc = "A large bell for signaling the locals."
	icon = 'icons/king/misc.dmi'
	icon_state = "bell"
	anchored = 1
	density = 1
	var/busy

/obj/structure/bell/attack_hand(mob/living/user)
	..()
	if(user.mind && (user.mind.assigned_role in security_positions))
		if(!busy)
			busy = 1
			to_world("The local jail bell rings across the land.")
			world <<  'sound/king/bell.ogg'
			sleep(300)
			busy = 0

/obj/structure/bell/church
	name = "church bell"
	desc = "A large bell for signaling the locals."
	icon = 'icons/king/misc.dmi'
	icon_state = "cbell"

/obj/structure/bell/church/attack_hand(mob/living/user)
	..()
	if(user.mind && (user.mind.assigned_role == "Priest"))
		if(!busy)
			busy = 1
			to_world("The local church bell rings across the land.")
			world <<  'sound/king/churchbell.WAV'
			sleep(800)
			busy = 0

//BOOKS

/obj/item/weapon/book/manual/betting
	name = "The Book of Betting"
	icon = 'icons/king/misc.dmi'
	icon_state = "bettingbook"
	author = "Captain William Markham"
	title = "Games for Landlubbers"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				Publisher's note: Original author's; clearly drunken; writing has been made coherent.
				<br>
				<hr>
				<br>
				<h2>Mexico</h2>
				<br>
				<h3>Betting:</h3>
				<br>
				<ul>
				<li>Everyone puts an ante into the pot.<li/>
				<li>Keep your stake handy for the pot.<li/>
				<ul/>
				<br>
				<h3>Play:</h3>
				<br>
				Everyone rolls a pair of dice, the lowest roller puts their stake into the pot and is out. Continue untill one remains.
				<br>
				<hr>
				<br>
				<b>Poker</b>
				<br>
				Ace high, no wilds.
				<br>
				<h35 Card Draw:</h3>
				<br>
				<ul>
				<li>Each player is dealt 5 cards<li/>
				<li>On the first go around each player may trade in up to three cards<li/>
				<li>Standard pokers rules otherwise used.<li/>
				<ul/>

				</body>
			</html>
			"}
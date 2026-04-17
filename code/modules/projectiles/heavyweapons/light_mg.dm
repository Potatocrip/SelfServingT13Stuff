/obj/item/gun/ballistic/rifle/repeater/lewis
	name = "KR 'Leonard'"
	desc = "One of the only light machine guns produced the by WAR machine. This one sports a gun shield at the front. There is a tally mark for each man who's held it before you. It's at XII."
	icon = 'icons/roguetown/weapons/64guns.dmi'
	icon_state = "lewisgun"
	item_state = "lewisgun"
	item_flags = SLOWS_WHILE_IN_HAND
	can_parry = TRUE
	armor = ARMOR_SHIELD
	possible_item_intents = list(, SHIELD_BLOCK, SHIELD_SMASH)
	mag_type = /obj/item/ammo_box/magazine/lewis
	slowdown = 2 //I'M THE JUGGAHNAUT BAYBEE
	force = 40 //if someone hits you with a fucking lewis gun, you're gonna have a bad time
	spread = 3
	pump_sound = 'sound/combat/ranged/riflecock.ogg'
	fire_sound = 'sound/combat/ranged/lewisfire.ogg'
	load_sound = 'sound/combat/ranged/rifleload.ogg'
	recoil = 0.15
	semi_auto = TRUE
	burst = 2
	wdefense = 11
	max_integrity = 150
	possible_item_intents = list(
		/datum/intent/shoot/rifle,
		/datum/intent/arc/rifle,
		/datum/intent/shield/smash,
		/datum/intent/shield/block,
		INTENT_GENERIC,
		)

/obj/item/gun/ballistic/rifle/repeater/dp47
	name = "RSV 'Redeemer'"
	desc = "A light machine gun, produced by the WAR MACHINE. Fires rifle rounds at a high rate of fire, with a dinner plate on top of it. It's one of a kind."
	icon = 'icons/roguetown/weapons/64guns.dmi'
	icon_state = "dp47"
	item_state = "dp47"
	mag_type = /obj/item/ammo_box/magazine/dp47
	item_flags = SLOWS_WHILE_IN_HAND
	slowdown = 0.7
	force = 40
	spread = 2
	pump_sound = 'sound/combat/ranged/riflecock.ogg'
	fire_sound = 'sound/combat/ranged/lewisfire.ogg'
	load_sound = 'sound/combat/ranged/rifleload.ogg'
	recoil = 0.15
	semi_auto = TRUE
	burst = 2

/obj/gun/ballistic/rifle/repeater/dp47/RightClickOn(var/atom/A, var/mob/user, proximity)
    ..()
    if(isturf(A) && ismob(user))
        var/turf/T = A
        var/mob/M = user
        if(in_range(T, user) && do_after(user, 20, src))
            if(istype(A, /obj/gun/ballistic/rifle/repeater/dp47))
                var/obj/gun/ballistic/rifle/repeater/dp47/MG = A
                playsound(src, 'sound/items/hw_tripod.ogg', 50, 1)
                make_machinegun(MG, user)

/obj/gun/ballistic/rifle/repeater/lewis/RightClickOn(var/atom/A, var/mob/user, proximity)
    ..()
    if(isturf(A) && ismob(user))
        var/turf/T = A
        var/mob/M = user
        if(in_range(T, user) && do_after(user, 20, src))
            if(istype(A, /obj/gun/ballistic/rifle/repeater/lewis))
                var/obj/gun/ballistic/rifle/repeater/lewis/MG = A
                playsound(src, 'sound/items/hw_tripod.ogg', 50, 1)
                make_machinegun(MG, user)

/obj/item/gun/ballistic/rifle/repeater/dp47/update_icon()
	..()
	if(magazine)
		icon_state = "dp47"
	else
		icon_state = "dp47-empty"

/obj/item/gun/ballistic/rifle/repeater/lewis/update_icon()
	..()
	if(magazine)
		icon_state = "lewisgun"
	else
		icon_state = "lewisgun-empty"

/obj/item/gun/ballistic/rifle/repeater/lewis/proc/detach_tripod(var/mob/user)
	if(!disassembled || !tripod || !ismob(user))
		return

	var/turf/T = get_turf(src.loc)
	tripod.forceMove(T)
	tripod.detach_from_turf(T, user, 0)
	disassembled.forceMove(T)
	playsound(src, 'sound/items/hw_weapon.ogg', 50, 1)
	user.put_in_hands(disassembled)
	tripod = null
	disassembled = null
	qdel(src)

/obj/item/gun/ballistic/rifle/repeater/dp47/proc/detach_tripod(var/mob/user)
	if(!disassembled || !tripod || !ismob(user))
		return

	var/turf/T = get_turf(src.loc)
	tripod.forceMove(T)
	tripod.detach_from_turf(T, user, 0)
	disassembled.forceMove(T)
	playsound(src, 'sound/items/hw_weapon.ogg', 50, 1)
	user.put_in_hands(disassembled)
	tripod = null
	disassembled = null
	qdel(src)

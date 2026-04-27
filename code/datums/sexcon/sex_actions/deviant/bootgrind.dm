/datum/sex_action/bootgrind
	name = "Grind boots into them"
	check_same_tile = FALSE

/datum/sex_action/bootgrind/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!check_location_accessible(target, user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(user.resting)
		return FALSE
	if(!target.resting)
		return FALSE
	if(!user.shoes)
		return FALSE
	return TRUE

/datum/sex_action/bootgrind/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!.)
		return FALSE
	if(user == target)
		return FALSE
	if(!check_location_accessible(target, user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	// Need to stand up
	if(user.resting)
		return FALSE
	// Target can't stand up
	if(!target.resting)
		return FALSE
	if(!user.shoes)
		return FALSE
	return TRUE

/datum/sex_action/bootgrind/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] puts [user.p_their()] boots against [target]..."))

/datum/sex_action/bootgrind/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] pulls [user.p_their()] boots away from [target]..."))

/datum/sex_action/bootgrind/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] grinds [user.p_their()] boots into [target]'s groin..."))
	playsound(user, 'sound/combat/hits/kick/stomp.ogg', 30, TRUE, -2, ignore_walls = FALSE)
	// and i had never had c hance to interact with the jesters...
	if(istype(user.shoes, /obj/item/clothing/shoes/roguetown/jester))
		playsound(user, SFX_JINGLE_BELLS, 30, TRUE, -2, ignore_walls = FALSE)

	if(istype(user.shoes, /obj/item/clothing/shoes/roguetown))
		user.sexcon.perform_sex_action(target, 2, 10, TRUE)
		target.sexcon.handle_passive_ejaculation(target)
	else
		user.sexcon.perform_sex_action(target, 2, 4, TRUE)
		target.sexcon.handle_passive_ejaculation(target)

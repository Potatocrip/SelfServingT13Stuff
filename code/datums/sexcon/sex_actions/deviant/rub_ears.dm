/datum/sex_action/rub_ears
	name = "Rub their ears"
	check_same_tile = FALSE

/datum/sex_action/rub_ears/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!check_location_accessible(user, target, BODY_ZONE_PRECISE_EARS, TRUE))
		return FALSE
	return TRUE

/datum/sex_action/rub_ears/can_perform(mob/living/user, mob/living/target)
	. = ..()
	if(!.)
		return FALSE
	if(user == target)
		return FALSE
	if(!check_location_accessible(user, target, BODY_ZONE_PRECISE_EARS, TRUE))
		return FALSE
	return TRUE

/datum/sex_action/rub_ears/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.visible_message(span_warning("[user] places [user.p_their()] hands against [target] ears..."))

/datum/sex_action/rub_ears/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.visible_message(span_warning("[user] stops rubbing [target]'s ears ..."))

/datum/sex_action/rub_ears/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.sexcon.make_sucking_noise()
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rubs [target]'s ears..."))

	user.sexcon.perform_sex_action(target, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

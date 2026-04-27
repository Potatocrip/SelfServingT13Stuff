/datum/sex_action/masturbate_revolver/vaginal_revolver
	name = "Shove the barrel into my cunt"
	category = SEX_CATEGORY_PENETRATE
	target_sex_part = SEX_PART_CUNT
	user_sex_part = SEX_PART_CUNT

/datum/sex_action/masturbate_revolver/vaginal_revolver/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_revolver/vaginal_revolver/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!check_location_accessible(user, target, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_revolver/vaginal_revolver/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] begins shoving the barrel of [user.p_their()] revolver into [user.p_their()] cunt..."))

/datum/sex_action/masturbate_revolver/grind_revolver/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops fucking themselves with their revolver."))

/datum/sex_action/masturbate_revolver/grind_revolver/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks themselves with the barrel of [user.p_their()] revolver."))
	user.sexcon.make_sucking_noise()
	user.sexcon.do_thrust_animate(target)

	user.sexcon.perform_sex_action(target, 2, 4, TRUE)
	target.sexcon.handle_passive_ejaculation()
	try_pistol_accidental_discharge(user, target)

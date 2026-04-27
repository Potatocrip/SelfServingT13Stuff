/datum/sex_action/grind_revolver
	name = "Grind barrel against myself"
	check_same_tile = FALSE
	category = SEX_CATEGORY_HANDS
	subtle_supported = TRUE

/datum/sex_action/grind_revolver/proc/try_revolver_accidental_discharge(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/obj/item/gun/ballistic/revolver/held_item = user.get_active_held_item()
	if(!held_item || !istype(held_item, /obj/item/gun/ballistic/revolver))
		return
	if(!prob(5))
		return
	user.visible_message("<span class='danger'>[user] flinches, pulling the trigger!</span>")
	held_item.process_fire(target, user, TRUE, null, user.zone_selected)

/datum/sex_action/grind_revolver/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user != target)
		return FALSE
	var/obj/item/gun/ballistic/revolver/held_item = user.get_active_held_item()
	if(!held_item || !istype(held_item, /obj/item/gun/ballistic/revolver))
		return FALSE
	return TRUE

/datum/sex_action/grind_revolver/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user != target)
		return FALSE
	var/obj/item/gun/ballistic/revolver/held_item = user.get_active_held_item()
	if(!held_item || !istype(held_item, /obj/item/gun/ballistic/revolver))
		return FALSE
	return TRUE

/datum/sex_action/grind_revolver/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] pushes the revolver against [user.p_them()]self..."), vision_distance = (user.sexcon.do_subtle_action ? 1 : DEFAULT_MESSAGE_RANGE))
	user.sexcon.show_progress = 0

/datum/sex_action/grind_revolver/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops pushing the revolver against [user.p_them()]self..."), vision_distance = (user.sexcon.do_subtle_action ? 1 : DEFAULT_MESSAGE_RANGE))

/datum/sex_action/grind_revolver/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/verbstring = pick(list("rubs", "grinds"))
	var/do_subtle = user.sexcon.do_subtle_action
	var/pleasure_target
	var/zone_text
	switch(user.zone_selected)
		if(BODY_ZONE_PRECISE_GROIN)
			zone_text = target.fixedeye ? "ass" : "crotch"
			pleasure_target = 1
		if(BODY_ZONE_CHEST)
			zone_text = target.getorganslot(ORGAN_SLOT_BREASTS) ? "tits" : "chest"
			pleasure_target = 1
		else
			zone_text = LOWER_TEXT(parse_zone(user.zone_selected))
			pleasure_target = 0
	user.sexcon.show_progress = !do_subtle
	user.sexcon.suppress_moan = target.sexcon.suppress_moan = do_subtle

	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective(is_stealth = do_subtle)] [verbstring] [user.p_their()] [zone_text] with the barrel of [user.p_their()] revolver..."), vision_distance = (do_subtle ? 1 : DEFAULT_MESSAGE_RANGE))
	if(!do_subtle)
		if(user.sexcon.force > SEX_FORCE_HIGH)
			user.sexcon.outercourse_noise(target)
		else
			user.sexcon.make_sucking_noise()
		user.sexcon.do_thrust_animate(target)

	user.sexcon.perform_sex_action(user, 1, 0.5, TRUE)
	user.sexcon.handle_passive_ejaculation()

	if(pleasure_target)
		user.sexcon.perform_sex_action(target, 1, 0.5, TRUE)
	target.sexcon.handle_passive_ejaculation()

	user.sexcon.suppress_moan = target.sexcon.suppress_moan = FALSE
	try_revolver_accidental_discharge(user, target)

/datum/sex_action/grind_revolver/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

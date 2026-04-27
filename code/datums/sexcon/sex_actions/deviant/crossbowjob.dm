/datum/sex_action/grind_crossbow
	name = "Grind buttstock against them"
	check_same_tile = FALSE

/datum/sex_action/grind_crossbow/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	var/obj/item/held_item = user.get_active_held_item()
	if(!held_item || !istype(held_item, /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow))
		return FALSE
	return TRUE

/datum/sex_action/grind_crossbow/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!.)
		return FALSE
	if(user == target)
		return FALSE
	var/obj/item/held_item = user.get_active_held_item()
	if(!held_item || !istype(held_item, /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow))
		return FALSE
	return TRUE

/datum/sex_action/grind_crossbow/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] begins grinding the stock of [user.p_their()] crossbow into [target] groin..."))

/datum/sex_action/grind_crossbow/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops grinding [target]."))

/datum/sex_action/grind_crossbow/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] grinds the stock against [target]."))
	playsound(target, 'sound/misc/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)
	user.sexcon.do_thrust_animate(target)

	user.sexcon.perform_sex_action(target, 0, 0, TRUE)
	target.sexcon.perform_sex_action(user, 1, 4, FALSE)
	target.sexcon.handle_passive_ejaculation()

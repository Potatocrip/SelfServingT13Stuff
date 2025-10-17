/datum/job/roguetown/commandant
	title = "Commandant"
	flag = COMMANDANT
	department_flag = RISVON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_TEMPERANCE
	allowed_sexes = list(MALE)
	allowed_ages = list(AGE_ADULT)
	selection_color = JCOLOR_RISVON

	tutorial = "You are the commanding officer of the local Risvon Capitro. Or Chapter, if you're a scrub. \
				You are aware of the discovery of a new WAR MACHINE in the local area. \
				Your main goal is to claim the entire production site for the Ziggurate, while also beating off any foreign intruders. \
				You're on the same intelligence level as an Oficiro, in terms of raw knowledge about the state. You were handpicked by higher ranks for your performance."

	outfit = /datum/outfit/job/roguetown/commandant
	display_order = JDO_COMMANDANT
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_commandant.ogg'

/datum/job/roguetown/commandant/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.wear_ring, /obj/item/roguekey/risvon))
			var/obj/item/clothing/S = H.wear_ring
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = " [index]'s nailtag"


/datum/outfit/job/roguetown/commandant/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	shoes = /obj/item/clothing/shoes/roguetown/boots
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/ebarmor/pauldrons
	cloak = /obj/item/clothing/cloak/templar/malumite
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	head = /obj/item/clothing/head/roguetown/helmet/kettle/iron/commandant
	mask = /obj/item/clothing/mask/rogue/gasmask/risvonmask/commandant
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/storage/belt/rogue/pouch/ammobag
	wrists = /obj/item/scomstone
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	backl = /obj/item/gun/ballistic/shotgun/risvon
	backr = /obj/item/gun/ballistic/rifle/repeater/commandant
	id = /obj/item/roguekey/risvon
	backpack_contents = list(
		/obj/item/ammo_box/clip/pistol = 5,
		/obj/item/rogueweapon/huntingknife/idagger/steel,
		/obj/item/storage/belt/rogue/pouch/coins/rich,
	)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shotguns, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/pistols, 4, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

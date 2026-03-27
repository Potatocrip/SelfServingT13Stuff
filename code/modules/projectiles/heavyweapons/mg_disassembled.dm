///////////////////////////////
////GUN FOR MACHINEGUNS////////
///////////////////////////////

/obj/item/mg_disassembled
	name = "disassembled stationary machinegun"
	icon = 'icons/obj/stationary_guns.dmi'
	icon_state = "basic-mg-disconnected"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	var/id_g = "bmg"

/obj/item/mg_disassembled/utes
	name = "disassembled NSV Utes"
	icon_state = "utes-disconnected"
	id_g = "uts"

/obj/item/mg_disassembled/m2
	name = "disassembled M2"
	desc = "A slick, top of the line War Machine production. Fires .50D. Needs to be placed it's tripod."
	icon_state = "m2-disconnected"
	id_g = "mbr"

/obj/item/bodypart/head/protogen
	icon_greyscale = 'icons/mob/human/species/protogen/bodyparts.dmi'
	icon_state = "protogen_head"
	icon_static = 'icons/mob/human/species/protogen/bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	is_dimorphic = FALSE
	head_flags = HEAD_LIPS|HEAD_EYESPRITES|HEAD_EYEHOLES
	teeth_count = 0

/obj/item/bodypart/chest/protogen
	icon_greyscale = 'icons/mob/human/species/protogen/bodyparts.dmi'
	icon_state = "protogen_chest_m"
	icon_static = 'icons/mob/human/species/protogen/bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	is_dimorphic = TRUE

/obj/item/bodypart/chest/protogen/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_FUZZY)

/obj/item/bodypart/arm/left/protogen
	icon_greyscale = 'icons/mob/human/species/protogen/bodyparts.dmi'
	icon_state = "protogen_l_arm"
	icon_static = 'icons/mob/human/species/protogen/bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	unarmed_attack_verbs = list("slash")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/protogen
	icon_greyscale = 'icons/mob/human/species/protogen/bodyparts.dmi'
	icon_state = "protogen_r_arm"
	icon_static = 'icons/mob/human/species/protogen/bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN
	unarmed_attack_verbs = list("slash")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/protogen
	icon_greyscale = 'icons/mob/human/species/protogen/bodyparts.dmi'
	icon_state = "protogen_l_leg"
	icon_static = 'icons/mob/human/species/protogen/bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN

/obj/item/bodypart/leg/right/protogen
	icon_greyscale = 'icons/mob/human/species/protogen/bodyparts.dmi'
	icon_state = "protogen_r_leg"
	icon_static = 'icons/mob/human/species/protogen/bodyparts.dmi'
	limb_id = SPECIES_PROTOGEN

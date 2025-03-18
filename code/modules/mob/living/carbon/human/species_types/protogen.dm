/datum/species/protogen
	name = "\improper Protogen"
	plural_form = "Protogens"
	id = SPECIES_PROTOGEN
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	inherent_traits = list(
		TRAIT_RESISTBRUTE,
		TRAIT_MUTANT_COLORS,
	)
	//mutant_organs = list()
	meat = /obj/item/food/meat/slab/human/mutant/moth
	mutanttongue = /obj/item/organ/tongue/protogen
	mutanteyes = /obj/item/organ/eyes/protogen
	mutantears = /obj/item/organ/ears/protogen
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_cookie = /obj/item/food/muffin/moffin
	//digitigrade_customization = DIGITIGRADE_OPTIONAL

	species_language_holder = /datum/language_holder/protogen

	death_sound = 'sound/mobs/humanoids/moth/moth_death.ogg'
	payday_modifier = 1.0
	family_heirlooms = list(/obj/item/flashlight/lantern/heirloom_moth)

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/protogen,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/protogen,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/protogen,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/protogen,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/protogen,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/protogen,
	)

/datum/species/protogen/on_species_gain(mob/living/carbon/human/human_who_gained_species, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	RegisterSignal(human_who_gained_species, COMSIG_MOB_APPLY_DAMAGE_MODIFIERS, PROC_REF(damage_weakness))

/datum/species/protogen/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_APPLY_DAMAGE_MODIFIERS)

/datum/species/protogen/proc/damage_weakness(datum/source, list/damage_mods, damage_amount, damagetype, def_zone, sharpness, attack_direction, obj/item/attacking_item)
	SIGNAL_HANDLER

	if(istype(attacking_item, /obj/item/melee/flyswatter))
		damage_mods += 10 // Yes, a 10x damage modifier

/datum/species/moprotogenth/randomize_features()
	var/list/features = ..()
	features["moth_markings"] = pick(SSaccessories.moth_markings_list)
	return features

/datum/species/protogen/get_scream_sound(mob/living/carbon/human/protogen)
	return 'sound/mobs/humanoids/moth/scream_moth.ogg'

/datum/species/protogen/get_cough_sound(mob/living/carbon/human/protogen)
	if(protogen.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)


/datum/species/protogen/get_cry_sound(mob/living/carbon/human/protogen)
	if(protogen.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/protogen/get_sneeze_sound(mob/living/carbon/human/protogen)
	if(protogen.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'


/datum/species/protogen/get_laugh_sound(mob/living/carbon/human/protogen)
	return 'sound/mobs/humanoids/moth/moth_laugh1.ogg'

/datum/species/protogen/get_sigh_sound(mob/living/carbon/human/protogen)
	if(protogen.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/protogen/get_sniff_sound(mob/living/carbon/human/protogen)
	if(protogen.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/protogen/get_physical_attributes()
	return "Protogens are partially-cybernetic creatures, giving them abilities such as hormone control, and making them much more durable. \
		However, they also die instantly from electrocution, and cannot wear masks due to the size of their nanite-powered visor."

/datum/species/protogen/get_species_description()
	return "Protogen are highly-advanced cybernetically-enhanced creatures, \
		originating from a portal between worlds long ago."

/datum/species/protogen/get_species_lore()
	return list(
		"Beep boop. Boop beep?",
	)

/datum/species/protogen/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list( // PARTIALLY IMPLEMENTED - ADD EYE DAMAGE RESIST!
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_COGS,
			SPECIES_PERK_NAME = "You Can't Stop Me",
			SPECIES_PERK_DESC = "The cybernetic nature of protogens allows them to be more resistant to eye and ear damage.",
		),
		list( // IMPLEMENTED
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "tshirt",
			SPECIES_PERK_NAME = "Armored Floofy Menace",
			SPECIES_PERK_DESC = "Protogens have partially-cybernetic arms, legs and chest. The metal parts act as armor, providing 15% BRUTE resistance.",
		),
		list(// NOT INPLEMENTED
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "tshirt",
			SPECIES_PERK_NAME = "Hormone Control",
			SPECIES_PERK_DESC = "Protogens have better control of their hormones and bodily chemicals. They move faster than others when injured, and can trigger their bodies to boost adrenaline production.",
		),
		list( // NOT IMPLEMENTED
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "fire",
			SPECIES_PERK_NAME = "Big Ol' Snoot",
			SPECIES_PERK_DESC = "Protogen visors jut out far enough to prevent them from wearing standard humanoid masks.",
		),
		list( // NOT IMPLEMENTED
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "sun",
			SPECIES_PERK_NAME = "Nanite Restart Syndrome",
			SPECIES_PERK_DESC = "If a protogen is in critical condition, they may develop Nanite Restart Syndrome. This will cause them to start repeatedly powering on and off for a period of time.",
		),
		list( // NOT IMPLEMENTED
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "sun",
			SPECIES_PERK_NAME = "Electricity Sensitivity",
			SPECIES_PERK_DESC = "Protogens are extremely sensitive to electricity - tasers and stunbatons will deal damage. Electrocution causes instantaneous death.",
		),
	)

	return to_add

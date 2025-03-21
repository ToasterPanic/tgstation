/datum/quirk/item_quirk/decaying_brain
	name = "Decaying Brain"
	desc = "You brain will rapidly take damage at all times unless you take viperpoison. No other BRAIN medicines work on you. However, you have a significantly higher tolerance for the stuff, and will start out with a full bottle of it (plus a syringe to inject it.)"
	icon = FA_ICON_TAG
	mob_trait = TRAIT_DECAYING_BRAIN
	value = -12
	gain_text = span_danger("Your thoughts feel fuzzy... you need viperpoison NOW!")
	lose_text = span_notice("You feel more sane than usual.")
	medical_record_text = "Patient is suffering from severe Viperpoison-dependent brain decay."
	mail_goodies = list(/obj/item/storage/pill_bottle/viperpoison)

	var/datum/weakref/added_trama_ref

/datum/quirk/item_quirk/decaying_brain/add_unique(client/client_source)
	if(!iscarbon(quirk_holder))
		return

	var/mob/living/carbon/carbon_quirk_holder = quirk_holder

	var/newbottle = new /obj/item/storage/pill_bottle/viperpoison

	give_item_to_holder(
		newbottle,
		list(
			LOCATION_LPOCKET = ITEM_SLOT_LPOCKET,
			LOCATION_RPOCKET = ITEM_SLOT_RPOCKET,
			LOCATION_BACKPACK = ITEM_SLOT_BACKPACK,
			LOCATION_HANDS = ITEM_SLOT_HANDS,
		),
	)

	var/datum/brain_trauma/severe/viperpoison_addict/added_trauma = new()
	added_trauma.resilience = TRAUMA_RESILIENCE_ABSOLUTE
	added_trauma.name = "Decaying Brain"
	added_trauma.desc = medical_record_text
	added_trauma.scan_desc = LOWER_TEXT(added_trauma.name)
	added_trauma.gain_text = null
	added_trauma.lose_text = null

	carbon_quirk_holder.gain_trauma(added_trauma)
	added_trama_ref = WEAKREF(added_trauma)

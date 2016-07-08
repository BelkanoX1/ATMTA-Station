/*
CONTAINS:
RSF

*/
/obj/item/weapon/rsf
	name = "\improper Rapid-Service-Fabricator"
	desc = "A device used to rapidly deploy service items."
	icon = 'icons/obj/items.dmi'
	icon_state = "rcd"
	opacity = 0
	density = 0
	anchored = 0.0
	var/matter = 0
	var/mode = 1
	w_class = 3

/obj/item/weapon/rsf/New()
	desc = "A RSF. It currently holds [matter]/30 fabrication-units."
	return

/obj/item/weapon/rsf/attackby(obj/item/weapon/W as obj, mob/user as mob, params)
	..()
	if (istype(W, /obj/item/weapon/rcd_ammo))
		if ((matter + 10) > 30)
			to_chat(user, "The RSF cant hold any more matter.")
			return
		qdel(W)
		matter += 10
		playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
		to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
		desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

/obj/item/weapon/rsf/attack_self(mob/user as mob)
	playsound(src.loc, 'sound/effects/pop.ogg', 50, 0)
	if (mode == 1)
		mode = 2
		to_chat(user, "Changed dispensing mode to 'Drinking Glass'")
		return
	if (mode == 2)
		mode = 3
		to_chat(user, "Changed dispensing mode to 'Paper'")
		return
	if (mode == 3)
		mode = 4
		to_chat(user, "Changed dispensing mode to 'Pen'")
		return
	if (mode == 4)
		mode = 5
		to_chat(user, "Changed dispensing mode to 'Dice Pack'")
		return
	if (mode == 5)
		mode = 6
		to_chat(user, "Changed dispensing mode to 'Cigarette'")
		return
	if (mode == 6)
		mode = 1
		to_chat(user, "Changed dispensing mode to 'Dosh'")
		return
	// Change mode

/obj/item/weapon/rsf/afterattack(atom/A, mob/user as mob, proximity)
	if(!proximity) return
	if (!(istype(A, /obj/structure/table) || istype(A, /turf/simulated/floor)))
		return

	if (istype(A, /obj/structure/table) && mode == 1)
		if (istype(A, /obj/structure/table) && matter >= 1)
			to_chat(user, "Dispensing Dosh...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/spacecash/c10( A.loc )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 200 //once money becomes useful, I guess changing this to a high ammount, like 500 units a kick, till then, enjoy dosh!
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /turf/simulated/floor) && mode == 1)
		if (istype(A, /turf/simulated/floor) && matter >= 1)
			to_chat(user, "Dispensing Dosh...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/spacecash/c10( A )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 200 //once money becomes useful, I guess changing this to a high ammount, like 500 units a kick, till then, enjoy dosh!
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /obj/structure/table) && mode == 2)
		if (istype(A, /obj/structure/table) && matter >= 1)
			to_chat(user, "Dispensing Drinking Glass...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass( A.loc )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 50
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /turf/simulated/floor) && mode == 2)
		if (istype(A, /turf/simulated/floor) && matter >= 1)
			to_chat(user, "Dispensing Drinking Glass...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass( A )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 50
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /obj/structure/table) && mode == 3)
		if (istype(A, /obj/structure/table) && matter >= 1)
			to_chat(user, "Dispensing Paper Sheet...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/paper( A.loc )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 10
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /turf/simulated/floor) && mode == 3)
		if (istype(A, /turf/simulated/floor) && matter >= 1)
			to_chat(user, "Dispensing Paper Sheet...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/paper( A )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 10
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /obj/structure/table) && mode == 4)
		if (istype(A, /obj/structure/table) && matter >= 1)
			to_chat(user, "Dispensing Pen...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/pen( A.loc )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 50
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /turf/simulated/floor) && mode == 4)
		if (istype(A, /turf/simulated/floor) && matter >= 1)
			to_chat(user, "Dispensing Pen...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/pen( A )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 50
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /obj/structure/table) && mode == 5)
		if (istype(A, /obj/structure/table) && matter >= 1)
			to_chat(user, "Dispensing Dice Pack...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/storage/pill_bottle/dice( A.loc )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 200
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /turf/simulated/floor) && mode == 5)
		if (istype(A, /turf/simulated/floor) && matter >= 1)
			to_chat(user, "Dispensing Dice Pack...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/weapon/storage/pill_bottle/dice( A )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 200
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /obj/structure/table) && mode == 6)
		if (istype(A, /obj/structure/table) && matter >= 1)
			to_chat(user, "Dispensing Cigarette...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/clothing/mask/cigarette( A.loc )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 10
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return

	else if (istype(A, /turf/simulated/floor) && mode == 6)
		if (istype(A, /turf/simulated/floor) && matter >= 1)
			to_chat(user, "Dispensing Cigarette...")
			playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
			new /obj/item/clothing/mask/cigarette( A )
			if (isrobot(user))
				var/mob/living/silicon/robot/engy = user
				engy.cell.charge -= 10
			else
				matter--
				to_chat(user, "The RSF now holds [matter]/30 fabrication-units.")
				desc = "A RSF. It currently holds [matter]/30 fabrication-units."
		return
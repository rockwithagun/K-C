
/datum/map/king
	name = "K&C"
	full_name = "King and Country"
	path = "king"

	lobby_icon = 'maps/exodus/exodus_lobby.dmi'



	station_levels = list(1,2,3,4)
	admin_levels = null
	contact_levels = list(1,2,3,4)
	player_levels = list(1,2,3,4)
	sealed_levels = list(1,2,3,4)
	empty_levels = list(4)
	accessible_z_levels = null
	base_turf_by_z = list("2" = /turf/simulated/floor/jungle/king/,"3" = /turf/simulated/open, "4" = /turf/simulated/open)

	station_name  = "Earth"
	station_short = "Earth"
	dock_name     = "Port Singlehold"
	boss_name     = "TBD"
	boss_short    = "TBD"
	company_name  = "TBD"
	company_short = "TBD"
	system_name = "TBD"

	shuttle_docked_message = "The scheduled Crew Transfer Shuttle to %Dock_name% has docked with the station. It will depart in approximately %ETD%"
	shuttle_leaving_dock = "The Crew Transfer Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %Dock_name% has been scheduled. The shuttle has been called. It will arrive in approximately %ETA%"
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."

	evac_controller_type = /datum/evacuation_controller/shuttle

/datum/map/king/perform_map_generation()
	new /datum/random_map/automata/cave_system(null, 1, 1, 2, 100, 100) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, 2, 64, 64)         // Create the mining ore distribution map.
	new /datum/random_map/automata/cave_system(null, 1, 1, 1, 100, 100) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, 1, 64, 64)         // Create the mining ore distribution map.
	return 1
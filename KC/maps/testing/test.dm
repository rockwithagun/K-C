#if !defined(USING_MAP_DATUM)

	#include "loadout/loadout_accessories.dm"
	#include "loadout/loadout_eyes.dm"
	#include "loadout/loadout_gloves.dm"
	#include "loadout/loadout_head.dm"
	#include "loadout/loadout_shoes.dm"
	#include "loadout/loadout_suit.dm"
	#include "loadout/loadout_uniform.dm"


	#include "test_unit_testing.dm"

	#include "../shared/exodus_torch/_include.dm"

	#include "../../code/modules/lobby_music/absconditus.dm"
	#include "../../code/modules/lobby_music/clouds_of_fire.dm"
	#include "../../code/modules/lobby_music/endless_space.dm"
	#include "../../code/modules/lobby_music/dilbert.dm"
	#include "../../code/modules/lobby_music/space_oddity.dm"

	#include "../shared/exodus_torch/_include.dm"

	#include "test-1.dmm"
	#include "test-2.dmm"
	#include "test-3.dmm"
	#include "test-4.dmm"


	#include "../../code/modules/lobby_music/chasing_time.dm"
	#include "../../code/modules/lobby_music/absconditus.dm"
	#include "../../code/modules/lobby_music/clouds_of_fire.dm"
	#include "../../code/modules/lobby_music/endless_space.dm"
	#include "../../code/modules/lobby_music/dilbert.dm"
	#include "../../code/modules/lobby_music/space_oddity.dm"
	#include "../../code/modules/lobby_music/Torch.dm"

	#define USING_MAP_DATUM /datum/map/king

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Torch

#endif

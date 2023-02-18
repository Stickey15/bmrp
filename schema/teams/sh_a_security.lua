TEAM_SECURITY = impulse.Teams.Define({
	name = "Security",
	color = Color(74, 110, 164, 255),
	description = [[Security are a important role in the Black Mesa Facility, they are tasked with maintining Security within the Black Mesa Facility, and are also tasked with containing breaches of anomolies and protecting personnel and classified information.]],
	loadout = {"impulse_hands", "weapon_physgun", "gmod_tool"},
	salary = 10,
	xp = 200,
	cp = true,
	model = "models/player/bms_guard.mdl",

	ranks = {
		{
			name = "PVT",
			description = "PVT",
			xp = 200,
		},
		{
			name = "PFC",
			description = "PFC",
			xp = 300,
		},
		{
			name = "LCPL",
			description = "LCPL",
			doorGroup = {1, 2},
			xp = 700,
		},
		{
			name = "CPL",
			description = "CPL",
			doorGroup = {1, 2, 3, 4},
			xp = 1000,
		},
		{
			name = "SGT",
			description = "SGT",
			doorGroup = {1, 2, 3, 4},
			xp = 1600,
		},
		{
			name = "CMD",
			description = "CMD",
			doorGroup = {1, 2, 3, 4},
			xp = 2000,
		}
	}
})

CLASS_SECURITY = 1

RANK_PVT = 1
RANK_PFC = 2
RANK_LANCECORPORAL = 3
RANK_CORPORAL = 4
RANK_SERGEANT = 5
RANK_CMD = 6
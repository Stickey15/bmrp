models = {"models/bmscientistcits/p_male_09.mdl", "models/bmscientistcits/p_male_08.mdl", "models/bmscientistcits/p_male_07.mdl","models/bmscientistcits/p_male_10.mdl","models/bmscientistcits/p_female_01.mdl", "models/player/blackmesa_scientific_female.mdl", "models/bmscientistcits/p_female_04.mdl", "models/bmscientistcits/p_male_05.mdl", "models/bmscientistcits/p_male_01.mdl", "models/bmscientistcits/p_female_03.mdl"}

TEAM_SCIENTIST = impulse.Teams.Define({
	name = "Scientist",
	color = Color(243, 218, 174, 255),
	description = [[Scientists are the backbone of Black Mesa. They are tasked with researching and obtaining anomalies primarily found in Xen.]],
	loadout = {"impulse_hands", "weapon_physgun", "gmod_tool"},
	salary = 40,
	xp = 400,
	cp = false,
	noMenu = false,
	switchAnywhere = true,
	model = "models/bmscientistcits/p_male_09.mdl",

	classes = {
		{
			name = "Bioworker",
			description = "wip",
			model = "models/hazmat/bmhaztechs.mdl",
			xp = 500
		},
		{
			name = "Medical Research",
			description = "wip",
			xp = 600
		},
		{
			name = "Survey Team",
			description = "wip",
			limit = 3,
			xp = 800
		}
	},

	quiz = {
		{
			question = "What is the backbone at Black Mesa?",
			answers = {
				{"Research", true},
				{"Survellence", false},
				{"Security", false}
			}
		},
		{
			question = "If a Xen anomalie breaches, what should you do?",
			answers = {
				{"Fight off the Xen anomalie and make a run for it.", false},
				{"Secure yourself into a room and lock the door, and radio in for Security.", true},
				{"Grab a weapon and fight the Xen anomalie", false},
				{"Run away", false}
			}
		},
		{
			question = "Who is required to green light a cross-species test?",
			answers = {
				{"Head of Security", false},
				{"Head of Research", true},
				{"The Administrator", true}
			}
		},
	},

})
CLASS_BIOWORKER = 1
CLASS_MEDICALRESEARCH = 2
CLASS_SURVEYTEAM = 3

onBecome =  function(ply)
local randommodel = math.random(1,6)
if randommodel == 1 then
ply:SetModel("models/bmscientistcits/p_male_09.mdl")
elseif randommodel == 2 then
ply:SetModel("models/bmscientistcits/p_male_08.mdl")
elseif randommodel == 3 then
ply:SetModel("models/bmscientistcits/p_male_07.mdl")
elseif randommodel == 4 then
ply:SetModel("models/bmscientistcits/p_male_10.mdl")
elseif randommodel == 5 then
ply:SetModel("models/bmscientistcits/p_female_01.mdl")
elseif randommodel == 6 then
ply:SetModel("models/player/blackmesa_scientific_female.mdl")
end
end
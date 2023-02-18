AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

	self:SetModel("models/props_c17/Lockers001a.mdl") -- model

	self:PhysicsInit(SOLID_VPHYSICS) -- dumb shit
	self:SetMoveType(MOVETYPE_VPHYSICS) -- dumb shit
	self:SetSolid(SOLID_VPHYSICS) -- dumb shit

	local phy = self:GetPhysicsObject()

	if phy:IsValid() then

		phy:Wake()

	end

end

concommand.Add( "devremovegear", function( ply, cmd, args )
ply:SetBodygroup(3, 0)
ply:SetBodygroup(2, 1)
end )


function ENT:Use( a , c , SIMPLE_USE )
local curTime = CurTime()
if a:Team() == TEAM_SECURITY then
if (self.nextUse or 0) > curTime then return end
self.nextUse = curTime + 5
a:Give("weapon_smg1")
self:EmitSound("npc/combine_soldier/zipline_clothing2.wav")
a:SetBodygroup(3, 1)
a:SetBodygroup(2, 0)
a:Notify("Equipped Vest and Helmet")
else
a:Notify("You are not the righ team to use this!")
end
end

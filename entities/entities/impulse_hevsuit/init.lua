AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

	self:SetModel("models/bmhev/bmhev.mdl") -- model

	self:PhysicsInit(SOLID_VPHYSICS) -- dumb shit
	self:SetMoveType(MOVETYPE_NONE) -- dumb shit
	self:SetSolid(SOLID_VPHYSICS) -- dumb shit

	local phy = self:GetPhysicsObject()

	if phy:IsValid() then

		phy:Wake()

	end

end

function ENT:Use( a , c , SIMPLE_USE )
local curTime = CurTime()
if a:GetTeamClassName() == "Survey Team" then
if (self.nextUse or 0) > curTime then 
a:Notify("This HEV suit is on cooldown")
return end
self.nextUse = curTime + 30
a:SetModel("models/player/bms_hev.mdl")
a:Notify("Equipped HEV Suit")
a:EmitSound("hl1/fvox/voice_on.wav")
else
a:Notify("You are not a Survey Team!")
end
end
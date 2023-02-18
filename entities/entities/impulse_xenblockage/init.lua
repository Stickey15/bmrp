AddCSLuaFile("shared.lua")
include("shared.lua")
function ENT:Initialize()
	local modelrandom = math.random(1, 3)
	if modelrandom == 1 then
	self:SetModel("models/props_canal/rock_riverbed01d.mdl") -- model
	elseif modelrandom == 2 then
	self:SetModel("models/props_canal/rock_riverbed01a.mdl") -- model
	elseif modelrandom == 3 then
	self:SetModel("models/props_canal/rock_riverbed01b.mdl")
	end
	self:SetMaterial("models/props/bm/xenmiddlethingamabob/c4a1a_swmpwl")
	self:PhysicsInit(SOLID_VPHYSICS) -- dumb shit
	self:SetMoveType(MOVETYPE_NONE) -- dumb shit
	self:SetSolid(SOLID_VPHYSICS) -- dumb shit
	self:SetNoDraw(false)
	self:SetHP(100)

	local phy = self:GetPhysicsObject()

	if phy:IsValid() then

		phy:Wake()
	end
end


function ENT:OnTakeDamage( dmginfo )
    local damage = dmginfo:GetDamage()
    print(damage)
    self:SetHP(self:GetHP() - damage)
end


function ENT:Think()
if self:GetHP() < 1 then
self:SetNoDraw(true)
self:SetSolid(SOLID_NONE)
self:SetHP(100)
timer.Create( "respawn".. self:EntIndex(), math.random(30,50), 1, function()
self:SetNoDraw(false)
self:SetSolid(SOLID_VPHYSICS)
timer.Remove("respawn" .. self:EntIndex())
end )
end
end
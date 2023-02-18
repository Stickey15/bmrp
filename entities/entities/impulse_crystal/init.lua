AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

function ENT:Initialize()
	local modelrandom = math.random(1, 3)
	if modelrandom == 1 then
	self:SetModel("models/props_abandoned/crystals_fixed/crystal_default/crystal_cluster_small_c.mdl") -- model
	elseif modelrandom == 2 then
	self:SetModel("models/props_abandoned/crystals_fixed/crystal_mined/crystal_small_pile_b.mdl") -- model
	elseif modelrandom == 3 then
	self:SetModel("models/props_abandoned/crystals_fixed/crystal_damaged/crystal_cluster_small_damaged_b.mdl")
	end
	self:SetSkin( math.random(0,9) )
	self:SetRare(math.random(1,3))
	self:PhysicsInit(SOLID_VPHYSICS) -- dumb shit
	self:SetMoveType(MOVETYPE_NONE) -- dumb shit
	self:SetSolid(SOLID_VPHYSICS) -- dumb shit
	self:EmitSound("impulse/sound/radiationsounds.mp3")
	self:SetNoDraw(false)

	local phy = self:GetPhysicsObject()

	if phy:IsValid() then

		phy:Wake()
	end
end

crystalspawns = {
""


}

function ENT:Use( a , caller , SIMPLE_USE )
if (a:GetModel() != "models/vortigaunt.mdl") then
if (self:GetNoDraw() == false) then
self:SetRare(math.random(1 , 3))
    local curTime = CurTime()
	if (self.nextMine or 0) > curTime then return end
	self.nextMine = curTime + 5
	if self:GetRare() == 1 then
	a:Notify("You picked up a common crystal")
	self:EmitSound("physics/glass/glass_impact_hard1.wav")
	self:EmitSound("physics/glass/glass_cup_break2.wav")
	self:SetNoDraw(true)
	self:SetSolid(SOLID_NONE)
	a:GiveInventoryItem("itemcommon_crystal")
	elseif self:GetRare() == 2 then
	a:Notify("You picked up a medium crystal")
	self:EmitSound("physics/glass/glass_impact_hard1.wav")
	self:EmitSound("physics/glass/glass_cup_break2.wav")
	self:SetNoDraw(true)
	self:SetSolid(SOLID_NONE)
	a:GiveInventoryItem("itemmedium_crystal")
	elseif self:GetRare() == 3 then
	a:Notify("You picked up a rare crystal")
	self:EmitSound("physics/glass/glass_impact_hard1.wav")
	self:EmitSound("physics/glass/glass_cup_break2.wav")
	self:SetNoDraw(true)
	self:SetSolid(SOLID_NONE)
	a:GiveInventoryItem("itemrare_crystal")
	end
end
timer.Create( "respawn".. self:EntIndex(), math.random(5,8), 1, function() 
self:SetNoDraw(false)
self:SetSolid(SOLID_VPHYSICS)
timer.Remove("respawn" .. self:EntIndex())
end )
end
end

function ENT:Think()
if (self:GetNoDraw() == false) then
	local entes = ents.FindInSphere(self:GetPos(), 600)
	local curTime = CurTime()
			local d = DamageInfo()
			d:SetDamage( 0 )
			d:SetAttacker( self.Entity )
			d:SetDamageType( DMG_GENERIC )
	for k, v in pairs(entes) do
		if v:IsPlayer() or v:IsNPC() then
		if (v:GetModel() != "models/player/bms_hev.mdl") and (v:GetModel() != "models/vortigaunt.mdl") then
			if (self.nextNotify or 0) > curTime then return end
			self.nextNotify = curTime + 1
			v:SetRads(v:GetSyncVar(SYNC_RADS) + math.random(1,4))
			v:EmitSound("impulse/radseffect.mp3")
		elseif (v:GetModel() == "models/player/bms_hev.mdl") then
		if (self.nextNotify or 0) > curTime then return end
		self.nextNotify = curTime + 5
		v:EmitSound("endhl1/fvox/chemical_detected.wav")
		end
	end
end
end
end
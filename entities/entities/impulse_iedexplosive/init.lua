AddCSLuaFile("shared.lua")
include("shared.lua")


ENT.Model = "models/weapons/w_c4_planted.mdl"

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
end

function ENT:Use(activator, caller)
    self:Beep() -- start beeping
    timer.Create("explosionTimer", 5, 1, function() self:Explode() end) -- start the 10 second countdown
end

function ENT:Beep()
    self:EmitSound("weapons/c4/c4_beep1.wav", 75, 100, 1, CHAN_ITEM) -- play the beep sound
    timer.Create("beepTimer", 1, 9, function() self:EmitSound("weapons/c4/c4_beep1.wav", 75, 100, 1, CHAN_ITEM) end) -- schedule 9 more beeps
end

function ENT:Explode()
    local pos = self:GetPos()
    local effectdata = EffectData()
    effectdata:SetStart(pos)
    effectdata:SetOrigin(pos)
    effectdata:SetScale(900)
    util.Effect("Explosion", effectdata)
    for _, v in pairs(ents.FindInSphere(pos, 400)) do
            v:TakeDamage(100, self, self)
            self:EmitSound("explosions/doi_ty_03_close.wav")
    end
    timer.Remove("beepTimer") -- Stop the beeping
    self:Remove()
end
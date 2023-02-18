AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_lab/reciever_cart.mdl")
    self:SetUseType(SIMPLE_USE)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_BBOX)
    self:PhysicsInit(SOLID_BBOX)
    self:DrawShadow(false)
    self.cable = nil
    self.last_sound = CurTime()
    local physObj = self:GetPhysicsObject()

    if (IsValid(physObj)) then
        physObj:EnableMotion(false)
        physObj:Sleep()
    end
end

function ENT:Use(activator, caller)
if activator:GetActiveWeapon():GetClass() == "impulse_hackingtool" then
self:CreateCable(caller)
timer.Create("cableTimer", 10, 1, function() self:RemoveCable() caller:Notify("Hacking complete!") end) -- start the 5 second countdown to remove the cable
caller:Notify("Hacking database...")
end
end

function ENT:CreateCable(caller)
    if IsValid(self.cable) then self.cable:Remove() end -- remove any existing cable
    if not IsValid(self.cable) then
    self.cable = constraint.Elastic( self, caller, 0, 0, Vector(0,0,0), Vector(-25,0,25), 100, 100, 0, "cable/cable2", 1 )
    self:EmitSound("physics/plastic/plastic_barrel_impact_hard1.wav")
end
end

function ENT:RemoveCable()
    if IsValid(self.cable) then self.cable:Remove() end
    if IsValid(self.soundEmitter) then self.soundEmitter:Stop() end
    self:EmitSound("physics/plastic/plastic_barrel_impact_hard1.wav")
    self.cable = nil
    -- create the particle effect
    local pos = self:GetPos()
end

function ENT:Think()
  if IsValid(self.cable) then
    if CurTime() - self.last_sound >= 2.0 then
      self:EmitSound("Breakable.Spark")
      self.last_sound = CurTime()
    end
  end
end




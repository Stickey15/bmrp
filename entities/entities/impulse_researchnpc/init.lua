AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/bmscientistcits/p_male_09.mdl")
    self:SetUseType(SIMPLE_USE)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_BBOX)
    self:PhysicsInit(SOLID_BBOX)
    self:DrawShadow(false)
    local physObj = self:GetPhysicsObject()

    if (IsValid(physObj)) then
        physObj:EnableMotion(false)
        physObj:Sleep()
    end

    timer.Simple(1, function()
        if IsValid(self) then
            self:DoAnimation()
        end
    end)
end

function ENT:SpawnFunction(ply, trace, class)
    local angles = (trace.HitPos - ply:GetPos()):Angle()
    angles.r = 0
    angles.p = 0
    angles.y = angles.y + 180

    local entity = ents.Create(class)
    entity:SetPos(trace.HitPos)
    entity:SetAngles(angles)
    entity:Spawn()

    return entity
end

function ENT:Use(activator, caller)
    if activator:Team() == 3 then
        activator:SendLua([[vgui.Create("impulseRankMenu")]])
    else
        activator:Notify("You are not the right team to use this!")
    end
end

if SERVER then
    util.AddNetworkString("impulseRankBecome")
    net.Receive("impulseRankBecome", function(len, ply)
        local division = net.ReadUInt(self.division, 8)
        local rank = net.ReadUInt(self.rank, 8)
        ply:Notify(value)
        ply:SetTeamClass(division)
        ply:SetTeamRank(rank)
        ply:SetRPName(ply:GetTeamRankName().."-" .. ply:Nick())
        ply:Notify("You became a "..ply:GetTeamRankName() )
    end)
end

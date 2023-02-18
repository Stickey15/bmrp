ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Xen Blockage"
ENT.Category = "impulse: Black Mesa"
ENT.Spawnable = true

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "HP")
end

ENT.HUDName = "The path is blocked by Xen fungus"
ENT.HUDDesc = "Maybe some explosives will help"


ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Crystal"
ENT.Category = "impulse: Black Mesa"
ENT.Spawnable = true

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "Rare")
end


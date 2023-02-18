local ITEM = {}

ITEM.UniqueID = "itemrare_crystal"
ITEM.Name = "Rare Crystal"
ITEM.Desc = "A piece of sparkling crystal."
ITEM.Model = Model("models/props_abandoned/crystals_fixed/crystal_mined/crystal_small_pile_b.mdl")
ITEM.FOV = 23.918338108883
ITEM.CamPos = Vector(-1.1461317539215, 25.21489906311, 63.037250518799)
ITEM.Weight = 0.1

ITEM.Droppable = true
ITEM.DropOnDeath = false

ITEM.Illegal = false
ITEM.CanStack = true

impulse.RegisterItem(ITEM)

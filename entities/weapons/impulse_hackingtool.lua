AddCSLuaFile()


if CLIENT then
	SWEP.PrintName = "Hacking tool"
	SWEP.Slot = 1
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = true
end

SWEP.ViewModel = Model("models/weapons/v_c4.mdl")
SWEP.WorldModel = Model("models/weapons/w_c4.mdl")

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.HoldType = "pistol"

SWEP.Spawnable = true
SWEP.Instructions = "Press E while holding to Hack a server"
SWEP.AdminSpawnable = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Category = "impulse: Black Mesa"
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
SWEP.IsAlwaysRaised = false
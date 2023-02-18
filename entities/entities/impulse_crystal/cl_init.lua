include("shared.lua")

surface.CreateFont( "impulse_crystal", {
    font = "CloseCaption_Bold",
    size = 55,
    weight = 1000
})

local color_white   = Color(255,255,255)
local color_red     = Color(255,0,0)
local color_green   = Color(0,255,0)
local color_black   = Color(0,0,0)


function ENT:Draw()
    self:DrawModel()

    local pos = self:GetPos()
    local ang = self:GetAngles()
	
	local dist = pos:Distance(LocalPlayer():GetPos())
	
	if (dist > 200) then return end

	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), -90)

    cam.Start3D2D(pos + self:GetForward() * (self:OBBMaxs().y - 5), ang, 0.11)
    if self:GetRare() == 1 then
    draw.DrawText( "Common Crystal", "impulse_crystal", 0, -350 + math.sin( CurTime() ) * 10, color_white, TEXT_ALIGN_CENTER )
    cam.End3D2D()
    elseif self:GetRare() == 2 then
    draw.DrawText( "Medium Crystal", "impulse_crystal", 0, -350 + math.sin( CurTime() ) * 10, color_green, TEXT_ALIGN_CENTER )
    cam.End3D2D()
    elseif self:GetRare() == 3 then
    draw.DrawText( "Rare Crystal", "impulse_crystal", 0, -350 + math.sin( CurTime() ) * 10, color_red, TEXT_ALIGN_CENTER )
    cam.End3D2D()
end
end
ENT.Type = "anim"
ENT.PrintName = "Research NPC"
ENT.Author = "vin"
ENT.Category = "impulse: Black Mesa"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.HUDName = "Head of Research"
ENT.HUDDesc = "Sell crystals here."

function ENT:DoAnimation()
	for k,v in ipairs(self:GetSequenceList()) do
		if (v:lower():find("idle") and v != "idlenoise") then
			return self:ResetSequence(k)
		end
	end

	self:ResetSequence(4)
end

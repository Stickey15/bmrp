ENT.Type = "anim"
ENT.PrintName = "Security Rank NPC"
ENT.Author = "vin"
ENT.Category = "impulse: Black Mesa"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.HUDName = "Security Commander"
ENT.HUDDesc = "Select your rank and loudout."

function ENT:DoAnimation()
	for k,v in ipairs(self:GetSequenceList()) do
		if (v:lower():find("idle") and v != "idlenoise") then
			return self:ResetSequence(k)
		end
	end

	self:ResetSequence(4)
end

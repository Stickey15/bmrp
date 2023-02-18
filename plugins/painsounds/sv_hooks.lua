function PLUGIN:GetPlayerPainSound(client)
	return
end

local OTAPAIN_SOUNDS = {
	Sound("npc/combine_soldier/pain1.wav"),
	Sound("npc/combine_soldier/pain2.wav"),
	Sound("npc/combine_soldier/pain3.wav")
}

function PLUGIN:PlayerHurt(ply, attacker, health, damage)
	if ply:Team() == TEAM_OTA then
        if ((ply.impulseNextPain or 0) < CurTime() and health > 0) then
            local painSound = hook.Run("GetPlayerPainSound", ply)
                or OTAPAIN_SOUNDS[math.random(#OTAPAIN_SOUNDS)]
            ply:EmitSound(painSound)
            ply.impulseNextPain = CurTime() + 0.33
        end
    end
end

local OTADEATH_SOUNDS = {
	Sound("npc/combine_soldier/die1.wav"),
	Sound("npc/combine_soldier/die2.wav"),
	Sound("npc/combine_soldier/die3.wav")
}

function PLUGIN:PlayerDeath(ply)
	if ply:Team() == TEAM_OTA then
        local deathSound = hook.Run("GetPlayerDeathSound", ply)
		or OTADEATH_SOUNDS[math.random(#OTADEATH_SOUNDS)]

	    ply:EmitSound(deathSound)
    end
end
util.AddNetworkString("PlayerStartChat")

function PLUGIN:ChatClassMessageSend(classID, message, sender)
    if not impulse.Voice.ChatTypes[classID] then
        return
    end
    
    for _, definition in ipairs(impulse.Voice.GetClass(sender)) do
        local sounds, message = impulse.Voice.GetVoiceList(definition.class, message)

        if (sounds) then
            local volume = 80

            if classID == 7 then -- whisper
                volume = 60
            elseif classID == 6 then -- yell
                volume = 150
            end
            
            if (definition.onModify) then
                if (definition.onModify(sender, sounds, classID, message) == false) then
                    continue
                end
            end
			
            if (definition.isGlobal) then
                netstream.Start(nil, "voicePlay", sounds, volume)
			else
                netstream.Start(nil, "voicePlay", sounds, volume, sender:EntIndex())

                if classID == 8 then -- radio
                    for v,k in pairs(player.GetAll()) do
                        if k:IsCP() and k != sender then
                            netstream.Start(k, "voicePlay", sounds, volume * 0.5)
                        end
                    end
                end

                if (classID == 57 or classID == 58) and sender:IsCP() then -- radio
                    for v,k in pairs(player.GetAll()) do
                        if (k:Team() == sender:Team()) and k != sender then
                            netstream.Start(k, "voicePlay", sounds, volume * 0.5)
                        end
                    end
                end
            end

            return message
        end
    end
end

net.Receive("PlayerStartChat", function(len, client)
	if (!client.bTypingBeep) then
        if ( impulse.Voice.BeepSounds[client:Team()] ) then
            if ( impulse.Voice.BeepSounds[client:Team()].on ) then
                client:EmitSound(impulse.Voice.BeepSounds[client:Team()].on[math.random(1, #impulse.Voice.BeepSounds[client:Team()].on)])
                client.bTypingBeep = true
            end
        end
	end
end)
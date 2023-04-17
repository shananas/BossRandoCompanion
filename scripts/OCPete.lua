local offset = 0x56450E

function _OnInit()
	if GAME_ID == 0x431219CC and ENGINE_TYPE == "BACKEND" then
		canExecute = true
		ConsolePrint("No Timer script loaded!")
		if ReadInt(0x2A5A056-offset) > 0 and ReadInt(0x2A59056-offset) == 0 then
			offset = 0x56550E
			offset2 = 0x56554E
			ConsolePrint("Detected JP version. If this is incorrect, try reloading at a different time")
		else
			ConsolePrint("Detected GLOBAL version. If this is incorrect, try reloading at a different time")
		end
	else
		ConsolePrint("KH2 not detected, not running script")
	end
end

function _OnFrame()
Now = 0x0714DB8 - 0x56454E
Place  = ReadShort(Now+0x00)
Timer = 0xAB9050 - 0x56454E

if Place == 0x0806 then
	WriteInt(Timer, 0) -- should always keep timer at 23 minutes??
	end
end

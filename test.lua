local component = require('component')
local term = require('term')
local radar = component.radar
local gpu = component.gpu

color = {
	green = 0x00ff00,
	yellow = 0xffb600,
	red = 0xff0000
}

-- Белый список ---
white = {
	Max = true,
	AdskiyGrifer12 = false
}


gpu.setResolution(35,15)

while true do
    local players = radar.getPlayers()
	term.clear()
	gpu.setForeground(color.yellow)
	gpu.set(2,1, 'В зоне обнаружения радара: '..#players..' чел.')
		for i = 1, #players do
			if white[players[i].name] then gpu.setForeground(color.green)
			else gpu.setForeground(color.red) end
			gpu.set(2, i+1, i..'. '..players[i].name)
			gpu.set(25, i+1, ' - '..floor(players[i].distance)..' м')
		end
	os.sleep(30)
end
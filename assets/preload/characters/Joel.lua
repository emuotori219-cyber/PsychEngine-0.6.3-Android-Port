local originy2 = 320




function onBeatHit()
local currentCharacter = getProperty('dad.curCharacter')

if currentCharacter == 'Joel' then
		setProperty('dad.y',originy2+80)
		doTweenY('abc','dad',originy2,3,'linear')
	end
end


local originy = 100


function onCreate()

	originy = getProperty('boyfriend.y')

end

function onBeatHit()
local currentCharacter = getProperty('boyfriend.curCharacter')

if currentCharacter == 'moe' then
		setProperty('boyfriend.y',originy+120)
		doTweenY('wifjwiaaf','boyfriend',originy,3,'linear')
	end
end


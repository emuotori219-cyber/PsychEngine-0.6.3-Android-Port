local currentBFCharacter = 'bf'
local currentDadCharacter = 'dad'

local bfShadowOffsets = {
    ['bf'] = {
        default = {x = -10, y = -135},
        singLEFT = {x = -40, y = -135},
        singDOWN = {x = -77, y = -125}
    },
    ['bf-left'] = {
        default = {x = 20, y = -135},
        singRIGHT = {x = 40, y = -135},
        singDOWN = {x = 77, y = -125}
    },
    ['bf-run'] = {
        default = {x = 100, y = -20}
    },
    ['moe'] = {
        default = {x = 9999, y = -9999}
    },			
    ['ShitBF'] = {
        default = {x = 9999, y = -9999}
    }	
}

local dadShadowOffsets = {
    ['Creepy Cutie'] = {
        default = {x = 30, y = -35},
        singLEFT = {x = 30, y = -35},
        singRIGHT = {x = 30, y = -35},
        singUP = {x = 30, y = -35},
        singDOWN = {x = 30, y = -35}
    },
    ['man'] = {
        default = {x = 9999, y = -9999}
    },	
    ['Joel'] = {
        default = {x = 9999, y = -9999}
    },		
    ['mo-transform'] = {
        default = {x = 9999, y = -9999}
    },		
    ['mo-p3'] = {
        default = {x = 9999, y = -9999}
    },	
    ['mike'] = {
        default = {x = 9999, y = -9999}
    },		
    ['rowan'] = {
        default = {x = 9999, y = -9999}
    },		
    ['mo'] = {
        default = {x = 24, y = -150},
        singLEFT = {x = 24, y = -150},
        singRIGHT = {x = 24, y = -150},
        singUP = {x = 24, y = -150},
        singDOWN = {x = 24, y = -150},
		['singLEFT-alt'] = {x = 24, y = -150},
		['singRIGHT-alt'] = {x = 44, y = -150},
		['singUP-alt'] = {x = 0, y = -150},
		['singDOWN-alt'] = {x = 45, y = -145}
    }	
    -- ['character-name'] = {
    --     default = {x = 0, y = 0},
    --     singLEFT = {x = 0, y = 0},
    --     singRIGHT = {x = 0, y = 0},
    --     singUP = {x = 0, y = 0},
    --     singDOWN = {x = 0, y = 0}
    -- }
}

function onCreate()
    makeLuaSprite('bfShadow','visual/shadow', 0, 0)
    addLuaSprite('bfShadow', true)
    
	
    makeLuaSprite('dadShadow','visual/shadow', 0, 0)
    addLuaSprite('dadShadow', true)
    setObjectOrder('dadShadow', getObjectOrder('dad') + 2)
	
	if songName == 'Scrub' then
	setProperty('dadShadow.alpha', 0)
	setProperty('bfShadow.alpha', 0)	
	end
	if songName == 'Far-lost' then
	setProperty('dadShadow.alpha', 0)
	setProperty('bfShadow.alpha', 0)	
	end	
	if songName == 'MANE' then
	setProperty('dadShadow.alpha', 0)
	setProperty('bfShadow.alpha', 0)	
	end	
	if songName == 'drained' then
	setProperty('dadShadow.alpha', 0)
	setProperty('bfShadow.alpha', 0)	
	end		
	if songName == 'gotchaliveaction' then
	setProperty('dadShadow.alpha', 0)
	setProperty('bfShadow.alpha', 0)	
	end	
	
end

function onCreatePost()
    currentBFCharacter = getProperty('boyfriend.curCharacter') or 'bf'
    currentDadCharacter = getProperty('dad.curCharacter') or 'dad'
    updateBFShadowPosition()
    updateDadShadowPosition()
	

			
	
end

function updateBFShadowPosition()
    local currentAnim = getProperty('boyfriend.animation.curAnim.name')
    local charOffsets = bfShadowOffsets[currentBFCharacter]
    
    if not charOffsets then 
        charOffsets = bfShadowOffsets['bf']
        if not charOffsets then
     
            return
        end
      
    end
    
    local shadowOffsetX, shadowOffsetY
    
    if charOffsets[currentAnim] then
        shadowOffsetX = charOffsets[currentAnim].x
        shadowOffsetY = charOffsets[currentAnim].y
    elseif currentAnim and string.find(currentAnim, 'miss') then
        local baseAnim = string.gsub(currentAnim, 'miss', '')
        if charOffsets[baseAnim] then
            shadowOffsetX = charOffsets[baseAnim].x
            shadowOffsetY = charOffsets[baseAnim].y
        else
            shadowOffsetX = charOffsets.default.x
            shadowOffsetY = charOffsets.default.y
        end
    elseif currentAnim and string.find(currentAnim, '-alt') then
        local baseAnim = string.gsub(currentAnim, '-alt', '')
        if charOffsets[baseAnim] then
            shadowOffsetX = charOffsets[baseAnim].x
            shadowOffsetY = charOffsets[baseAnim].y
        else
            shadowOffsetX = charOffsets.default.x
            shadowOffsetY = charOffsets.default.y
        end
    else
        shadowOffsetX = charOffsets.default.x
        shadowOffsetY = charOffsets.default.y
    end
    
    local bfX = getProperty('boyfriend.x')
    local bfY = getProperty('boyfriend.y')
    local bfWidth = getProperty('boyfriend.width')
    local bfHeight = getProperty('boyfriend.height')
    
    local shadowX = bfX + (bfWidth / 2) - (getProperty('bfShadow.width') / 2) + shadowOffsetX
    local shadowY = bfY + bfHeight + shadowOffsetY
    
    setProperty('bfShadow.x', shadowX)
    setProperty('bfShadow.y', shadowY)
    
   
    setProperty('bfShadow.alpha', 1)
 --   setProperty('bfShadow.color', 0xFF0000)
    
    if currentBFCharacter == 'bf-run' then
        setObjectOrder('bfShadow', getObjectOrder('boyfriend') + 100)
    else
        setObjectOrder('bfShadow', getObjectOrder('boyfriend') + 3)
		
		if songName == 'Despair' then
	        setObjectOrder('bfShadow', 7)
			end	
		

    end
end

function updateDadShadowPosition()
    local currentAnim = getProperty('dad.animation.curAnim.name')
    local charOffsets = dadShadowOffsets[currentDadCharacter]
    
    if not charOffsets then
     
        charOffsets = dadShadowOffsets.dad
    end
    
    local shadowOffsetX, shadowOffsetY
    
    if charOffsets[currentAnim] then
        shadowOffsetX = charOffsets[currentAnim].x
        shadowOffsetY = charOffsets[currentAnim].y
    elseif currentAnim and string.find(currentAnim, 'miss') then
        local baseAnim = string.gsub(currentAnim, 'miss', '')
        if charOffsets[baseAnim] then
            shadowOffsetX = charOffsets[baseAnim].x
            shadowOffsetY = charOffsets[baseAnim].y
        else
            shadowOffsetX = charOffsets.default.x
            shadowOffsetY = charOffsets.default.y
        end
    elseif currentAnim and string.find(currentAnim, '-alt') then
        local baseAnim = string.gsub(currentAnim, '-alt', '')
        if charOffsets[baseAnim] then
            shadowOffsetX = charOffsets[baseAnim].x
            shadowOffsetY = charOffsets[baseAnim].y
        else
            shadowOffsetX = charOffsets.default.x
            shadowOffsetY = charOffsets.default.y
        end
    else
        shadowOffsetX = charOffsets.default.x
        shadowOffsetY = charOffsets.default.y
    end
    
    local dadX = getProperty('dad.x')
    local dadY = getProperty('dad.y')
    local dadWidth = getProperty('dad.width')
    local dadHeight = getProperty('dad.height')
    
    local shadowX = dadX + (dadWidth / 2) - (getProperty('dadShadow.width') / 2) + shadowOffsetX
    local shadowY = dadY + dadHeight + shadowOffsetY
    
    setProperty('dadShadow.x', shadowX)
    setProperty('dadShadow.y', shadowY)
end

function onStepHit()
    if currentDadCharacter == 'Creepy Cutie' then
	 
        if curStep == 1152 then
            setProperty('dadShadow.alpha', 0)
        end
        if curStep == 1408 then
            setProperty('dadShadow.alpha', 1)
        end
    end

end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'Change Character' then
        if value2 == '1' or value2 == 1 or value2 == 'bf' then

            currentBFCharacter = value1
            runTimer('updateBFShadow', 0.1)
        elseif value2 == '0' or value2 == 0 or value2 == 'dad' then

            currentDadCharacter = value1
            runTimer('updateDadShadow', 0.1)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'updateBFShadow' then
        local actualChar = getProperty('boyfriend.curCharacter')
        if actualChar and actualChar ~= currentBFCharacter then
            currentBFCharacter = actualChar
         
        end
        updateBFShadowPosition()
    elseif tag == 'updateDadShadow' then
        local actualChar = getProperty('dad.curCharacter')
        if actualChar and actualChar ~= currentDadCharacter then
            currentDadCharacter = actualChar
          
        end
        updateDadShadowPosition()
    end
end

function onUpdate(elapsed)
    local actualBFChar = getProperty('boyfriend.curCharacter')
    if actualBFChar and actualBFChar ~= currentBFCharacter then
        currentBFCharacter = actualBFChar    
    end
    
    local actualDadChar = getProperty('dad.curCharacter')
    if actualDadChar and actualDadChar ~= currentDadCharacter then
        currentDadCharacter = actualDadChar
    end
    
    updateBFShadowPosition()
    updateDadShadowPosition()
end
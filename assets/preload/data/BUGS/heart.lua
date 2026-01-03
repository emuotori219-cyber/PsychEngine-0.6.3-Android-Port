local mechanicActive = false
local mechanicStartStep = 304
local mechanicEndStep = 572
local heartNoteTargetX = 0
local hitTolerance = 50

local activeHeartNotes = {}
local heartNoteCounter = 0
local isLeftNote = true

local groupX = 0
local groupY = -100
local groupScale = 0.3

local earlyHitDistance = 600 

local heartMisses = 0
local maxHeartMisses = 3


local baseSpeed = 1.0
local speedMultiplier = 1.0
local speedIncrease = 0.1 


local livesSprites = {}

local heartSteps = {
    320, 322, 328, 330, 336, 338, 344, 346, 352, 354, 360, 362, 368, 370, 376, 378, 384, 386,
    392, 394, 400, 402, 408, 410, 416, 418, 424, 426, 432, 434, 440, 442, 456, 472,
    504, 520, 536, 560, 568 
}

local heartStepsLookup = {}
local spawnedSteps = {}

function onCreate()

if middlescroll then
 groupY = -150
 else
  groupY = -100
end

    heartMisses = 0
    speedMultiplier = baseSpeed 

    makeAnimatedLuaSprite('heartOverlay', 'Notes/heartMechanic', 0, 0) 
    addAnimationByPrefix('heartOverlay', 'idle', 'idle', 12, true)
    addAnimationByPrefix('heartOverlay', 'Pressed', 'pressed', 10, false)
    setObjectCamera('heartOverlay', 'hud')
    playAnim('heartOverlay', 'idle', true)
    addLuaSprite('heartOverlay', false)
    setProperty('heartOverlay.visible', false)
    setProperty('heartOverlay.alpha', 0)
    

    for i = 1, 3 do
        local livesSpriteName = 'livesSprite_' .. i
        makeAnimatedLuaSprite(livesSpriteName, 'Notes/lives', 0, 0)
        addAnimationByPrefix(livesSpriteName, 'idle', 'idle', 12, true)
        addAnimationByPrefix(livesSpriteName, 'lost', 'lost', 12, true)
        setObjectCamera(livesSpriteName, 'hud')
        playAnim(livesSpriteName, 'idle', true)
        addLuaSprite(livesSpriteName, false)
        setProperty(livesSpriteName .. '.visible', false)
        setProperty(livesSpriteName .. '.alpha', 0)
        

        local livesX = groupX + ((i - 2) * 300) 
        local livesY = groupY - 100
        setProperty(livesSpriteName .. '.x', livesX)
        setProperty(livesSpriteName .. '.y', livesY)
        setProperty(livesSpriteName .. '.scale.x', groupScale * 0.8)
        setProperty(livesSpriteName .. '.scale.y', groupScale * 0.8)
        
        table.insert(livesSprites, livesSpriteName)
    end
    
    updateHeartOverlayTransform()
    
    for i, step in ipairs(heartSteps) do
        heartStepsLookup[step] = true
    end
end

function updateHeartOverlayTransform()
    setProperty('heartOverlay.x', groupX)
    setProperty('heartOverlay.y', groupY)
    setProperty('heartOverlay.scale.x', groupScale)
    setProperty('heartOverlay.scale.y', groupScale)
end

function updateHeartNoteTransform(spriteName, relativeX, relativeY)
    local finalX = groupX + (relativeX * groupScale)
    local finalY = groupY + (relativeY * groupScale)
    
    setProperty(spriteName .. '.x', finalX)
    setProperty(spriteName .. '.y', finalY)
    setProperty(spriteName .. '.scale.x', groupScale)
    setProperty(spriteName .. '.scale.y', groupScale)
end

function updateLivesPositions()
    for i, spriteName in ipairs(livesSprites) do
        local livesX = groupX + ((i - 2) * 300 * groupScale) 
        local livesY = groupY - 150 
        setProperty(spriteName .. '.x', livesX)
        setProperty(spriteName .. '.y', livesY)
        setProperty(spriteName .. '.scale.x', groupScale * 0.8) 
        setProperty(spriteName .. '.scale.y', groupScale * 0.8)
    end
end

function onStepHit()
    if curStep == mechanicStartStep then
        mechanicActive = true
        spawnedSteps = {}
        heartMisses = 0  
        speedMultiplier = baseSpeed 
        setProperty('heartOverlay.visible', true)
        doTweenAlpha('heartOverlayFadeIn', 'heartOverlay', 1, 0.5, 'linear')
        

        for i, spriteName in ipairs(livesSprites) do
            setProperty(spriteName .. '.visible', true)
            doTweenAlpha(spriteName .. '_fadeIn', spriteName, 1, 0.5, 'linear')
            playAnim(spriteName, 'idle', true)
        end
        updateLivesPositions()
    end
    
    if curStep == mechanicEndStep then
        doTweenAlpha('heartOverlayFadeOut', 'heartOverlay', 0, 0.0001, 'linear')
        

        for i, spriteName in ipairs(livesSprites) do
            doTweenAlpha(spriteName .. '_fadeOut', spriteName, 0, 0.3, 'linear')
        end
        
        for i, note in pairs(activeHeartNotes) do
            doTweenAlpha(note.spriteName .. '_fadeOut', note.spriteName, 0, 0.3, 'linear')
        end
        return
    end
    
    if mechanicActive then
        for i, targetStep in ipairs(heartSteps) do
            if curStep == targetStep - 2 and not spawnedSteps[targetStep] then
                spawnHeartNote(targetStep)
                spawnedSteps[targetStep] = true
                break
            end
        end
    end
end

function spawnHeartNote(targetStep)
    heartNoteCounter = heartNoteCounter + 1
    local spriteName = 'heartNote_' .. heartNoteCounter
    
    local relativeSpawnX = isLeftNote and -640 or 800
    local relativeSpawnY = 0 
    
    makeLuaSprite(spriteName, 'Notes/heartNote', 0, 0) 
    setObjectCamera(spriteName, 'hud')
    addLuaSprite(spriteName, false)
    setProperty(spriteName .. '.alpha', 1)
    
    updateHeartNoteTransform(spriteName, relativeSpawnX, relativeSpawnY)
    
    local baseLeftSpeed = 13 * 3
    local baseRightSpeed = -15 * 3
    
    local newNote = {
        spriteName = spriteName,
        targetStep = targetStep,
        startStep = curStep,
        relativeX = relativeSpawnX, 
        relativeY = relativeSpawnY,
        targetRelativeX = 0, 
        speed = isLeftNote and (baseLeftSpeed * speedMultiplier) or (baseRightSpeed * speedMultiplier),
        missed = false,
        isLeft = isLeftNote
    }
    table.insert(activeHeartNotes, newNote)
    
    isLeftNote = not isLeftNote
end

function onUpdate(elapsed)
    if not mechanicActive then
        return
    end
    
    local anyNotesActive = false
    
    for i = #activeHeartNotes, 1, -1 do
        local note = activeHeartNotes[i]
        if note and not note.missed then
            note.relativeX = note.relativeX + (note.speed * elapsed * 60)
            
            updateHeartNoteTransform(note.spriteName, note.relativeX, note.relativeY)
            
            if (note.isLeft and note.relativeX >= 80) or (not note.isLeft and note.relativeX <= -80) then
                doTweenAlpha(note.spriteName .. '_fadeOut', note.spriteName, 0, 0.1, 'linear')
                table.remove(activeHeartNotes, i)
                missHeartNote(note)
            else
                local distanceFromTarget = math.abs(note.relativeX - heartNoteTargetX)
                note.canHit = distanceFromTarget <= earlyHitDistance
                anyNotesActive = true
                
                if getProperty('cpuControlled') == true then
                    if distanceFromTarget <= hitTolerance then
                        hitHeartNote(note, distanceFromTarget)
                        table.remove(activeHeartNotes, i)
                    end
                end
            end
        end
    end
    
    if anyNotesActive then
        setProperty('heartOverlay.color', getColorFromHex('FFAAAA'))
    else
        setProperty('heartOverlay.color', getColorFromHex('FFFFFF'))
    end
end

function onUpdatePost(elapsed)
    if not mechanicActive then return end
    
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        handleKeyPress()
    end
end

function handleKeyPress()
    local bestNote = nil
    local bestDistance = math.huge
    
    for i, note in pairs(activeHeartNotes) do
        if note and note.canHit and not note.missed then
            local distance = math.abs(note.relativeX - heartNoteTargetX)
            
            if distance < bestDistance then
                bestDistance = distance
                bestNote = note
            end
        end
    end
    
    if bestNote then
        hitHeartNote(bestNote, bestDistance)
        for i, activeNote in pairs(activeHeartNotes) do
            if activeNote and activeNote.spriteName == bestNote.spriteName then
                table.remove(activeHeartNotes, i)
                break
            end
        end
    end
end

function hitHeartNote(note, distance)
    doTweenAlpha(note.spriteName .. '_fadeOut', note.spriteName, 0, 0.2, 'linear')
    
    playAnim('heartOverlay', 'Pressed', true)
    runTimer('resetOverlay', 0.15)
    addScore(200)
    addHealth(0.03)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resetOverlay' and mechanicActive then
        playAnim('heartOverlay', 'idle', true)
    end
end

function onTweenCompleted(tag)
    if string.find(tag, '_fadeOut') then
        local spriteName = string.gsub(tag, '_fadeOut', '')
        if luaSpriteExists(spriteName) then
            removeLuaSprite(spriteName, true)
        end
    end
    
    if tag == 'heartOverlayFadeOut' then
        mechanicActive = false
        setProperty('heartOverlay.visible', false)
        
        for i, spriteName in ipairs(livesSprites) do
            setProperty(spriteName .. '.visible', false)
        end
        
        for i, note in pairs(activeHeartNotes) do
            if luaSpriteExists(note.spriteName) then
                removeLuaSprite(note.spriteName, true)
            end
        end
        activeHeartNotes = {}
        spawnedSteps = {}
    end
end

function missHeartNote(note)
    heartMisses = heartMisses + 1
    

    speedMultiplier = speedMultiplier + speedIncrease
    
    for i, activeNote in pairs(activeHeartNotes) do
        if activeNote and not activeNote.missed then
            local baseSpeed = math.abs(activeNote.speed) / (speedMultiplier - speedIncrease) 
            activeNote.speed = activeNote.isLeft and (baseSpeed * speedMultiplier) or (-baseSpeed * speedMultiplier)
        end
    end
    
    if heartMisses <= 3 and livesSprites[heartMisses] then
        playAnim(livesSprites[heartMisses], 'lost', true)
    end
    
    addMisses(1)
    addScore(-200)
    
    if heartMisses >= maxHeartMisses then
        setProperty('health', -1) 
    else
        addHealth(-0.1)
    end
end

function onDestroy()
    for i, note in pairs(activeHeartNotes) do
        if note then
            cancelTween(note.spriteName .. '_fadeOut')
            if luaSpriteExists(note.spriteName) then
                removeLuaSprite(note.spriteName, true)
            end
        end
    end
    activeHeartNotes = {}

    for i, spriteName in ipairs(livesSprites) do
        if luaSpriteExists(spriteName) then
            cancelTween(spriteName .. '_fadeIn')
            cancelTween(spriteName .. '_fadeOut')
            removeLuaSprite(spriteName, true)
        end
    end
    livesSprites = {}
    
    if luaSpriteExists('heartOverlay') then
        cancelTween('heartOverlayFadeIn')
        cancelTween('heartOverlayFadeOut')
        removeLuaSprite('heartOverlay', true)
    end
end

function setHeartMechanicPosition(x, y)
    groupX = x
    groupY = y
    
    if luaSpriteExists('heartOverlay') then
        updateHeartOverlayTransform()
    end
    
    updateLivesPositions()
    
    for i, note in pairs(activeHeartNotes) do
        if note and luaSpriteExists(note.spriteName) then
            updateHeartNoteTransform(note.spriteName, note.relativeX, note.relativeY)
        end
    end
end

function setHeartMechanicScale(scale)
    groupScale = scale
    
    if luaSpriteExists('heartOverlay') then
        updateHeartOverlayTransform()
    end
    
    for i, note in pairs(activeHeartNotes) do
        if note and luaSpriteExists(note.spriteName) then
            updateHeartNoteTransform(note.spriteName, note.relativeX, note.relativeY)
        end
    end
end

function getHeartMechanicPosition()
    return groupX, groupY
end

function getHeartMechanicScale()
    return groupScale
end
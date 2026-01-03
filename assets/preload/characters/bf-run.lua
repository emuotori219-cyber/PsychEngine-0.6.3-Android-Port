-- bf-run.lua
-- Running boyfriend character script (shadow handled by shadow-manager.lua)

local initialBfX = -235
local initialBfY = 825
local feetStartX = -135  
local feetStartY = 910  
local bounceHeight = 10  
local bounceSpeed = 0.15 
local runningLeft = false
local isRunning = false

function onCreate()
    makeAnimatedLuaSprite('bfrunning','characters/Boyfriend-feet', feetStartX, feetStartY);
    addAnimationByPrefix('bfrunning','idle','Idle',30,true);
    setObjectCamera('bfrunning', 'camGame', true);	
    scaleObject('bfrunning', 0.8, 0.8)
    setProperty('bfrunning.alpha', 0)
    setObjectOrder('bfrunning', 7)
    addLuaSprite('bfrunning', true)
end

function onCreatePost()
    if curStep == 1344 then
        setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-deadright');
        setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); 
        setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver'); 
        setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd'); 
    end
end

function onUpdate(elapsed)
    local currentBfX = getProperty('boyfriend.x')
    local currentBfY = getProperty('boyfriend.y')
    
    local moveX = currentBfX - initialBfX
    local moveY = currentBfY - initialBfY
    
    setProperty('bfrunning.x', feetStartX + moveX)
    setProperty('bfrunning.y', feetStartY + moveY)
end

function startBounceAnimation()
    doTweenY('bfBounceUp', 'boyfriend', initialBfY - bounceHeight, bounceSpeed, 'sineInOut')
end

function startRunningAnimation()
    isRunning = true
    runningLeft = true
    doTweenX('runLeft', 'boyfriend', getProperty('boyfriend.x') - 30, 0.5, 'sineInOut')
end

function stopRunningAnimation()
    isRunning = false
    cancelTween('runLeft')
    cancelTween('runRight')
end

function onTweenCompleted(tag)
    if tag == 'bfBounceUp' then
        doTweenY('bfBounceDown', 'boyfriend', initialBfY + bounceHeight, bounceSpeed, 'sineInOut')
    elseif tag == 'bfBounceDown' then
        doTweenY('bfBounceUp', 'boyfriend', initialBfY - bounceHeight, bounceSpeed, 'sineInOut')
    elseif tag == 'Torso' and isRunning then
        startRunningAnimation()
    elseif tag == 'runLeft' and isRunning then
        runningLeft = false
        doTweenX('runRight', 'boyfriend', getProperty('boyfriend.x') + 60, 1.0, 'sineInOut')
    elseif tag == 'runRight' and isRunning then
        runningLeft = true
        doTweenX('runLeft', 'boyfriend', getProperty('boyfriend.x') - 60, 1.0, 'sineInOut')
    end
end

function onStepHit()
    if curStep == 1343 then
    end
    if curStep == 1344 then
        initialBfX = getProperty('boyfriend.x')
        initialBfY = getProperty('boyfriend.y')
        setProperty('bfrunning.color', 0x82526B)
        setProperty('bfrunning.alpha', 1)
        doTweenX('Torso', 'boyfriend', 1060, 3,'expoOut')
        startBounceAnimation()
        isRunning = true
    end
    if curStep == 2492 then
        stopRunningAnimation()
        doTweenX('Torso', 'boyfriend', 3060, 10,'expoOut')
    end
end
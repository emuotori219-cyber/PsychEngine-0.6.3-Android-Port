local allowCountdown = false
local warningimage = 'warn/MO' 
local buttonimage = 'warn/continue'
local confirmed = 0
local buttonX = 900
local buttonY = 430
local buttonClickable = false 
local delayTimer = 0
local sessionFileName = 'isolationGuidance' 
local hasSeenWarning = false

function onCreate()
    initSaveData(sessionFileName)
    
    hasSeenWarning = getDataFromSave(sessionFileName, 'hasSeenWarningThisSession', false)
    
    if hasSeenWarning then
        allowCountdown = true
        return
    end
    
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
    
    makeLuaSprite('warningimage', warningimage, 0, 720)
    screenCenter('warningimage', 'x')
    setObjectCamera('warningimage', 'other')
    
    makeLuaSprite('continuebutton', buttonimage, buttonX, 720 + 200)
    setObjectCamera('continuebutton', 'other')
    
    setProperty('continuebutton.alpha', 0.5)
    
    addLuaSprite('warningimage', true)
    addLuaSprite('continuebutton', true)
    
    playSound('pageOpen')
    
    doTweenY('warningimagetween', 'warningimage', 0, 1, 'expoOut')
    doTweenY('buttonmovetween', 'continuebutton', buttonY + 200, 1, 'backOut')
    
    runTimer('buttonDelay', 40)
	runTimer('buttonDelay2', 1)

end

function onTimerCompleted(tag)
    if tag == 'buttonDelay' then
        buttonClickable = true
        doTweenAlpha('buttonReady', 'continuebutton', 1, 0.5, 'quadOut')
        playSound('consoleOpen') 
 
    elseif tag == 'buttonDelay2' then
        playSound('MOdialog') 
        
end
end

function onStartCountdown()
    if not allowCountdown then
        return Function_Stop
    end
    if allowCountdown then
        return Function_Continue
    end
end

function onUpdate()
    if hasSeenWarning then
        return
    end
    
    if mouseClicked('left') and confirmed == 0 and buttonClickable then 
        local mouseX = getMouseX('other')
        local mouseY = getMouseY('other')
        local buttonObjX = getProperty('continuebutton.x')
        local buttonObjY = getProperty('continuebutton.y')
        local buttonWidth = getProperty('continuebutton.width')
        local buttonHeight = getProperty('continuebutton.height')
        
        if mouseX >= buttonObjX and mouseX <= buttonObjX + buttonWidth and mouseY >= buttonObjY and mouseY <= buttonObjY + buttonHeight then
            setDataFromSave(sessionFileName, 'hasSeenWarningThisSession', true)
            flushSaveData(sessionFileName)
            
            allowCountdown = true
            startCountdown()
            
            doTweenY('warningImageExit', 'warningimage', -720, 2, 'expoOut')
            doTweenAlpha('warningImageFade', 'warningimage', 0, 1.2, 'expoOut')
            
            doTweenY('buttonExit', 'continuebutton', 720 + 200, 2, 'expoOut')
            doTweenAlpha('buttonFade', 'continuebutton', 0, 1.2, 'expoOut')
            
            playSound('pageClose')
            confirmed = 1
        end
    end
end

function onDestroy()
    if sessionFileName then
        flushSaveData(sessionFileName)
    end
end

function resetWarningSession()
    initSaveData(sessionFileName)
    setDataFromSave(sessionFileName, 'hasSeenWarningThisSession', false)
    flushSaveData(sessionFileName)
end
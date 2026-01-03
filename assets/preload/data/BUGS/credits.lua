local musicBy = {"NotFahi"}
local codedBy = {"BlueberryIceFox", "NotFahi"}
local iconsBy = {"Alicedarealcreator", "HiAdolfoHere"}
local animatedBy = {"NotFahi", "Haro", "Alicedarealcreator"}
local chartedBy = {"NotFahi"}
local creditLines = {}
local currentCreditIndex = 1
local displayTimer = 0
local currentAlpha = 0
local isActive = true
local hasFinished = false
local FADE_IN_TIME = 1.0
local DISPLAY_TIME = 3.0
local FADE_OUT_TIME = 1.0
local TOTAL_CYCLE_TIME = FADE_IN_TIME + DISPLAY_TIME + FADE_OUT_TIME
local creditsX = 0 
local creditsY = 0 
local fontSize = 14

function onCreate()
    calculateCreditsPosition()
    createCreditTexts()
    startNewCreditsCycle()
end

function calculateCreditsPosition()
  
    creditsX = screenWidth - 10 
    

    if downscroll then
        creditsY = 10 
    else
        creditsY = screenHeight - 50 
    end
end

function createCreditTexts()
    local tag = 'creditLine1'
    
    makeLuaText(tag, '', 0, creditsX + 100, creditsY) 
    setTextSize(tag, fontSize)
    setTextColor(tag, 'FFFFFF')
    setProperty(tag .. '.alpha', 0)
    addLuaText(tag)
    setProperty(tag .. '.borderSize', 1)
    setProperty(tag .. '.borderColor', 0x000000)
    
  
    setTextAlignment(tag, 'right')
    
    table.insert(creditLines, tag)
end

function startNewCreditsCycle()
    generateCurrentCredit()
    displayTimer = 0
    local tag = creditLines[1]
    

    local textWidth = getTextWidth(tag)
    local finalX = creditsX - textWidth
    
    setProperty(tag .. '.x', creditsX + 100) 
    setProperty(tag .. '.alpha', 0)
    doTweenX(tag .. 'MoveIn', tag, finalX, FADE_IN_TIME, 'expoOut')
    doTweenAlpha(tag .. 'FadeIn', tag, 1, FADE_IN_TIME, 'expoOut')
end

function generateCurrentCredit()
    local credits = {musicBy, codedBy, iconsBy, animatedBy, chartedBy}
    local labels = {"Music", "Coded", "Icons", "Animated", "Charted"}
    local currentCredit = credits[currentCreditIndex]
    local label = labels[currentCreditIndex]
    local names = table.concat(currentCredit, ", ")
    local creditLine = label .. " By: " .. names
    setTextString(creditLines[1], creditLine)
    
    currentCreditIndex = currentCreditIndex + 1
    if currentCreditIndex > #credits then
        hasFinished = true
    end
end

function onUpdate(elapsed)
    if not isActive then return end
    
    displayTimer = displayTimer + elapsed
    if displayTimer >= FADE_IN_TIME + DISPLAY_TIME then
        isActive = false
        local tag = creditLines[1]
        doTweenX(tag .. 'MoveOut', tag, creditsX + 300, FADE_OUT_TIME, 'expoIn')
        doTweenAlpha(tag .. 'FadeOut', tag, 0, FADE_OUT_TIME, 'expoIn')
    end
end

function onTweenCompleted(tag)
    if string.find(tag, 'FadeOut') and not hasFinished then
        isActive = true
        startNewCreditsCycle()
    end
end

function onDestroy()
    for _, tag in ipairs(creditLines) do
        removeLuaText(tag)
    end
end
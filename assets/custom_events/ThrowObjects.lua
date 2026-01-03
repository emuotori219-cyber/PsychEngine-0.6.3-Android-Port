local objects = {'object1', 'object2', 'object3', 'object4', 'object5'}
local omgnumbers = 0;
local shakeTimer = 0;
local isShaking = false;

function onCreate()
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
end

function onEvent(name, value1, value2)
    if name == "ThrowObjects" then
    DodgeTime = (value1);	
	
	makeLuaSprite('WarningIndicator', 'mechanics/ThrowObjects/symbol',500,230)
	setObjectCamera('WarningIndicator', 'camOther')
	scaleObject('WarningIndicator', 0.3, 0.3)
	addLuaSprite('WarningIndicator', true);
	
	doTweenAlpha('warningFlicker', 'WarningIndicator', 0, 0.1, 'linear');
	
	makeLuaSprite('TimerForItToGoOff', 'empty', -500,-500)
	makeGraphic('TimerForItToGoOff', 2560, 1440, '000000')
	addLuaSprite('TimerForItToGoOff', true)
	setLuaSpriteScrollFactor('TimerForItToGoOff', 0, 0);
	scaleLuaSprite('TimerForItToGoOff', 10, 10)	
	setObjectCamera('TimerForItToGoOff', 'camGame')
	setProperty('TimerForItToGoOff.alpha', 0)
	doTweenX('timercountdown1', 'TimerForItToGoOff', 144, DodgeTime, 'sineinout');
	
	playSound('throwobjects/goofiwarn', 2);
	
	
	
if getProperty('cpuControlled') == true then
            Dodged = true
            dodged = math.random(1, 5)
            playSound('throwobjects/dodge'..dodged, 2)
            characterPlayAnim('boyfriend', 'dodge', true)
            setProperty('boyfriend.specialAnim', false)
            removeLuaSprite('WarningIndicator')
            cancelTween('warningFlicker')
        else
            canDodge = true
            runTimer('wompwomp', DodgeTime)
	    end	
end
end

function onUpdate()
   if canDodge == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then 
   
   Dodged = true;
   dodged = math.random(1, 5)
   playSound('throwobjects/dodge'..dodged, 2)
   characterPlayAnim('boyfriend', 'dodge', true); 
   setProperty('boyfriend.specialAnim', false);
   removeLuaSprite('WarningIndicator');
   cancelTween('warningFlicker')
   canDodge = false
   end
   
 
   if isShaking then
       shakeTimer = shakeTimer + 1
       if shakeTimer <= 20 then 
           setProperty('iconP1.angle', getRandomFloat(-8, 8))
       elseif shakeTimer <= 30 then 
           local returnProgress = (shakeTimer - 20) / 10
           local currentAngle = getProperty('iconP1.angle')
           setProperty('iconP1.angle', currentAngle * (1 - returnProgress))
       else
        
           setProperty('iconP1.angle', 0)
           isShaking = false
           shakeTimer = 0
       end
   end
end

function onTweenCompleted(tag)
if tag == 'timercountdown1' and Dodged == false then 

    setProperty('boyfriend.color', 0xFF0000)
	setProperty('iconP1.color', 0xFF0000)
	doTweenColor('muhahaha', 'boyfriend', 0xFFFFFFFF, 0.3, 'quadInOut')
	doTweenColor('muhahaha2', 'iconP1', 0xFFFFFFFF, 0.3, 'quadInOut')
    
	local currentObjName = 'objection'..omgnumbers
	
	triggerEvent('Screen Shake','0.5, 0.01','0.01', '0.00')
	

	makeLuaSprite(currentObjName, 'mechanics/ThrowObjects/objects/'..objects[getRandomInt(1, #objects)], -100,-100 );
	setObjectCamera(currentObjName, 'camHud');
	setObjectOrder(currentObjName, 99999);
	

	scaleObject(currentObjName, 1, 1);  
	addLuaSprite(currentObjName, true);
	

	doTweenX('objScale'..omgnumbers..'X', currentObjName..'.scale', 0.5, 0.2, 'cubeOut');
	doTweenY('objScale'..omgnumbers..'Y', currentObjName..'.scale', 0.5, 0.2, 'cubeOut');
	

	runTimer('startSlide'..omgnumbers, 0.1);
	
	omgnumbers = omgnumbers+1;
       addHealth(-0.12)
       addMisses(1)
	   
        playSound('throwobjects/ouch', 2);
        characterPlayAnim('boyfriend','hurt',true) 
        setProperty('boyfriend.specialAnim', true)
        

        isShaking = true
        shakeTimer = 0
		
		
   removeLuaSprite('WarningIndicator');
   cancelTween('warningFlicker')
   
   
   
elseif tag == 'timercountdown1' and Dodged == true and canDodge == true then
   canDodge = false
   Dodged = false
   
elseif tag == 'warningFlicker' then
    if getProperty('WarningIndicator.alpha') <= 0.5 then
        doTweenAlpha('warningFlicker', 'WarningIndicator', 1, 0.1, 'linear');
    else
        doTweenAlpha('warningFlicker', 'WarningIndicator', 0, 0.1, 'linear');
    end


elseif string.find(tag, 'objSlide') then
    local objNum = string.match(tag, '%d+')
    removeLuaSprite('objection'..objNum);
end
end

function onTimerCompleted(tag, loops, loopsLeft)  
if tag == 'wompwomp' and Dodged == false then
canDodge = false
elseif tag == 'wompwomp' and Dodged == true then
canDodge = true


elseif string.find(tag, 'startSlide') then
    local objNum = string.match(tag, '%d+')
    local currentObjName = 'objection'..objNum
    

    doTweenY('objSlide'..objNum, currentObjName, 800, 1, 'cubeIn');
    
 
    doTweenAngle('objRotate'..objNum, currentObjName, 360, 1, 'linear');
    

    doTweenX('objSlideX'..objNum, currentObjName, getProperty(currentObjName..'.x') + math.random(-100, 100), 1.5, 'cubeIn');
end
end
dofile("mods/custom_scripts/functions.lua")

hudthing = {'healthBar','scoreTxt','iconP1','iconP2','timeBar','timeTxt', 'woundsTxt', 'statusTxt', 'songNameTxt'}

local isMiddlescroll = false

function onCountdownTick(counter)
	if counter == 0 then
	NoteSwap(true)
	end
	end
	



function onCreatePost()

isMiddlescroll = middlescroll

	makeLuaSprite('blackBG', 'empty', -500,-500)
	makeGraphic('blackBG', 2560, 1440, '000000')
	addLuaSprite('blackBG', true)
	setLuaSpriteScrollFactor('blackBG', 0, 0);
	scaleLuaSprite('blackBG', 10, 10)	
	setObjectCamera('blackBG', 'camHUD')
    setObjectOrder('blackBG', 1)
	setProperty('blackBG.alpha', 1)
	 setProperty('cameraSpeed', 0.5)
	 
	makeAnimatedLuaSprite('static','visual/static',0,0);
	setScrollFactor('static', 0, 0);
	addAnimationByPrefix('static','idle','idle',24,true);
	setObjectCamera('static', 'camHUD', true);	
	setProperty('static.alpha', 0)
	setObjectOrder('static', 1);	 
	
	makeLuaSprite('blackNoisevignette','visual/blackNoisevignette',0,0);
	setScrollFactor('blackNoisevignette', 0, 0);
	setObjectCamera('blackNoisevignette', 'camHUD', true);	
	setProperty('blackNoisevignette.alpha', 0)
	setObjectOrder('blackNoisevignette', 1);		
	addLuaSprite('blackNoisevignette', true)		
	 
	 setProperty('dad.color', 000000);
	 

		makeLuaText("signal", "Over Here!", 6000, -275, 350)
    addLuaText("signal", true)
    setTextSize("signal", 30)
    setTextBorder("signal", 2, "000000")
    setTextAlignment("signal", "center")	
	 
 
	 
	 
end

function onUpdatePost()
    healthBarSwap(true);
end

function onStepHit()
if isMiddlescroll then
if curStep == 1 then

end
if curStep == 64 then
doTweenAlpha('goofyallpha', 'blackBG', 0.2, 1, 'quadInOut')
setProperty('bg.alpha', 0.3)
end

if curStep == 128 then
doTweenColor('dad', 'dad', FFFFFF, 1, 'quadInOut')
end

if curStep == 192 then
setProperty('cameraSpeed', 1.2)
doTweenAlpha('goofyallpha', 'blackBG', 0, 1, 'quadInOut')
doTweenAlpha('goofyallpha2', 'bg', 1,0.5, 'quadInOut')
end

if curStep == 268 then
cameraSetTarget('dad')
setProperty('static.alpha', 1)

end
if curStep == 272 then
        setProperty('static.alpha', 0)


end

if curStep == 300 then
setProperty('static.alpha', 1)
end

if curStep == 304 then
setProperty('static.alpha', 0)
 setProperty('cameraSpeed', 0.5)
        noteTweenAlpha('OpponentAlpha0', 0, 0, 2, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 2, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 2, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 2, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0,2, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0,2, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 2, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,0, 2, 'quadInOut');
		
doTweenAlpha('goofyallpha', 'blackBG', 0.2, 0.001, 'quadInOut')
setProperty('bg.alpha', 0.3)		

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 0, 2, 'quadInOut');
        end
		
end
if curStep == 311 then
cameraSetTarget('boyfriend')
setProperty('blackNoisevignette.alpha', 1)
end
if curStep == 312 then
doTweenAlpha('blackBG', 'blackBG', 0.7, 1, 'quadInOut');
end
if curStep == 320 then

end
if curStep == 440 then
        noteTweenAlpha('PlayerAlpha4', 4, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7, 1, 1, 'quadInOut');

end

if curStep == 448 then
end

if curStep == 572 then
setProperty('blackNoisevignette.alpha', 0)
setProperty('static.alpha', 1)
        noteTweenAlpha('OpponentAlpha0', 0, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7, 0, 0.0001, 'quadInOut');
		 setProperty('cameraSpeed', 1.5)
end

if curStep == 576 then
NoteSwap(false);

setProperty('static.alpha', 0)
        noteTweenAlpha('OpponentAlpha0', 0, 0.5, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0.5, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0.5, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0.5, 0.0001, 'quadInOut');

        noteTweenAlpha('PlayerAlpha4', 4, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7, 1, 0.0001, 'quadInOut');

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 1, 0.001);
        end
setProperty('blackBG.alpha', 0)
setProperty('bg.alpha', 1)
setProperty('dad.x', 20)
setProperty('dad.y', 845)
setProperty('boyfriend.x', 850)
setProperty('boyfriend.y', 825)

function onUpdatePost()
    healthBarSwap(false);
end

end

if curStep == 800 then
setProperty('static.alpha', 1)
end

if curStep == 808 then
setProperty('static.alpha', 0)
end
if curStep == 812 then
setProperty('static.alpha', 1)
end
if curStep == 816 then
setProperty('static.alpha', 0)
setProperty('dad.x', 20)
setProperty('dad.y', 845)
end
if curStep == 824 then
cameraSetTarget('dad')
end
if curStep == 828 then
cameraSetTarget('boyfriend')
end
if curStep == 832 then
setProperty('whiteBG.alpha', 1)	
setProperty('boyfriend.color', 0x000000)
triggerEvent('Screen Shake','0.5, 0.01','0.01', '0.00')
end
if curStep == 864 then
setProperty('blackBG.alpha', 1)
setProperty('whiteBG.alpha', 0)
setProperty('bg.alpha', 0)
end
if curStep == 896 then
setProperty('blackBG.alpha', 0)
setProperty('static.alpha', 0.25)
   setProperty('paper.alpha', 1)
   setProperty('bg.alpha', 0)
    setProperty('boyfriend.x', 230)
    setProperty('boyfriend.y', 925)
    setProperty('dad.x', -520)
    setProperty('dad.y', 360)
    leftTreeCount = 0
    rightTreeCount = 0
    createLeftTree()
    createRightTree()
end

if curStep == 1152 then
doTweenAlpha('paper', 'paper', 0.7, 1, 'quadInOut');
doTweenAlpha('dad', 'dad', 0.7, 1, 'quadInOut')
end

if curStep == 1184 then
doTweenAlpha('vigne', 'blackNoisevignette', 0.5, 0.5, 'quadInOut');
doTweenAlpha('blackBG', 'blackBG', 0.6, 0.5, 'quadInOut');
doTweenAlpha('paper', 'paper', 0.5, 0.5, 'quadInOut');
doTweenAlpha('dad', 'dad', 0, 1, 'quadInOut')
end

if curStep == 1200 then
doTweenAlpha('paper', 'paper', 0, 1, 'quadInOut');
doTweenAlpha('vigne2', 'blackNoisevignette', 1, 0.5, 'quadInOut');
doTweenAlpha('blackBG2', 'blackBG', 0.7, 0.5, 'quadInOut');
end

if curStep == 1208 then
doTweenAlpha('blackBG2', 'blackBG', 1, 0.5, 'quadInOut');
end

if curStep == 1216 then
setProperty('blackBG.alpha', 1)
setProperty('blackNoisevignette.alpha', 0)

        noteTweenAlpha('OpponentAlpha0', 0, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,0, 1, 'quadInOut');
end

if curStep == 1217 then
        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 0, 1, 'quadInOut');
        end
end

if curStep == 1368 then
triggerEvent('Screen Shake','1, 0.01','0.01', '0.00')
end
if curStep == 1400 or curStep == 1404 or curStep == 1656 or curStep == 1660 or curStep == 1744 or curStep == 1748 then
triggerEvent('Screen Shake','0.5, 0.01','0.01', '0.00')
end

if curStep == 1344 then
function onUpdatePost()

setProperty('iconP1.flipX', true)
end


        noteTweenAlpha('PlayerAlpha4', 4, 1,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 1,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,1, 1, 'quadInOut');


doTweenAlpha('vigne', 'blackNoisevignette', 1, 0.5, 'quadInOut');

setProperty('boyfriend.color', 0x82526B)
setProperty('dad.alpha', 1)
setProperty('boyfriend.alpha', 1)

doTweenAlpha('blackBG2', 'blackBG', 0, 0.5, 'quadInOut');
setProperty('static.alpha', 0)
setProperty('bg.alpha', 0)
setProperty('bg2.alpha', 1)
setProperty('bg2-ground.alpha', 1)
doTweenY('groundBounce', 'bg2-ground', getProperty('bg2-ground.y') + 8, 0.3, 'sineInOut')
setProperty('dad.x', 1070)
setProperty('dad.y', 5000)
doTweenY('dad2', 'dad', 1105, 3, 'expoOut');

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 1, 1, 'quadInOut');
        end

stop();
end

if curStep == 1593 then
setProperty('static.alpha', 1)
doTweenAlpha('blackBG2', 'blackBG', 1, 1, 'quadInOut');
end
if curStep == 1600 then
triggerEvent('Screen Shake','0.5, 0.01','0.01', '0.00')
cancelTween('blackBG2')
setProperty('static.alpha', 0)
doTweenAlpha('blackBG3', 'blackBG', 0.4, 0.5, 'quadInOut');
end
if curStep == 1616 or curStep == 1680 then
doTweenAlpha('blackBG3', 'blackBG', 0, 0.5, 'quadInOut');
end
if curStep == 1624 or curStep == 1696 then
doTweenAlpha('blackBG4', 'blackBG', 0.4, 0.3, 'quadInOut');
end
if curStep == 1628 or curStep == 1706 then
doTweenAlpha('blackBG4', 'blackBG', 0.6, 0.3, 'quadInOut');
end
if curStep == 1632 or curStep == 1712 then
doTweenAlpha('blackBG4', 'blackBG', 0, 0.3, 'quadInOut');
end
if curStep == 1664 then
doTweenAlpha('blackBG3', 'blackBG', 0.4, 0.5, 'quadInOut');
end

if curStep == 1848 then
doTweenAlpha('blackBG2', 'blackBG', 1, 1, 'quadInOut');

        noteTweenAlpha('OpponentAlpha0', 0, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,0, 1, 'quadInOut');

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 0, 1, 'quadInOut');
        end
		

end

if curStep == 1920 then
setProperty('blackBG.alpha', 0)
end
if curStep == 2028 then
        noteTweenAlpha('OpponentAlpha0', 0, 0.6, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0.6, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0.6, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0.6, 1, 'quadInOut');
		
        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 1, 1, 'quadInOut');
        end		

end
if curStep == 2112 then
        noteTweenAlpha('PlayerAlpha4', 4, 1,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 1,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,1, 1, 'quadInOut');
end
if curStep == 2496 then
doTweenAlpha('blackBG3', 'blackBG', 1, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha0', 0, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,0, 1, 'quadInOut');	

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 0, 1, 'quadInOut');
        end
end

else

if curStep == 1 then

end
if curStep == 64 then
doTweenAlpha('goofyallpha', 'blackBG', 0.2, 1, 'quadInOut')
setProperty('bg.alpha', 0.3)
end

if curStep == 128 then
doTweenColor('dad', 'dad', FFFFFF, 1, 'quadInOut')
end

if curStep == 192 then
setProperty('cameraSpeed', 1.2)
doTweenAlpha('goofyallpha', 'blackBG', 0, 1, 'quadInOut')
doTweenAlpha('goofyallpha2', 'bg', 1,0.5, 'quadInOut')
end

if curStep == 268 then
cameraSetTarget('dad')
setProperty('static.alpha', 1)

end
if curStep == 272 then
        setProperty('static.alpha', 0)


end

if curStep == 300 then
setProperty('static.alpha', 1)
end

if curStep == 304 then
setProperty('static.alpha', 0)
 setProperty('cameraSpeed', 0.5)
        noteTweenAlpha('OpponentAlpha0', 0, 0, 2, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 2, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 2, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 2, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0,2, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0,2, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 2, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,0, 2, 'quadInOut');
		
doTweenAlpha('goofyallpha', 'blackBG', 0.2, 0.001, 'quadInOut')
setProperty('bg.alpha', 0.3)		

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 0, 2, 'quadInOut');
        end
		
end
if curStep == 311 then
cameraSetTarget('boyfriend')
setProperty('blackNoisevignette.alpha', 1)
end
if curStep == 312 then
doTweenAlpha('blackBG', 'blackBG', 0.7, 1, 'quadInOut');
end
if curStep == 320 then

end
if curStep == 440 then
        noteTweenAlpha('PlayerAlpha4', 4, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7, 1, 1, 'quadInOut');

end

if curStep == 448 then
end

if curStep == 572 then
setProperty('blackNoisevignette.alpha', 0)
setProperty('static.alpha', 1)
        noteTweenAlpha('OpponentAlpha0', 0, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7, 0, 0.0001, 'quadInOut');
		 setProperty('cameraSpeed', 1.5)
end

if curStep == 576 then
NoteSwap(false);

setProperty('static.alpha', 0)
        noteTweenAlpha('OpponentAlpha0', 0, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 1, 0.0001, 'quadInOut');

        noteTweenAlpha('PlayerAlpha4', 4, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 1, 0.0001, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7, 1, 0.0001, 'quadInOut');
		

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 1, 0.001);
        end
setProperty('blackBG.alpha', 0)
setProperty('bg.alpha', 1)
setProperty('dad.x', 20)
setProperty('dad.y', 845)
setProperty('boyfriend.x', 850)
setProperty('boyfriend.y', 825)

doTweenX('irfanin', 'signal', -2000, 0.85, 'expoOut')	


function onUpdatePost()
    healthBarSwap(false);
end

end
if curStep == 588 then
doTweenX('irfanout', 'signal', 6000, 0.85, 'expoIn')
end

if curStep == 800 then
setProperty('static.alpha', 1)
end

if curStep == 808 then
setProperty('static.alpha', 0)
end
if curStep == 812 then
setProperty('static.alpha', 1)
end
if curStep == 816 then
setProperty('static.alpha', 0)
setProperty('dad.x', 20)
setProperty('dad.y', 845)
end
if curStep == 824 then
cameraSetTarget('dad')
end
if curStep == 828 then
cameraSetTarget('boyfriend')
end
if curStep == 832 then
setProperty('whiteBG.alpha', 1)	
setProperty('boyfriend.color', 0x000000)
triggerEvent('Screen Shake','0.5, 0.01','0.01', '0.00')
end
if curStep == 864 then
setProperty('blackBG.alpha', 1)
setProperty('whiteBG.alpha', 0)
setProperty('bg.alpha', 0)
end
if curStep == 896 then
setProperty('blackBG.alpha', 0)
setProperty('static.alpha', 0.25)
   setProperty('paper.alpha', 1)
   setProperty('bg.alpha', 0)
    setProperty('boyfriend.x', 230)
    setProperty('boyfriend.y', 925)
    setProperty('dad.x', -520)
    setProperty('dad.y', 360)
    leftTreeCount = 0
    rightTreeCount = 0
    createLeftTree()
    createRightTree()
end

if curStep == 1152 then
doTweenAlpha('paper', 'paper', 0.7, 1, 'quadInOut');
doTweenAlpha('dad', 'dad', 0.7, 1, 'quadInOut')
end

if curStep == 1184 then
doTweenAlpha('vigne', 'blackNoisevignette', 0.5, 0.5, 'quadInOut');
doTweenAlpha('blackBG', 'blackBG', 0.6, 0.5, 'quadInOut');
doTweenAlpha('paper', 'paper', 0.5, 0.5, 'quadInOut');
doTweenAlpha('dad', 'dad', 0, 1, 'quadInOut')
end

if curStep == 1200 then
doTweenAlpha('paper', 'paper', 0, 1, 'quadInOut');
doTweenAlpha('vigne2', 'blackNoisevignette', 1, 0.5, 'quadInOut');
doTweenAlpha('blackBG2', 'blackBG', 0.7, 0.5, 'quadInOut');
end

if curStep == 1208 then
doTweenAlpha('blackBG2', 'blackBG', 1, 0.5, 'quadInOut');
end

if curStep == 1216 then
setProperty('blackBG.alpha', 1)
setProperty('blackNoisevignette.alpha', 0)

        noteTweenAlpha('OpponentAlpha0', 0, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,0, 1, 'quadInOut');
end

if curStep == 1217 then
        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 0, 1, 'quadInOut');
        end
end

if curStep == 1368 then
triggerEvent('Screen Shake','1, 0.01','0.01', '0.00')
end
if curStep == 1400 or curStep == 1404 or curStep == 1656 or curStep == 1660 or curStep == 1744 or curStep == 1748 then
triggerEvent('Screen Shake','0.5, 0.01','0.01', '0.00')
end

if curStep == 1344 then
function onUpdatePost()

setProperty('iconP1.flipX', true)
end


        noteTweenAlpha('PlayerAlpha4', 4, 1,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 1,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,1, 1, 'quadInOut');


doTweenAlpha('vigne', 'blackNoisevignette', 1, 0.5, 'quadInOut');

setProperty('boyfriend.color', 0x82526B)
setProperty('dad.alpha', 1)
setProperty('boyfriend.alpha', 1)

doTweenAlpha('blackBG2', 'blackBG', 0, 0.5, 'quadInOut');
setProperty('static.alpha', 0)
setProperty('bg.alpha', 0)
setProperty('bg2.alpha', 1)
setProperty('bg2-ground.alpha', 1)
doTweenY('groundBounce', 'bg2-ground', getProperty('bg2-ground.y') + 8, 0.3, 'sineInOut')
setProperty('dad.x', 1070)
setProperty('dad.y', 5000)
doTweenY('dad2', 'dad', 1105, 3, 'expoOut');

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 1, 1, 'quadInOut');
        end

stop();
end

if curStep == 1593 then
setProperty('static.alpha', 1)
doTweenAlpha('blackBG2', 'blackBG', 1, 1, 'quadInOut');
end
if curStep == 1600 then
triggerEvent('Screen Shake','0.5, 0.01','0.01', '0.00')
cancelTween('blackBG2')
setProperty('static.alpha', 0)
doTweenAlpha('blackBG3', 'blackBG', 0.4, 0.5, 'quadInOut');
end
if curStep == 1616 or curStep == 1680 then
doTweenAlpha('blackBG3', 'blackBG', 0, 0.5, 'quadInOut');
end
if curStep == 1624 or curStep == 1696 then
doTweenAlpha('blackBG4', 'blackBG', 0.4, 0.3, 'quadInOut');
end
if curStep == 1628 or curStep == 1706 then
doTweenAlpha('blackBG4', 'blackBG', 0.6, 0.3, 'quadInOut');
end
if curStep == 1632 or curStep == 1712 then
doTweenAlpha('blackBG4', 'blackBG', 0, 0.3, 'quadInOut');
end
if curStep == 1664 then
doTweenAlpha('blackBG3', 'blackBG', 0.4, 0.5, 'quadInOut');
end

if curStep == 1848 then
doTweenAlpha('blackBG2', 'blackBG', 1, 1, 'quadInOut');

        noteTweenAlpha('OpponentAlpha0', 0, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,0, 1, 'quadInOut');

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 0, 1, 'quadInOut');
        end
		

end

if curStep == 1920 then
setProperty('blackBG.alpha', 0)
end
if curStep == 2028 then
        noteTweenAlpha('OpponentAlpha0', 0, 0.6, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0.6, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0.6, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0.6, 1, 'quadInOut');
		
        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 1, 1, 'quadInOut');
        end		

end
if curStep == 2112 then
        noteTweenAlpha('PlayerAlpha4', 4, 1,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 1,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 1, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,1, 1, 'quadInOut');
end
if curStep == 2496 then
doTweenAlpha('blackBG3', 'blackBG', 1, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha0', 0, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha1', 1, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha2', 2, 0, 1, 'quadInOut');
        noteTweenAlpha('OpponentAlpha3', 3, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha4', 4, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha5', 5, 0,1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha6', 6, 0, 1, 'quadInOut');
        noteTweenAlpha('PlayerAlpha7', 7,0, 1, 'quadInOut');	

        for i = 1, #hudthing do
            doTweenAlpha('hudTween'..i, hudthing[i], 0, 1, 'quadInOut');
        end
end
end
end

function createLeftTree()
    leftTreeCount = leftTreeCount + 1
    local treeName = 'leftTree' .. leftTreeCount
    makeLuaSprite(treeName, 'stages/isolation/tree', -400, 800)
    setScrollFactor(treeName, 0.9, 0.9)
    scaleObject(treeName, 0.8, 0.8)
    setProperty(treeName .. '.alpha', 1)
    addLuaSprite(treeName, false)
    animateLeftTree(treeName)
end

function createRightTree()
    rightTreeCount = rightTreeCount + 1
    local treeName = 'rightTree' .. rightTreeCount
    makeLuaSprite(treeName, 'stages/isolation/tree', 1400, 800)
    setScrollFactor(treeName, 0.9, 0.9)
    scaleObject(treeName, 0.8, 0.8)
    setProperty(treeName .. '.alpha', 1)
    addLuaSprite(treeName, false)
    animateRightTree(treeName)
end

function animateLeftTree(treeName)
    local duration = 5.0
    doTweenX(treeName .. 'MoveX', treeName, 350, duration, 'linear')
    doTweenX(treeName .. 'ScaleX', treeName .. '.scale', 0.1, duration, 'linear')
    doTweenY(treeName .. 'ScaleY', treeName .. '.scale', 0.1, duration, 'linear')
    doTweenAlpha(treeName .. 'Fade', treeName, 0, duration, 'linear')
    local spawnDelay = duration * 0.4
    runTimer('spawnNextLeftTree', spawnDelay)
end

function animateRightTree(treeName)
    local duration = 5.0
    doTweenX(treeName .. 'MoveX', treeName, 350, duration, 'linear')
    doTweenX(treeName .. 'ScaleX', treeName .. '.scale', 0.1, duration, 'linear')
    doTweenY(treeName .. 'ScaleY', treeName .. '.scale', 0.1, duration, 'linear')
    doTweenAlpha(treeName .. 'Fade', treeName, 0, duration, 'linear')
    local spawnDelay = duration * 0.4
    runTimer('spawnNextRightTree', spawnDelay)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'spawnNextLeftTree' then
        createLeftTree()
    elseif tag == 'spawnNextRightTree' then
        createRightTree()
    elseif string.find(tag, 'cleanup') then
        local treeName = string.gsub(tag, 'cleanup', '')
        removeLuaSprite(treeName, true)
    end
end

function onTweenCompleted(tag)
    if string.find(tag, 'MoveX') then
        local treeName = string.gsub(tag, 'MoveX', '')
        runTimer('cleanup' .. treeName, 0.5)
    elseif tag == 'groundBounce' then
        doTweenY('groundBounceBack', 'bg2-ground', getProperty('bg2-ground.y') - 8, 0.3, 'sineInOut')
    elseif tag == 'groundBounceBack' then
        doTweenY('groundBounce', 'bg2-ground', getProperty('bg2-ground.y') + 8, 0.3, 'sineInOut')
    end
end

function stop()
    cancelTimer('spawnNextLeftTree')
    cancelTimer('spawnNextRightTree')
    for i = 1, leftTreeCount do
        local treeName = 'leftTree' .. i
        cancelTween(treeName .. 'MoveX')
        cancelTween(treeName .. 'ScaleX')
        cancelTween(treeName .. 'ScaleY')
        cancelTween(treeName .. 'Fade')
        removeLuaSprite(treeName, true)
    end
    for i = 1, rightTreeCount do
        local treeName = 'rightTree' .. i
        cancelTween(treeName .. 'MoveX')
        cancelTween(treeName .. 'ScaleX')
        cancelTween(treeName .. 'ScaleY')
        cancelTween(treeName .. 'Fade')
        removeLuaSprite(treeName, true)
    end
    leftTreeCount = 0
    rightTreeCount = 0
end
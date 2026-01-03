function onCreate()
	-- background
	
	makeLuaSprite('bg', 'stages/isolation/stripe', -400, 300);
	setScrollFactor('bg', 0.9, 0.9);
	scaleObject('bg', 1.2, 1.2);
	
	setProperty('bg.alpha', 0)
	
	addLuaSprite('bg', false);
	
	
	makeLuaSprite('bg2', 'stages/isolation/shadowBG', -500, -300);
	setScrollFactor('bg2', 0.9, 0.9);
	scaleObject('bg2', 5, 5);
	setProperty('bg2.alpha', 0)
	addLuaSprite('bg2', false);	
	
	makeLuaSprite('bg2-ground', 'stages/isolation/shadowGROUND', 0, 260);
	setScrollFactor('bg2-ground', 0.9, 0.9);
--	screenCenter('bg2-ground', 'xy');
	scaleObject('bg2-ground', 2, 2);
	setProperty('bg2-ground.alpha', 0)
	addLuaSprite('bg2-ground', false);		
	
	
	makeLuaSprite('whiteBG', 'empty', -500,-1000)
	makeGraphic('whiteBG', 2560, 1440, 'FFFFFF')
	addLuaSprite('whiteBG', true)
	setLuaSpriteScrollFactor('whiteBG', 0, 0);
	scaleLuaSprite('whiteBG', 10, 10)	
	setObjectCamera('whiteBG', 'camGame')
	setObjectOrder('whiteBG', 1);
	setProperty('whiteBG.alpha', 0)	
	
	
	
makeAnimatedLuaSprite('paper', 'stages/isolation/paperbackground', -160, -90);
setScrollFactor('paper', 0,0)
addAnimationByPrefix('paper','idle','idle',6,true);

scaleObject('paper', 2.5, 2.5)
addLuaSprite('paper', false)
	
	setProperty('paper.alpha', 0)
	
	





	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anyMuu bgre after loading the stage
end
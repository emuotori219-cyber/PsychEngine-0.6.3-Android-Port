dofile("mods/custom_scripts/functions.lua")

function onStepHit()
if curStep == 448 then
toggleAltAnims('bf', true)
end
if curStep == 701 then
toggleAltAnims('bf', false)
end
if curStep ==  576 then
toggleAltAnims('dad', true)
toggleAltAnims('bf', true)
end
if curStep == 884 then
toggleAltAnims('dad', false)
end
if curStep == 1151 then
toggleAltAnims('bf', true)
end
end

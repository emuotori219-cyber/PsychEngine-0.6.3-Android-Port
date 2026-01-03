dofile("mods/custom_scripts/functions.lua")

function onUpdate()

if keyboardJustPressed('P') then

getPlayerXY()

elseif keyboardJustPressed('O') then

getOpponentXY()

end
end


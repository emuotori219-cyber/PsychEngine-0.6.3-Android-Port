function onEvent(name, value1, value2)
if name == 'PlayVideo' then 
makeVideoSprite('videoStart', value1, 0, 0, 'camHUD', false) 
setObjectOrder('videoStart_video', 1) 
setProperty('videoStart_video.alpha', 1) 
end
end
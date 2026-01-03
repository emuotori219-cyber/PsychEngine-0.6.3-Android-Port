function onCreatePost()

    makeLuaText("dialogue", "", 1200, 55, 650)
    addLuaText("dialogue", true)
    setTextSize("dialogue", 60)
    setTextBorder("dialogue", 2, "000000")
    setTextColor("dialogue", "FFFFFF")
    setTextFont("dialogue", "Dracutaz.otf")
    setTextAlignment("dialogue", "center")
	screenCenter('dialogue', 'xy')
	
	--setTextString("dialogue", "hi random person looking into the files!!")
	
end


function onStepHit()
if curStep == 1217 then -- ALL
setTextString("dialogue", "All")

end
if curStep == 1220 then -- THE
setTextString("dialogue", "All The")

end

if curStep == 1222 then -- TIME
setTextString("dialogue", "All The Time")

end

if curStep == 1224 then -- THAT
setTextString("dialogue", "All The Time That")

end

if curStep == 1226 then -- WE
setTextString("dialogue", "All The Time That We")

end

if curStep == 1227 then -- HAD
setTextString("dialogue", "All The Time That We Had")

end


if curStep == 1230 then -- AND
setTextString("dialogue", "And")
end

if curStep == 1231 then -- we
setTextString("dialogue", "And we")
end

if curStep == 1232 then -- cared
setTextString("dialogue", "And we cared.")
end

if curStep == 1236 then -- no text
setTextString("dialogue", " ")
end

if curStep == 1238 then -- ALL
setTextString("dialogue", "All")
end

if curStep == 1240 then -- that
setTextString("dialogue", "All That")
end

if curStep == 1242 then -- love
setTextString("dialogue", "All That LOVE")
end

if curStep == 1244 then -- that
setTextString("dialogue", "All that LOVE that")
end

if curStep == 1245 then -- we
setTextString("dialogue", "All that LOVE that we")
end

if curStep == 1246 then -- felt
setTextString("dialogue", "Felt,")
end

if curStep == 1248 then -- and
setTextString("dialogue", "Felt, And")
end

if curStep == 1249 then -- we
setTextString("dialogue", "Felt, And we")
end

if curStep == 1250 then -- shared
setTextString("dialogue", "Felt, And we shared.")
end

if curStep == 1253 then -- no text
setTextString("dialogue", " ")
end

if curStep == 1255 then -- in
setTextString("dialogue", "In")
end

if curStep == 1257 then -- the
setTextString("dialogue", "In the")
end

if curStep == 1258 then -- end
setTextString("dialogue", "In the end...")
end

if curStep == 1262 then -- no text
setTextString("dialogue", " ")
end

if curStep == 1264 then -- I
setTextString("dialogue", "I")
end

if curStep == 1266 then -- WAS
setTextString("dialogue", "I WAS")
end

if curStep == 1272 then -- ALWAYS.
setTextString("dialogue", "I WAS, ALWAYS.")
end

if curStep == 1280 then -- BETRAYED.
setTextString("dialogue", "BETRAYED.")
    setTextColor("dialogue", "FF0000")
    setTextFont("dialogue", "HelpMe.ttf")
 setTextSize("dialogue", 100)	
 

end


if curStep == 1312 then -- end of text
setTextString("dialogue", " ")
end
end
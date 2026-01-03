function onCreatePost()
    makeLuaText("lryi", " ", 1130, 55, 100)
    addLuaText("lryi", true)
    setTextSize("lryi", 60)
    setTextBorder("lryi", 2, "000000")
    setTextColor("lryi", "FFFFFF")
    setTextFont("lryi", "Dracutaz.otf")
    setTextAlignment("lryi", "center")
	
	--setTextString("dialogue", "yummmmmmmy")

if downscroll then
    makeLuaText("lryi2", " ", 1200, 55, 550)
    addLuaText("lryi2", true)
    setTextSize("lryi2", 45)
    setTextBorder("lryi2", 2, "000000")
    setTextColor("lryi2", "FFFFFF")
    setTextFont("lryi2", "Dracutaz.otf")
    setTextAlignment("lryi2", "center")

else

    makeLuaText("lryi2", " ", 1200, 55, 150)
    addLuaText("lryi2", true)
    setTextSize("lryi2", 45)
    setTextBorder("lryi2", 2, "000000")
    setTextColor("lryi2", "FFFFFF")
    setTextFont("lryi2", "Dracutaz.otf")
    setTextAlignment("lryi2", "center")

end

if middlescroll then
    makeLuaText("lryi2", " ", 1200, 55, 300)
    addLuaText("lryi2", true)
    setTextSize("lryi2", 45)
    setTextBorder("lryi2", 2, "000000")
    setTextColor("lryi2", "FFFFFF")
    setTextFont("lryi2", "Dracutaz.otf")
    setTextAlignment("lryi2", "center")

end


	
	--setTextString("dialogue", "yummmmmmmy")


end


function onStepHit()

if curStep == 1920 then
setTextString("lryi", "There's")
end
if curStep == 1928 then
setTextString("lryi", "There's no")
end
if curStep == 1936 then
setTextString("lryi", "There's no go")
end
if curStep == 1939 then
setTextString("lryi", "There's no going")
end
if curStep == 1944 then
setTextString("lryi", "There's no going back.")
end
if curStep == 1952 then
setTextString("lryi", "Fear")
end
if curStep == 1959 then
setTextString("lryi", "Fear my")
end
if curStep == 1968 then
setTextString("lryi", "Fear my wrath.")
end
if curStep == 1975 then
setTextString("lryi", "As")
end
if curStep == 1979 then
setTextString("lryi", "As you")
end
if curStep == 1984 then
setTextString("lryi", "As you run,")
end
if curStep == 2000  then
setTextString("lryi", "Through")
end
if curStep == 2007 then
setTextString("lryi", "Through your")
end
if curStep == 2016 then
setTextString("lryi", "Through your end.")
end
if curStep == 2028 then
setTextString("lryi", " ")
setTextString("lryi2", "Come")
end
if curStep == 2032 then
setTextString("lryi2", "Come let's")
end
if curStep == 2036 then
setTextString("lryi2", "Come let's curve")
end
if curStep == 2037 then
setTextString("lryi2", "Come let's curve our")
end
if curStep == 2040 then
setTextString("lryi2", "Way")
end
if curStep == 2043 then
setTextString("lryi2", "Way to")
end
if curStep == 2046 then
setTextString("lryi2", "Way to your")
end
if curStep == 2048 then
setTextString("lryi2", "Way to your fate.")
end
if curStep == 2069 then
setTextString("lryi2", " ")
end
if curStep == 2072 then
setTextString("lryi2", "OOoohh~ ")
end
if curStep == 2080 then
setTextString("lryi2", "OOoohh~  OOh.")
end
if curStep == 2091 then
setTextString("lryi2", "I'll")
end
if curStep == 2096 then
setTextString("lryi2", "I'll make")
end
if curStep == 2100 then
setTextString("lryi2", "I'll make sure")
end
if curStep == 2103 then
setTextString("lryi2", "I'll make sure you")
end
if curStep == 2105 then
setTextString("lryi2", "Pay")
end
if curStep == 2108 then
setTextString("lryi2", "Pay the")
end
if curStep == 2112 then
setTextString("lryi2", "Pay the price.")
end
if curStep == 2124 then
setTextString("lryi2", "This")
end
if curStep == 2128 then
setTextString("lryi2", "This won't")
end
if curStep == 2132 then
setTextString("lryi2", "This won't be")
end
if curStep == 2136 then
setTextString("lryi2", "This won't be nice,")
end
if curStep == 2140 then
setTextString("lryi2", "Cause")
end
if curStep == 2141 then
setTextString("lryi2", "Cause i'll")
end
if curStep == 2144 then
setTextString("lryi2", "Cause i'll kill")
end
if curStep == 2148 then
setTextString("lryi2", "Cause i'll kill you")
end
if curStep == 2152 then
setTextString("lryi2", "Twice!")
end
if curStep == 2176 then
setTextString("lryi2", "You're")
end
if curStep == 2179 then
setTextString("lryi2", "You're not")
end
if curStep == 2183 then
setTextString("lryi2", "You're not special,")
end
if curStep == 2190 then
setTextString("lryi2", "You're")
end
if curStep == 2195 then
setTextString("lryi2", "You're not")
end
if curStep == 2199 then
setTextString("lryi2", "You're not gift")
end
if curStep == 2203 then
setTextString("lryi2", "You're not gifted,")
end
if curStep == 2208 then
setTextString("lryi2", "Un")
end
if curStep == 2211 then
setTextString("lryi2", "Under")
end
if curStep == 2214 then
setTextString("lryi2", "Understand?")
end
if curStep == 2232 then
setTextString("lryi2", " ")
end
if curStep == 2240 then
setTextString("lryi2", "In")
end
if curStep == 2244 then
setTextString("lryi2", "In this")
end
if curStep == 2247 then
setTextString("lryi2", "In this litt")
end
if curStep == 2252 then
setTextString("lryi2", "In this little")
end
if curStep == 2256 then
setTextString("lryi2", "Hell")
end
if curStep == 2263 then
setTextString("lryi2", "Hellscape!")
end
if curStep == 2272 then
setTextString("lryi2", " ")
end
if curStep == 2277 then
setTextString("lryi2", "I'll")
end
if curStep == 2280 then
setTextString("lryi2", "I'll make")
end
if curStep == 2283 then
setTextString("lryi2", "I'll make the")
end
if curStep == 2287 then
setTextString("lryi2", "I'll make the pain")
end
if curStep == 2291 then
setTextString("lryi2", "Mat")
end
if curStep == 2295 then
setTextString("lryi2", "Mater")
end
if curStep == 2299 then
setTextString("lryi2", "Material")
end
if curStep == 2302 then
setTextString("lryi2", "Materialized!")
end
if curStep == 2335 then
setTextString("lryi2", "You")
end
if curStep == 2340 then
setTextString("lryi2", "You will")
end
if curStep == 2345 then
setTextString("lryi2", "You will see")
end
if curStep == 2349 then
setTextString("lryi2", "You will see it,")
end
if curStep == 2352 then
setTextString("lryi2", "From")
end
if curStep == 2355 then
setTextString("lryi2", "From your")
end
if curStep == 2360 then
setTextString("lryi2", "From your ver")
end
if curStep == 2363 then
setTextString("lryi2", "From your very")
end
if curStep == 2376 then
setTextString("lryi2", "From your very eyes!")
end
if curStep == 2392 then
setTextString("lryi2", "And")
end
if curStep == 2396 then
setTextString("lryi2", "And then")
end
if curStep == 2400 then
setTextString("lryi2", "And then you'll")
end
if curStep == 2404 then
setTextString("lryi2", "And then you'll know,")
end
if curStep == 2416 then
setTextString("lryi2", "This")
end
if curStep == 2418 then
setTextString("lryi2", "This is")
end
if curStep == 2420 then
setTextString("lryi2", "This is your")
end
if curStep == 2432 then
setTextString("lryi2", "De")
end
if curStep == 2436 then
setTextString("lryi2", "Demise!")
end
if curStep == 2493 then
setTextString("lryi2", " ")
end
end
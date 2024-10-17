tween1 = false
tween2 = false
tween3 = false
removed = false
function onEvent(n, v1, v2)
if n == 'credits' then
    if v1 == '' then
        v1 = songName
    end
    if v2 == '' then
        v2 = 'NULL - NoCompositorName'
        debugPrint('please, insert the compositor name') -- delete this if you want
        debugPrint('please, insert the compositor name')
        debugPrint('please, insert the compositor name')
    end
text_to_write = "Now playing: "..v1.." - "..v2 --text to write in the event
makeLuaText('songStartTextS', '', 1280, 0, 0)
setTextFont('songStartTextS', 'Minecraftia.ttf')
setTextBorder('songStartTextS', 0, '000000')
addLuaText('songStartTextS')
setObjectCamera('songStartTextS', 'other')
setTextSize('songStartTextS', 30)
setTextAlignment('songStartTextS', 'center')
updateHitbox('songStartTextS')
setProperty('songStartTextS.alpha',0)
setTextString('songStartTextS', text_to_write)
screenCenter('songStartTextS')
setProperty('songStartTextS.y', getProperty('songStartTextS.y')+193)
setProperty('songStartTextS.x', getProperty('songStartTextS.x')+3)
setTextColor('songStartTextS', '6F6F00')
setProperty('songStartTextS.visible', false)

makeLuaText('songStartText', '', 1280, 0, 0)
setTextFont('songStartText', 'Minecraftia.ttf')
setTextBorder('songStartText', 0, '000000')
addLuaText('songStartText')
setObjectCamera('songStartText', 'other')
setTextSize('songStartText', 30)
setTextAlignment('songStartText', 'center')
updateHitbox('songStartText')
setProperty('songStartText.alpha',0)
setTextString('songStartText', text_to_write)
screenCenter('songStartText')
setProperty('songStartText.y', getProperty('songStartTextS.y')-3)
setProperty('songStartText.x', getProperty('songStartTextS.x')-3)
setTextColor('songStartText', 'FFFF00')
setProperty('songStartText.visible', false)
runTimer('visibleText', 0.01)

start()
end
end
color = {
'0000FF',
'FF0000',
'00FF00'
}
colorS = {
'000066',
'660000',
'006600'
}
function start()
tween1 = true
doTweenColor('songStartTextColor', 'songStartText', 'FFFF00', 0.5, 'quadOut')
doTweenColor('songStartTextColorS', 'songStartTextS', '6F6F00', 0.5, 'quadOut')
doTweenAlpha('songStartText', 'songStartText', 1, 0.5, 'cubeInOut')
doTweenAlpha('songStartTextS', 'songStartTextS', 1, 0.5, 'cubeInOut')
runTimer('byeText', 2.5)
end
function onTimerCompleted(tag, loops)
if tag == 'byeText' then
    doTweenAlpha('songStartTextBye', 'songStartText', 0, 2, 'cubeInOut')
    doTweenAlpha('songStartTextByeS', 'songStartTextS', 0, 2, 'cubeInOut')
end
if tag == 'visibleText' then
    setProperty('songStartText.visible', true)
    setProperty('songStartTextS.visible', true)
end
end
function onTweenCompleted(tag)
if tag == 'songStartTextByeS' then
setProperty('songStartText.visible', false)
setProperty('songStartTextS.visible', false)
removed = true
end
if tag == 'songStartTextColor' and tween1 == true and removed == false then
doTweenColor('songStartTextColor1S', 'songStartTextS', colorS[2], 0.7, 'sineInOut')
doTweenColor('songStartTextColor1', 'songStartText', color[2], 0.7, 'sineInOut')
tween1 = false
tween2 = true
end
if tag == 'songStartTextColor1' and tween2 == true and removed == false then
doTweenColor('songStartTextColor2S', 'songStartTextS', colorS[3], 0.7, 'sineInOut')
doTweenColor('songStartTextColor2', 'songStartText', color[3], 0.7, 'sineInOut')
tween2 = false
tween3 = true
end
if tag == 'songStartTextColor2' and tween3 == true and removed == false then
doTweenColor('songStartTextColor3S', 'songStartTextS', colorS[1], 0.7, 'sineInOut')
doTweenColor('songStartTextColor3', 'songStartText', color[1], 0.7, 'sineInOut')
tween3 = false
tween1 = true
end
if tag == 'songStartTextColor3' and tween1 == true and removed == false then
doTweenColor('songStartTextColor1S', 'songStartTextS', colorS[2], 0.7, 'sineInOut')
doTweenColor('songStartTextColor1', 'songStartText', color[2], 0.7, 'sineInOut')
tween1 = false
tween2 = true
end
end
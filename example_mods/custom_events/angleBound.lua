local angleBound = false
function onEvent(n, v1, v2)
if n == 'angleBound' then
angleBound = not angleBound
if not angleBound then
local smallCrochet = crochet / 1000 / getProperty('playbackRate')
doTweenAngle('turn', 'camHUD', 0, smallCrochet*0.8, 'circOut')
doTweenX('tuin', 'camHUD', 0, smallCrochet*0.6)
doTweenAngle('turns', 'camGame', 0, smallCrochet*0.7)
end
end
end
local angleshit = 1
function onBeatHit()
if angleBound then
local smallCrochet = crochet / 1000 / getProperty('playbackRate')
setProperty('camHUD.zoom', getProperty('camHUD.zoom')+0.03)
setProperty('camGame.zoom', getProperty('camGame.zoom')+0.015)
--set('camHUD.x',angleshit*24)
angleshit = -angleshit

setProperty('camHUD.angle',angleshit*4)
doTweenAngle('turn', 'camHUD', angleshit, smallCrochet*0.8, 'circOut')
doTweenX('tuin', 'camHUD', -angleshit*6, smallCrochet*0.6)
doTweenAngle('turns', 'camGame', -angleshit, smallCrochet*0.7)
end
end
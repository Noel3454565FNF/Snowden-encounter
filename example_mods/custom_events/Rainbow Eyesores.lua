function onCreate()
    precacheImage('rainbowEyesoresRes/raw/assets')
end

function onEvent(s,moment,speed)
    if s == 'Rainbow Eyesores' then
    if flashingLights then

        makeAnimatedLuaSprite('core', 'rainbowEyesoresRes/raw/assets', defaultGirlfriendX,  defaultGirlfriendY, "sparrow")
        addAnimationByPrefix('core', 'loop', 'idle', speed * 60, true) --match the fucking 60fps :(
        scaleObject('core', 18, 18, true)
        addLuaSprite('core', true)

        screenCenter('core', 'xy')
        setScrollFactor('core', 0, 0)
        setObjectCamera('core', 'camGame')
        setBlendMode('core', 'multiply')
        playAnim('core', 'loop', 'false', false, 0)
        doTweenAlpha('intro', 'core', 100, 0.001, 'linear') --Eyesore overlay appears

        runTimer('wait', moment, 1)

        end
    elseif not flashingLights then
        debugPrint('Rainbow Eyesore was disabled here in order to prevent health issues!')
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'wait' then
        doTweenAlpha('outro', 'core', 0, 2 / curBpm * 50, 'linear')
        --debugPrint(2 / curBpm * 100)
    end
end

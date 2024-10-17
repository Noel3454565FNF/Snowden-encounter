function onEvent(n,v1,v2)
	v1 = v1/240
	if v2 == '' then
		v2 = 'ffffff'
	end
	if n == 'Build Up' and flashingLights then

	      makeLuaSprite('flash', '', 0, 0);
        	      makeGraphic('flash',1280,720,v2)
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',1)
		setObjectCamera('flash', 'camHUD')
		setProperty('flash.alpha',0)
		doTweenAlpha('flTw','flash',1,v1,'linear')
	end



end
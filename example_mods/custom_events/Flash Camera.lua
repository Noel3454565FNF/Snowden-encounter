function onEvent(n,v1,v2)
	if n == 'Flash Camera' then
		makeLuaSprite('flash', '', 0, 0)
		setScrollFactor('flash', 0, 0)
		makeGraphic('flash', 3840, 2160, 'FFFFFF')
		addLuaSprite('flash', false)
		screenCenter('flash', 'xy')
		setProperty('flash.alpha',v1)
		doTweenAlpha('flTw','flash',0,0.5,'linear')
		setObjectCamera('flash', 'other')
		setBlendMode('flash','add')
	end
end
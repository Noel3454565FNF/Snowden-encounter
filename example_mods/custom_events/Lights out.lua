function onEvent(name)
    if name == 'Lights out' then
        makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,0.5,'linear')
		setObjectCamera('flash', 'other')

				makeLuaSprite('whitebg', '', 0, 0)
				setScrollFactor('whitebg', 0, 0)
				makeGraphic('whitebg', 3840, 2160, '000000')
				addLuaSprite('whitebg', false)
				setProperty('whitebg.alpha', 1)
				screenCenter('whitebg', 'xy')

        setSpriteShader('iconP1', 'BWShader');
        setShaderFloat('iconP1', 'lowerBound', 0.01);
        setShaderFloat('iconP1', 'upperBound', 0.12);
        setShaderBool('iconP1', 'invert', true);

        setSpriteShader('iconP2', 'BWShader');
        setShaderFloat('iconP2', 'lowerBound', 0.01);
        setShaderFloat('iconP2', 'upperBound', 0.12);
        setShaderBool('iconP2', 'invert', true);
            setSpriteShader('dad', 'BWShader');
            setShaderFloat('dad', 'lowerBound', 0.01);
            setShaderFloat('dad', 'upperBound', 0.12);
            setShaderBool('dad', 'invert', true);
            setSpriteShader('boyfriend', 'BWShader');
            setShaderFloat('boyfriend', 'lowerBound', 0.01);
            setShaderFloat('boyfriend', 'upperBound', 0.12);
            setShaderBool('boyfriend', 'invert', true);
        setProperty('loBlack.alpha', 1);
        setProperty('gf.visible', false);
    end
end
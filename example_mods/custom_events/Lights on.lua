function onEvent(name)
    if name == 'Lights on' then
        cameraFlash('camGame', '000000', 0.35);
        doTweenAlpha('flTw','whitebg',0,0.1,'linear')

        removeSpriteShader('iconP2');
        removeSpriteShader('iconP1');

        if dadName == 'whitegreen' then
            triggerEvent('Change Character', 'dad', 'impostor3');
        else
            removeSpriteShader('dad');
        end
        if boyfriendName == 'whitebf' then
            triggerEvent('Change Character', 'bf', 'bf');
        else
            removeSpriteShader('boyfriend');
        end
        setProperty('loBlack.alpha', 0);
        setProperty('gf.visible', true);
    end
end
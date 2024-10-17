function onCreatePost()
    makeLuaSprite('barTop', 'blackTop', -2400, -50)
	makeLuaSprite('barBottom', 'blackLow', getPropertyFromClass('flixel.FlxG', 'width') + 2400, getPropertyFromClass('flixel.FlxG', 'height') - 1030)
	addLuaSprite('barTop')
	addLuaSprite('barBottom')
	setObjectCamera('barTop', 'hud')
	setObjectCamera('barBottom', 'hud')
end

function onEvent(name, value1, value2)
	if name == 'Cinema mode' then
		if value1 == 'on' then
            doTweenX('bartween1', 'barTop', 0, 1.3, 'quintOut')
			doTweenX('bartween2', 'barBottom', -530, 1.3, 'quintOut')
		else
			doTweenX('bartween1', 'barTop', -2400, 1.3, 'quintOut')
			doTweenX('bartween2', 'barBottom', getPropertyFromClass('flixel.FlxG', 'width') + 2400, 1.3, 'quintOut')
		end
	end
end
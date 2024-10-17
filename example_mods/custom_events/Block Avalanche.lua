blockNumber = 0
blockReset = 0

function onEvent(n,v1,v2)
	--todo: remove block sprites after they fall
	if v1 == '' then --number of blocks
		v1 = 5
	end
	
	if v2 == '' then
		v2 = 0.5
	end
	
	if n == 'Block Avalanche' then
		for i = 0,v1-1 do
			if getRandomInt(0, 200) == 1 then
				blockedUp = 7
			else
				blockedUp = getRandomInt(0, 6)
			end
			makeLuaSprite('blockAvalanche'..blockNumber, 'block'..blockedUp, getRandomInt(-1, 1000), -500);
			setObjectCamera('blockAvalanche'..blockNumber, 'camHUD')
			setObjectOrder('blockAvalanche'..blockNumber, 0)
			doTweenY('blockTw'..blockNumber,'blockAvalanche'..blockNumber,1000,getRandomInt(-1, 50)/100+v2,'sineIn')
			doTweenAngle('blockAng'..blockNumber,'blockAvalanche'..blockNumber,getRandomInt(-721, 720),2,'sineOut')
			
			addLuaSprite('blockAvalanche'..blockNumber, true);
			
			blockNumber = blockNumber + 1
		end
	end

end
function onTweenComplete(t)
	if t == 'blockAvalanche'..blockReset then
		removeLuaSprite('blockAvalanche'..blockReset)
		blockReset = blockReset + 1
	end
end
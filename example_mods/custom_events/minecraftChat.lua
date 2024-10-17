--Event By Cappes--
--https://gamebanana.com/members/2943717--
--https://www.youtube.com/channel/UCw3_9Y6Yc-K4lhlARuqe5kQ-- --its inactive lol--

local defaultCharacter = ''
local defaultText = 'Problems0 Morreu De Queda Tentando Do Fugir De Kadukos'

local ID = 1
local textToWrite = 'hello world!'
local textCoordX = 0
local textCoordY = 600
local newY = 1

function estimateTextWidth(text, averageLetterWidth)
    local width = string.len(text) * averageLetterWidth
    return width
end


function onEvent(name, value1, value2)
    if name == 'minecraftChat' then
        -- do the text formatting
            if value1 == '' then
                value1 = defaultCharacter
            end
            if value2 == '' then
                value2 = defaultText
            end
        textToWrite = tostring(''..value1..' '..value2)
        ID = ID + 1

        local boxWidth = estimateTextWidth(textToWrite, 17)

        -- black box
        makeLuaSprite('chatBox' .. ID, 'empty', textCoordX, textCoordY + 3)
        makeGraphic('chatBox' .. ID, boxWidth, 36, '000000')
        setObjectCamera('chatBox' .. ID, 'other')
        setProperty('chatBox'..ID..'.alpha', 0.4)  -- Fix the quotes here
        addLuaSprite('chatBox' .. ID, true)

        -- Text Shadow
        makeLuaText('mcTextS' .. ID, '', boxWidth, textCoordX + 3, textCoordY + 3)
        setObjectCamera('mcTextS' .. ID, 'other')
        setTextFont('mcTextS' .. ID, 'Minecraftia.otf')
        setTextAlignment('mcTextS' .. ID, 'Left')
        addLuaText('mcTextS' .. ID)
        setTextColor('mcTextS' .. ID, '3C3D38')
        setTextBorder('mcTextS' .. ID, 0)
        setTextSize('mcTextS' .. ID, 23)

        -- Text (Normal)
        makeLuaText('mcText' .. ID, '', boxWidth, textCoordX, textCoordY)
        setObjectCamera('mcText' .. ID, 'other')
        setTextFont('mcText' .. ID, 'Minecraftia.otf')
        setTextAlignment('mcText' .. ID, 'Left')
        addLuaText('mcText' .. ID)
        setTextSize('mcText' .. ID, 23)
        setTextBorder('mcText' .. ID, 0)

        -- set all the shit
        setTextString('mcText' .. ID, textToWrite)
        setTextString('mcTextS' .. ID, textToWrite)
        runTimer('mcTextTimer', 2, 0)  -- Fix the timer argument

        for i = 1, tonumber(ID - 1) do
            -- Calculate the new Y position based on the iteration
            newY = textCoordY - ((36 * (ID - i)) - 3)
            -- Use doTweenY to animate the Y position
            doTweenY('mcTextS' .. i, 'mcTextS' .. i, newY, 0.001, 'linear')
            doTweenY('mcText' .. i, 'mcText' .. i, newY, 0.001, 'linear')
            doTweenY('chatBox' .. i, 'chatBox' .. i, newY, 0.001, 'linear')

        end
    elseif name == 'clearChat' then
        for i = 0, ID do  -- Fix the loop range
            cancelTimer('mcTextTimer')
            if value1 == '' then 
                value1 = 0.5
            end
            doTweenAlpha('mcText' .. i, 'mcText' .. i, 0, value1, 'sineIn')
            doTweenAlpha('mcTextS' .. i, 'mcTextS' .. i, 0, value1, 'sineIn')
            doTweenAlpha('chatBox' .. i, 'chatBox' .. i, 0, value1, 'sineIn')
        end
    end
end

function onTimerCompleted(timername)
    if timername == 'mcTextTimer' then
        for i = 0, ID do  -- Fix the loop range
            doTweenAlpha('mcText' .. i, 'mcText' .. i, 0, 1.5, 'sineIn')
            doTweenAlpha('mcTextS' .. i, 'mcTextS' .. i, 0, 1.5, 'sineIn')
            doTweenAlpha('chatBox' .. i, 'chatBox' .. i, 0, 1.5, 'sineIn')
            runTimer('mcDeleteTimer')
        end
    elseif timername == 'mcDeleteTimer' then
        for i = 0, ID do
            removeLuaSprite('mcText' .. i, true)
            removeLuaSprite('mcTextS' .. i, true)
            removeLuaSprite('chatBox' .. i, true)
            -- for optimization purposes
        end
    end
end

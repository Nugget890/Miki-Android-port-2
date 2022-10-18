local DadX = 0
local DadY = 0

local BfX = 0
local BfY = 0

local GfX = 0
local GfY = 0

local BfOfs = 60
local GfOfs = 50
local DadOfs = 60

local curCameraState = nil
local cameraMoving = nil

local enableSystem = true

function onEvent(name,value1,value2)
	if name == 'Movimiento De Camara XD' then
		if (value1 == 'on') then
            followchars = true;
        elseif (value1 == 'off') then
            followchars = false;
        end
	end
end

function onUpdate()
    if enableSystem == true then
        if mustHitSection == false then
                if gfSection == false or gfSection == nil then
                    DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
                    DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
setProperty('defaultCamZoom',0.8)
                    if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                        triggerEvent('Camera Follow Pos',DadX-DadOfs,DadY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                        triggerEvent('Camera Follow Pos',DadX+(DadOfs/2),DadY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY-DadOfs)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY+DadOfs)
                        cameraMoving = true
                    else
                        if cameraMoving == true then
                            triggerEvent('Camera Follow Pos',DadX,DadY)
                            cameraMoving = false
                        end
                    end
                else
                    -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                    GfX = getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]')
                    GfY = getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]')
setProperty('defaultCamZoom',0.9)
                    if getProperty('gf.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                        triggerEvent('Camera Follow Pos',GfX-ofs,GfOfs)
                        cameraMoving = true
                    elseif getProperty('gf.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                        triggerEvent('Camera Follow Pos',GfX+ofs,GfOfs)
                        cameraMoving = true
                    elseif getProperty('gf.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                        triggerEvent('Camera Follow Pos',GfX,GfY-GfOfs)
                        cameraMoving = true
                    elseif getProperty('gf.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                        triggerEvent('Camera Follow Pos',GfX,GfY+GfOfs)
                        cameraMoving = true
                    else
                        if cameraMoving == true then
                            triggerEvent('Camera Follow Pos',GfX,GfY)
                            cameraMoving = false
                        end
                    end
                end
        else

                BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
                BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')
setProperty('defaultCamZoom',1.0)

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',BfX-BfOfs,BfY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',BfX+BfOfs,BfY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY-BfOfs)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY+BfOfs)
            else
                if cameraMoving == true then
                    triggerEvent('Camera Follow Pos',BfX,BfY)
                    cameraMoving = false
                end
            end
        end
    end
end

function onBeatHit()
	if didEvent then
		if (getPropertyFromClass('flixel.FlxG', 'camera.zoom') < 2.7 and getPropertyFromClass('ClientPrefs', 'camZooms')) then
			setPropertyFromClass('flixel.FlxG', 'camera.zoom', getPropertyFromClass('flixel.FlxG', 'camera.zoom') + 0.03);
			setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.06);
		end
	end
end
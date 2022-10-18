function onEvent(name,value1)
if name == 'pantalla' then
if value1 == 'si' then
doTweenAlpha('hud5', 'camHUD', 0, 2.6, 'linear')
doTweenAlpha('hud3', 'camGame', 0, 2.6, 'linear')
end
end 
end
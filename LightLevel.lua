local appName="LightLevelv2"
--------------------------------------------------------------------
-- Extract Telemetry Data for LightLevel Function
--------------------------------------------------------------------
local function printStats(width, height)

	local lightSensorValue = system.getTxTelemetry()
	local lightLevelPercent = (((lightSensorValue.photoValue)/4096) * 100)
	-- local lightLevelPercent = 75
	
	if height == 24 then
		local barX = lightLevelPercent
		if barX<2 then 
			barX=2
		end
		lcd.drawNumber(5,2,lightLevelPercent, FONT_NORMAL)
		lcd.drawRectangle(40,2,100,20)
		if lightLevelPercent <= 33 then 
			lcd.setColor(0,200,000) -- Green				
		elseif lightLevelPercent <= 66 then
			lcd.setColor(255,194,0)	-- Amber
		else 
			lcd.setColor(200,0,0) -- Red
		end
		lcd.drawFilledRectangle(41,3,barX,18,75)
	else
		local barY = 58 -(lightLevelPercent / 2)
		if barY<6 then 
			barY=6
		end
		local barZ = (lightLevelPercent / 2)+4
		if barZ>53 then 
			barZ=53
		end
		lcd.drawNumber(5,25,lightLevelPercent, FONT_MAXI)
		lcd.drawRectangle(100,5,40,60)
		if lightLevelPercent <= 33 then 
			lcd.setColor(0,200,0) -- Green				
		elseif lightLevelPercent <= 66 then
			lcd.setColor(255,194,0)	-- Amber
		else 
			lcd.setColor(200,0,0) -- Red
		end
		lcd.drawFilledRectangle(102,barY,36,barZ,75)
	end
end
---------------------------------------------------------------
-- Init Function
--------------------------------------------------------------------
local function init()
	system.registerTelemetry(1,"LightLevel",0,printStats)
end

---------------------------------------------------------------
-- Loop Function
--------------------------------------------------------------------
local function loop()
end

--------------------------------------------------------------------

return { init=init, loop=loop, author="Lasance", version="1.00",name=appName}
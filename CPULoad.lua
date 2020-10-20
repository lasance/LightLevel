--[[
	---------------------------------------------------------
    PML CPU Load 
    
    This is a simple app to monitor the CPU load on your Tx.
    
	This software is freeware and offered with no warranty.
	
	---------------------------------------------------------
	Written by Paul Lasance 2020
	---------------------------------------------------------
--]]

local appName="CPU Load %"

--------------------------------------------------------------------
-- Display CPU Load as a %
--------------------------------------------------------------------
local function printStats(width, height)

	local CPULoad = system.getCPU()
	local CPULoadTxt = CPULoad .. " %"

	if height == 24 then
		local barX = CPULoad

		if barX<2 then 
			barX=2
		end
		lcd.drawText(5,2,CPULoadTxt, FONT_NORMAL)
		lcd.drawRectangle(40,2,100,20)
		if CPULoad <= 33 then 
			lcd.setColor(0,200,000) -- Green				
		elseif CPULoad <= 66 then
			lcd.setColor(255,194,0)	-- Amber
		else 
			lcd.setColor(200,0,0) -- Red
		end
		lcd.drawFilledRectangle(41,3,barX,18,75)
	else
		local barY = 58 -(CPULoad / 2)
		if barY<6 then 
			barY=6
		end
		local barZ = (CPULoad / 2)+4
		if barZ>53 then 
			barZ=53
		end
		lcd.drawText(5,25,CPULoadTxt, FONT_MAXI)
		lcd.drawRectangle(100,5,40,60)
		if CPULoad <= 33 then 
			lcd.setColor(0,200,0) -- Green				
		elseif CPULoad <= 66 then
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
	system.registerTelemetry(1,"CPU Load",0,printStats)
end

---------------------------------------------------------------
-- Loop Function
--------------------------------------------------------------------
local function loop()
end

--------------------------------------------------------------------

return { init=init, loop=loop, author="Lasance", version="1.00",name=appName}
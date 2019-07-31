--
-- DO NOT DELETE
--
-- ALIGNMENT MODULE
-- Made by Redsaph exclusively for Cleartext
--
-- redsaph.xyz
-- github.com/redsaph/cleartext
--
-- If you have read this and have the intention
-- of using this, please do not delete this flower box
-- and just append on it.
--
-- Thank you very much.
--
-- Last modified by Redsaph on July 28, 2018
--

function alignLeft()	
	SKIN:Bang('!WriteKeyValue Variables mediaTextPositionHor 0 "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignment "LeftBottom" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignmentPure "Left" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables interfaceTextAlignment "Right" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables nowTextPositionHor "(#skinSize#*0.185)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables hairlinePositionHor "(#skinSize#*0.215)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables topTextPositionHor "(#skinSize#*0.2475)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playCtrlPositionHor "(#skinSize#*0.1)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables settingsTextPositionHor "(#skinSize#*0.115)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHor "(#skinSize#*0.07)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHorPure "(#skinSize#*0.04)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHor "(#skinSize#*0.03)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHorPure "(#skinSize#*0.08)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables currentlySetAlign left')
	SKIN:Bang('!WriteKeyValue Variables alignRight 0 "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables lastSetWidth "#skinSize#" "#@#variables.inc"')
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignLeft

function getLargestNumber(a, b)
	if a > b then
		return a
	else
		return b
	end -- ends if
end -- ends getLargestNumber

function alignCenter()
	-- PROGRESS BAR
	SKIN:Bang('!WriteKeyValue Variables orientation_progressbar "Horizontal" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_progressbar "(#skinSize#+(#skinSize#*0.33))" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_progressbar "(#skinSize#*0.005)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_progressbar "(#skinSize#*0.01)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progressbar "(#skinSize#*0.11)" "#@#positions.inc"')
	-- NOW
	SKIN:Bang('!WriteKeyValue Variables xpos_now "(#skinSize#*0.65)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_now "(#skinSize#*0.06)" "#@#positions.inc"')
	-- PLAYING
	SKIN:Bang('!WriteKeyValue Variables xpos_playing "(#skinSize#*0.835)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_playing "(#skinSize#*0.06)" "#@#positions.inc"')
	-- UPDATE INDICATOR
	SKIN:Bang('!WriteKeyValue Variables xpos_playing "(#skinSize#*0.8725)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_playing "(#skinSize#*0.062)" "#@#positions.inc"')
	-- TIME
	SKIN:Bang('!WriteKeyValue Variables xpos_time "(#skinSize#*0.5)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_time "(#skinSize#*0.07)" "#@#positions.inc"')
	-- PROGRESS
	SKIN:Bang('!WriteKeyValue Variables xpos_progress "(#skinSize#*1.04)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progress "(#skinSize#*0.07)" "#@#positions.inc"')
	-- SETTINGS
	SKIN:Bang('!WriteKeyValue Variables xpos_settings "(#skinSize#*0.965)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_settings "(#skinSize#*0.07)" "#@#positions.inc"')
	-- PLAY BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_play "(#skinSize#*0.725)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_play "(#skinSize#*0.02)" "#@#positions.inc"')
	-- PREVIOUS BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_prev "(#skinSize#*0.575)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_prev "(#skinSize#*0.02)" "#@#positions.inc"')
	-- NEXT BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_next "(#skinSize#*0.845)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_next "(#skinSize#*0.02)" "#@#positions.inc"')
	-- INTERFACE
	SKIN:Bang('!WriteKeyValue Variables align_interface "Center" "#@#positions.inc"')
	-- REGULAR: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables xpos_container_reg "(#skinSize#*0.0275)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_container_reg "(#skinSize#*0.13)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_reg "(#skinSize#+(#skinSize#*0.3))" "#@#positions.inc"')
	-- STD: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables width_container_std "(#skinSize#+(#skinSize#*0.09))" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_scroll "(#skinSize#+(#skinSize#*0.3))" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_container_std "(#skinSize#*0.0825)" "#@#positions.inc"')
	-- CONTAINER TEXT
	SKIN:Bang('!WriteKeyValue Variables xpos_containertext "(#skinSize#*0.67)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables align_containertext_supposed "Center" "#@#positions.inc"')
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignCenter

function alignRightOnSettings()
	bottomTextWidth = tonumber(SKIN:GetVariable('bottomTextWidth'))
	topTextWidth = tonumber(SKIN:GetVariable('topTextWidth'))

	largestWidth = getLargestNumber(bottomTextWidth, topTextWidth)

	alignRightCore(largestWidth)
end

function alignRightCore(widest)
	skinSize = SKIN:ParseFormula(SKIN:GetVariable('skinSize'))

	if widest > skinSize then
		multiplier = widest
	else
		multiplier = skinSize
	end

	SKIN:Bang('!WriteKeyValue Variables mediaTextPositionHor "#skinSize#" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignment "RightBottom" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignmentPure "Right" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables interfaceTextAlignment "Left" "#@#variables.inc"')

	SKIN:Bang('!WriteKeyValue Variables nowTextPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.15))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables hairlinePositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.12))" "#@#variables.inc"')
	-- SKIN:Bang('!WriteKeyValue Variables topTextPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.09))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables topTextPositionHor 0 "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playCtrlPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.235))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables settingsTextPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.225))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.265))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHorPure "(#skinSize#*0.97)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.21))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHorPure "(#skinSize#*0.93)" "#@#variables.inc"')

	SKIN:Bang('!WriteKeyValue Variables lastSetWidth ' .. multiplier .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables currentlySetAlign right')
	SKIN:Bang('!WriteKeyValue Variables alignRight 1 "#@#variables.inc"')

	SKIN:Bang('!Refresh #CURRENTCONFIG#')
	
	-- print ('bottomTextWidth: ' .. bottomTextWidth .. ', skinSize: ' .. skinSize .. ', multiplier: ' .. multiplier)
end -- ends alignRight

function alignRightOnUpdate()
	alignRightValue = tonumber(SKIN:GetVariable('alignRight'))	
	bottomTextWidth = tonumber(SKIN:GetMeasure('mBottomTextWidth'):GetValue())
	topTextWidth = tonumber(SKIN:GetMeasure('mTopTextWidth'):GetValue())
	widest = getLargestNumber(bottomTextWidth, topTextWidth)
	lastSetWidth = tonumber(SKIN:GetVariable('lastSetWidth'))
	
	-- print ('BEFORE// Largest: ' .. widest .. ', lastSet: ' .. lastSetWidth)

	if alignRightValue == 1 and widest > lastSetWidth then		
		alignRightCore(widest)	
		
		-- lastSetWidth = tonumber(SKIN:GetVariable('lastSetWidth'))
		-- print ('AFTER// Largest: ' .. largestWidth .. ', lastSet: ' .. lastSetWidth)
	end -- ends if statement	
end -- ends Update

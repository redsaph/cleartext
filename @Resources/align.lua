--
-- DO NOT DELETE
--
-- ALIGNMENT MODULE
-- Made by Redsaph exclusively for Cleartext
--
-- redsaph.ml
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
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignLeft

function getWidest()
	bottomTextWidth = tonumber(SKIN:GetMeasure('mBottomTextWidth'):GetValue())
	topTextWidth = tonumber(SKIN:GetMeasure('mTopTextWidth'):GetValue())
	
	if topTextWidth > bottomTextWidth then
		largestWidth = topTextWidth
	else 
		largestWidth = bottomTextWidth
	end

	return largestWidth
end -- ends getWidest

function alignRight()
	skinSize = SKIN:ParseFormula(SKIN:GetVariable('skinSize'))
	widest = getWidest()

	if widest > skinSize then
		multiplier = largestWidth
	else
		multiplier = skinSize
	end

	SKIN:Bang('!WriteKeyValue Variables mediaTextPositionHor "#skinSize#" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignment "RightBottom" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignmentPure "Right" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables interfaceTextAlignment "Left" "#@#variables.inc"')

	SKIN:Bang('!WriteKeyValue Variables nowTextPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.15))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables hairlinePositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.12))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables topTextPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.09))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playCtrlPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.235))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables settingsTextPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.225))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.265))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHorPure "(#skinSize#*0.97)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHor "(' .. multiplier .. '+(' .. skinSize ..'*0.21))" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHorPure "(#skinSize#*0.93)" "#@#variables.inc"')

	SKIN:Bang('!WriteKeyValue Variables currentlySetAlign right')
	SKIN:Bang('!WriteKeyValue Variables alignRight 1 "#@#variables.inc"')

	SKIN:Bang('!Refresh #CURRENTCONFIG#')
	
	-- print ('bottomTextWidth: ' .. bottomTextWidth .. ', skinSize: ' .. skinSize .. ', multiplier: ' .. multiplier)
end -- ends alignRight

function alignRightOnUpdate()
	alignRightValue = tonumber(SKIN:GetVariable('alignRight'))	
	widest = getWidest()
	lastSetWidth = tonumber(SKIN:GetVariable('lastSetWidth'))
	
	-- print ('BEFORE// Largest: ' .. widest .. ', lastSet: ' .. lastSetWidth)

	if alignRightValue == 1 and widest > lastSetWidth then
		SKIN:Bang('!WriteKeyValue Variables lastSetWidth ' .. widest)
		
		alignRight()	
		
		-- lastSetWidth = tonumber(SKIN:GetVariable('lastSetWidth'))
		-- print ('AFTER// Largest: ' .. largestWidth .. ', lastSet: ' .. lastSetWidth)
	end -- ends if statement
	
end -- ends Update

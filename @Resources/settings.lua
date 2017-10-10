--
-- DO NOT DELETE
--
-- SETTINGS MODULE
-- Made by Redsaph exclusively for Cleartext
--
-- redsaph.ml
--
-- If you have read this and have the intention
-- of using this, please do not delete this flower box
-- and just append on it.
--
-- Thank you very much.
--
-- Last modified by Redsaph on April 4, 2017
--

function alignLeft()	
	SKIN:Bang('!WriteKeyValue Variables mediaTextPositionHor 0 "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignment "LeftBottom" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignmentPure "Left" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables interfaceTextAlignment "Right" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables nowTextPositionHor "(#Size#*0.19)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables hairlinePositionHor "(#Size#*0.2075)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables topTextPositionHor "(#Size#*0.225)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playCtrlPositionHor "(#Size#*0.11)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables settingsTextPositionHor "(#Size#*0.125)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHor "(#Size#*0.08)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHorPure "(#Size#*0.04)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables currentlySetAlign left')
	SKIN:Bang('!WriteKeyValue Variables alignRight 0 "#@#variables.inc"')
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignLeft

function alignRight()	
	SKIN:Bang('!WriteKeyValue Variables mediaTextPositionHor "#SIZE#" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignment "RightBottom" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignmentPure "Right" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables interfaceTextAlignment "Left" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables nowTextPositionHor "(#Size#*0.91)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables hairlinePositionHor "(#Size#*0.8825)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables topTextPositionHor "(#Size#*0.865)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playCtrlPositionHor "(#Size#*0.99)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables settingsTextPositionHor "(#Size#*0.975)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHor "(#Size#*1.02)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHorPure "(#Size#*0.97)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables currentlySetAlign right')
	SKIN:Bang('!WriteKeyValue Variables alignRight 1 "#@#variables.inc"')
	SKIN:Bang('!Refresh #CURRENTCONFIG#')
end -- ends alignRight

function refreshCleartext()
	SKIN:Bang('!Refresh #CURRENTCONFIG#')
	alignment = SKIN:GetVariable('currentlySetAlign')
--	width = SKIN:GetVariable('size')
	
	SKIN:Bang('!HideMeterGroup resizeDialog')
	SKIN:Bang('!HideMeterGroup unpDirectoryDialog')
	SKIN:Bang('!HideMeterGroup themeDialog')
	SKIN:Bang('!HideMeterGroup adaptiveDialog')
	SKIN:Bang('!HideMeterGroup bottomTextDialog')
	SKIN:Bang('!HideMeterGroup topTextDialog')
	SKIN:Bang('!HideMeterGroup stowDialog')
	SKIN:Bang('!HideMeterGroup playerDialog')
	SKIN:Bang('!ShowMeterGroup buttons')
	SKIN:Bang('!HideMeterGroup dialogDesign')
	SKIN:Bang('!DisableMeasure "mInput"')
	SKIN:Bang('!Refresh #CURRENTCONFIG#')
	SKIN:Bang('!Refresh "Cleartext" "Cleartext.ini"')
	SKIN:Bang('!Redraw "Cleartext" "Cleartext.ini"')
	
--	print('alignment: ' .. alignment)
--	print('width: ' .. width)
	
	if alignment == 'right' then
		alignRight()
	elseif alignment == 'left' then
		alignLeft()
	end
	
end -- ends refreshCleartext
--
-- DO NOT DELETE
--
-- SETTINGS MODULE
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
-- Last modified by Redsaph on October 10, 2017
--

playerTable = {
	["Windows Media Player"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "WMP"
	},
	["Foobar2000"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "CAD"
	},
	["MusicBee"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "CAD"
	},
	["Spotify"] = {
		playerController = "Title0",
		musicSwitch = "1",
		player = "Spotify"
	},
	["iTunes"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "iTunes"
	},
	["VLC"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "CAD"
	},
	["WebNowPlaying"] = {
		playerController = "StateButton2",
		musicSwitch = "2",
		player = "iTunes"
	},
	["MediaMonkey"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "MediaMonkey"
	},
	["Media Player Classic"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "WLM"
	},
	["J. River Media Center"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "CAD"
	},
	["Winamp"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "Winamp"
	},
	["Zune"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "WLM"
	},
	["AIMP"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "AIMP"
	}
}

function alignLeft()	
	SKIN:Bang('!WriteKeyValue Variables mediaTextPositionHor 0 "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignment "LeftBottom" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignmentPure "Left" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables interfaceTextAlignment "Right" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables nowTextPositionHor "(#Size#*0.185)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables hairlinePositionHor "(#Size#*0.215)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables topTextPositionHor "(#Size#*0.2475)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playCtrlPositionHor "(#Size#*0.1)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables settingsTextPositionHor "(#Size#*0.115)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHor "(#Size#*0.07)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHorPure "(#Size#*0.04)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHor "(#Size#*0.03)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHorPure "(#Size#*0.08)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables currentlySetAlign left')
	SKIN:Bang('!WriteKeyValue Variables alignRight 0 "#@#variables.inc"')
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignLeft

function alignRight()	
	SKIN:Bang('!WriteKeyValue Variables mediaTextPositionHor "#SIZE#" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignment "RightBottom" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables mediaTextAlignmentPure "Right" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables interfaceTextAlignment "Left" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables nowTextPositionHor "(#Size#*0.915)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables hairlinePositionHor "(#Size#*0.8825)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables topTextPositionHor "(#Size#*0.855)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playCtrlPositionHor "(#Size#*1.0)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables settingsTextPositionHor "(#Size#*0.98)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHor "(#Size#*1.03)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables indicatorPositionHorPure "(#Size#*0.97)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHor "(#Size#*1.07)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables conflictIndicatorPositionHorPure "(#Size#*0.93)" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables currentlySetAlign right')
	SKIN:Bang('!WriteKeyValue Variables alignRight 1 "#@#variables.inc"')
	SKIN:Bang('!Refresh #CURRENTCONFIG#')
end -- ends alignRight

function switchPlayer(currentlySet)
	SKIN:Bang('!WriteKeyValue Variables MusicSwitch ' .. playerTable[currentlySet]['musicSwitch'] .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playerController ' .. playerTable[currentlySet]['playerController'] .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables Player ' .. playerTable[currentlySet]['player'] .. ' "#@#variables.inc"')

	if currentlySet == 'Spotify' then
		SKIN:Bang('!WriteKeyValue Variables activePlugin Spotify #@#variables.inc')
	elseif currentlySet == 'WebNowPlaying' then
		SKIN:Bang('!WriteKeyValue Variables activePlugin WebNowPlaying #@#variables.inc')
	else
		SKIN:Bang('!WriteKeyValue Variables activePlugin NowPlaying #@#variables.inc')
	end

	print('Setting ' .. currentlySet)
end -- ends switchPlayer


function setPlayer(selectedPlayerName)
	SKIN:Bang('!WriteKeyValue Variables currentlySetName "' .. selectedPlayerName .. '" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables currentlySetPlayer ' .. playerTable[selectedPlayerName]['player'] .. ' "#@#variables.inc"')
	
	SKIN:Bang('!UpdateMeter "playerTextDialogSubtitle" "Settings.ini"')
	SKIN:Bang('!Redraw "Cleartext/Settings" "Settings.ini"')
end -- ends setPlayer

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
	
	-- if alignment == 'right' then
	-- 	alignRight()
	-- elseif alignment == 'left' then
	-- 	alignLeft()
	-- end
	
end -- ends refreshCleartext

function setScroll(valid)
	if valid == true then
		-- For Cleartext Regular
		SKIN:Bang('!WriteKeyValue Variables regularTopTextMeasure "LuaTopText" "#@#variables.inc"')
		SKIN:Bang('!WriteKeyValue Variables regularBottomTextMeasure "LuaBottomText" "#@#variables.inc"')
		SKIN:Bang('!WriteKeyValue Variables disableScroll 0 "#@#variables.inc"')
	elseif valid == false then
		-- For Cleartext Regular
		SKIN:Bang('!WriteKeyValue Variables regularTopTextMeasure "#topText##MusicSwitch#" "#@#variables.inc"')
		SKIN:Bang('!WriteKeyValue Variables regularBottomTextMeasure "#bottomText##MusicSwitch#" "#@#variables.inc"')
		SKIN:Bang('!WriteKeyValue Variables disableScroll 1 "#@#variables.inc"')
	end

	refreshCleartext()	
end -- ends setScroll
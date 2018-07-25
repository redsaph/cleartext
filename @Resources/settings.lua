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
-- Last modified by Redsaph on July 26, 2018
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
-- ["Spotify"] = {
-- 	playerController = "Title0",
-- 	musicSwitch = "2",
-- 	player = "Spotify"
-- },
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
		player = "Spotify"
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

function alignRight()
	skinSize = SKIN:ParseFormula(SKIN:GetVariable('skinSize'))
	bottomTextWidth = tonumber(SKIN:GetVariable('bottomTextWidth'))

	if bottomTextWidth > skinSize then
		multiplier = bottomTextWidth
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
end -- ends alignRight

-- function switchPlayer(currentlySet)
-- 	SKIN:Bang('!WriteKeyValue Variables MusicSwitch ' .. playerTable[currentlySet]['musicSwitch'] .. ' "#@#variables.inc"')
-- 	SKIN:Bang('!WriteKeyValue Variables playerController ' .. playerTable[currentlySet]['playerController'] .. ' "#@#variables.inc"')
-- 	SKIN:Bang('!WriteKeyValue Variables Player ' .. playerTable[currentlySet]['player'] .. ' "#@#variables.inc"')

-- 	if currentlySet == 'WebNowPlaying' then
-- 		SKIN:Bang('!WriteKeyValue Variables activePlugin WebNowPlaying #@#variables.inc')
-- 	else
-- 		SKIN:Bang('!WriteKeyValue Variables activePlugin NowPlaying #@#variables.inc')
-- 	end

-- 	print('Setting ' .. currentlySet)
-- end -- ends switchPlayer


function setPlayer(selectedPlayerName)
	SKIN:Bang('!WriteKeyValue Variables currentlySetName "' .. selectedPlayerName .. '" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables Player ' .. playerTable[selectedPlayerName]['player'] .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables MusicSwitch ' .. playerTable[selectedPlayerName]['musicSwitch'] .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables playerController ' .. playerTable[selectedPlayerName]['playerController'] .. ' "#@#variables.inc"')
	
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
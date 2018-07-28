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
-- Last modified by Redsaph on July 28, 2018
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
	["Spotify (NowPlaying)"] = {
		playerController = "Title0",
		musicSwitch = "0",
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

function Initialize()
	dofile(SKIN:GetVariable('@')..'align.lua')
end -- ends Initialize

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
	
	if alignment == 'right' then
		alignRight()
	elseif alignment == 'left' then
		alignLeft()
	end
	
end -- ends refreshCleartext
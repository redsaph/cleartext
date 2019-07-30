--
-- DO NOT DELETE
--
-- SETTINGS MODULE
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
-- Last modified by Redsaph on February 13, 2019
--

playerTable = {
	["Windows Media Player"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "WMP",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Foobar2000"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "CAD",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["MusicBee"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "CAD",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Spotify (NowPlaying)"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "Spotify",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["iTunes"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "iTunes",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["VLC"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "CAD",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["WebNowPlaying"] = {
		playerController = "StateButton2",
		musicSwitch = "2",
		player = "Spotify",
		disable_np = "1",
		disable_gpmdp = "1",
		disable_wnp = "0"
	},
	["GPMDP"] = {
		playerController = "StateButton1",
		musicSwitch = "1",
		player = "Spotify",
		disable_np = "1",
		disable_gpmdp = "0",
		disable_wnp = "1"
	},
	["MediaMonkey"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "MediaMonkey",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Media Player Classic"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "WLM",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["J. River Media Center"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "CAD",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Winamp"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "Winamp",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Zune"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "WLM",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["AIMP"] = {
		playerController = "Title0",
		musicSwitch = "0",
		player = "AIMP",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
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
	SKIN:Bang('!WriteKeyValue Variables disable_np ' .. playerTable[selectedPlayerName]['disable_np'] .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables disable_gpmdp ' .. playerTable[selectedPlayerName]['disable_gpmdp'] .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables disable_wnp ' .. playerTable[selectedPlayerName]['disable_wnp'] .. ' "#@#variables.inc"')

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
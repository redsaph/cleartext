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
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "WMP",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Foobar2000"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "CAD",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["MusicBee"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "CAD",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Spotify (NowPlaying)"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "Spotify",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["iTunes"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "iTunes",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["VLC"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "CAD",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["WebNowPlaying"] = {
		player_controller = "StateButton2",
		player_mode = "2",
		player_supposed = "Spotify",
		disable_np = "1",
		disable_gpmdp = "1",
		disable_wnp = "0"
	},
	["GPMDP"] = {
		player_controller = "StateButton1",
		player_mode = "1",
		player_supposed = "Spotify",
		disable_np = "1",
		disable_gpmdp = "0",
		disable_wnp = "1"
	},
	["MediaMonkey"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "MediaMonkey",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Media Player Classic"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "WLM",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["J. River Media Center"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "CAD",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Winamp"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "Winamp",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["Zune"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "WLM",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	},
	["AIMP"] = {
		player_controller = "Title0",
		player_mode = "0",
		player_supposed = "AIMP",
		disable_np = "0",
		disable_gpmdp = "1",
		disable_wnp = "1"
	}
}

function Initialize()
	dofile(SKIN:GetVariable('@')..'align.lua')
end -- ends Initialize

function setPlayer(selectedPlayerName)
	SKIN:Bang('!WriteKeyValue Variables player_setname "' .. selectedPlayerName .. '" "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables player_supposed ' .. playerTable[selectedPlayerName]['player_supposed'] .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables player_mode ' .. playerTable[selectedPlayerName]['player_mode'] .. ' "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables player_controller ' .. playerTable[selectedPlayerName]['player_controller'] .. ' "#@#variables.inc"')
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
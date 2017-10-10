--
-- DO NOT DELETE
--
-- SMART SWITCHER ACTIONS FOR SPOTIFY AND NOWPLAYING
-- Made by Redsaph exclusively for Cleartext
--
-- redsaph.ml
--
-- If you have read this and have the intention
-- of using this, please do not delete this flower box
-- and just append on it.
-- 
-- I've stopped using this because it's really buggy
-- and I wish there was multithreading support
-- for Lua with Rainmeter.
--
-- Thank you very much.
--
-- Last modified by Redsaph on April 7, 2017
--
	

function Initialize()
	initialPlayer = SKIN:GetVariable('Player')
end -- ends Initialize

function adaptForNowPlaying()	
	SKIN:Bang('!WriteKeyValue Variables MusicSwitch 0 "#@#variables.inc"') 
	SKIN:Bang('!WriteKeyValue Variables CurPlayer "' .. initialPlayer .. '" "#@#variables.inc"')
	SKIN:Bang('!Refresh')
	print('Cleartext is switching to Now Playing')
end -- ends adaptForNowPlaying

function adaptForSpotify()
	SKIN:Bang('!WriteKeyValue Variables MusicSwitch 1 "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables CurPlayer Spotify "#@#variables.inc"')
	SKIN:Bang('!Refresh')
	print('Cleartext is switching to Spotify')	
end -- ends adaptForSpotify

function adaptForWebNowPlaying()
	SKIN:Bang('!WriteKeyValue Variables MusicSwitch 2 "#@#variables.inc"')
	SKIN:Bang('!WriteKeyValue Variables CurPlayer Spotify "#@#variables.inc"')
	SKIN:Bang('!Refresh')
	print('Cleartext is switching to Spotify')	
end -- ends adaptForSpotify

function enableMeasureNowPlaying()
	SKIN:Bang('!EnableMeasure "mSmartSwitchNowPlaying"')	
	print('Called mSmartSwitchNowPlaying')
end -- ends enableMeasureNowPlaying

function enableMeasureSpotify()
	SKIN:Bang('!EnableMeasure "mSmartSwitchSpotify"')	
	print('Called mSmartSwitchSpotify')
end -- ends enableMeasureSpotify
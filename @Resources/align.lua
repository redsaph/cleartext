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
-- Last modified by Redsaph on August 6, 2019
--

function alignLeft()
	-- PROGRESS BAR
	SKIN:Bang('!WriteKeyValue Variables orientation_progressbar "Vertical" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_progressbar "(#skinSize#*0.005)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_progressbar "(#skinSize#*0.25)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_progressbar "(#skinSize#*0.22)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progressbar "(#skinSize#*0.03)" "#@#positions.inc"')
	-- NOW
	SKIN:Bang('!WriteKeyValue Variables xpos_now "(#skinSize#*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_now "(#skinSize#*0.11)" "#@#positions.inc"')
	-- PLAYING
	SKIN:Bang('!WriteKeyValue Variables xpos_playing "(#skinSize#*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_playing "(#skinSize#*0.145)" "#@#positions.inc"')
	-- NOW PLAYING FOR CENTER
	SKIN:Bang('!WriteKeyValue Variables xpos_nowplaying "(#skinSize#*0.69)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_nowplaying "(#skinSize#*0.045)" "#@#positions.inc"')
	-- UPDATE INDICATOR
	SKIN:Bang('!WriteKeyValue Variables xpos_indicator "(#skinSize#*0.07)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_indicator "(#skinSize#*0.1175)" "#@#positions.inc"')
	-- TIME
	SKIN:Bang('!WriteKeyValue Variables xpos_time "(#skinSize#*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_time "(#skinSize#*0.035)" "#@#positions.inc"')
	-- PROGRESS
	SKIN:Bang('!WriteKeyValue Variables xpos_progress "(#skinSize#*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progress "(#skinSize#*0.065)" "#@#positions.inc"')
	-- SETTINGS
	SKIN:Bang('!WriteKeyValue Variables xpos_settings "(#skinSize#*0.125)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_settings "(#skinSize#*0.065)" "#@#positions.inc"')
	-- PLAY BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_play "(#skinSize#*0.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_play "(#skinSize#*0.235)" "#@#positions.inc"')
	-- PREVIOUS BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_prev "(#skinSize#*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_prev "(#skinSize#*0.2)" "#@#positions.inc"')
	-- NEXT BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_next "(#skinSize#*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_next "(#skinSize#*0.235)" "#@#positions.inc"')
	-- INTERFACE
	SKIN:Bang('!WriteKeyValue Variables align_interface "Right" "#@#positions.inc"')
	-- REGULAR: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables xpos_container_reg "(#skinSize#*0.245)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertop_reg "(#skinSize#*0.055)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containerbtm_reg "(#skinSize#*0.1425)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_reg "(#skinSize#*1.0875)" "#@#positions.inc"')
	-- STD: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables width_container_std "(#skinSize#*1.0875)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_scroll "(#skinSize#*1.28)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_container_std "(#skinSize#*0.11)" "#@#positions.inc"')
	-- CONTAINER TEXT
	SKIN:Bang('!WriteKeyValue Variables ypos_containertextbtm 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_containertext 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertexttop "(#skinSize#*0.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables align_containertext_supposed "Left" "#@#positions.inc"')
	-- PURE:: UPDATE INDICATOR	
	SKIN:Bang('!WriteKeyValue Variables pure_xpos_indicator 0 "#@#positions.inc"')
	-- PURE:: REGULAR: CONTAINERS	
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containertop_reg "(#skinSize#*0.045)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containerbtm_reg "(#skinSize#*0.1325)" "#@#positions.inc"')
	-- SWITCHES
	SKIN:Bang('!WriteKeyValue Variables bool_alignright 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables bool_aligncenter 0 "#@#positions.inc"')
	
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
	SKIN:Bang('!WriteKeyValue Variables width_progressbar "(#skinSize#*1.1)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_progressbar "(#skinSize#*0.005)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_progressbar "(#skinSize#*0.14)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progressbar "(#skinSize#*0.1075)" "#@#positions.inc"')
	-- NOW
	SKIN:Bang('!WriteKeyValue Variables xpos_now "(#skinSize#*0.6025)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_now "(#skinSize#*0.045)" "#@#positions.inc"')
	-- PLAYING
	SKIN:Bang('!WriteKeyValue Variables xpos_playing "(#skinSize#*0.7465)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_playing "(#skinSize#*0.0455)" "#@#positions.inc"')
	-- NOW PLAYING FOR CENTER
	SKIN:Bang('!WriteKeyValue Variables xpos_nowplaying "(#skinSize#*0.69)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_nowplaying "(#skinSize#*0.045)" "#@#positions.inc"')
	-- UPDATE INDICATOR
	SKIN:Bang('!WriteKeyValue Variables xpos_indicator "(#skinSize#*0.84)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_indicator "(#skinSize#*0.057)" "#@#positions.inc"')
	-- TIME
	SKIN:Bang('!WriteKeyValue Variables xpos_time "(#skinSize#*0.45)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_time "(#skinSize#*0.055)" "#@#positions.inc"')
	-- PROGRESS
	SKIN:Bang('!WriteKeyValue Variables xpos_progress "(#skinSize#*1.02)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progress "(#skinSize#*0.055)" "#@#positions.inc"')
	-- SETTINGS
	SKIN:Bang('!WriteKeyValue Variables xpos_settings "(#skinSize#*0.925)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_settings "(#skinSize#*0.055)" "#@#positions.inc"')
	-- PLAY BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_play "(#skinSize#*0.725)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_play 0 "#@#positions.inc"')
	-- PREVIOUS BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_prev "(#skinSize#*0.575)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_prev 0 "#@#positions.inc"')
	-- NEXT BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_next "(#skinSize#*0.835)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_next 0 "#@#positions.inc"')
	-- INTERFACE
	SKIN:Bang('!WriteKeyValue Variables align_interface "Center" "#@#positions.inc"')
	-- REGULAR: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables xpos_container_reg "(#skinSize#*0.0265)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertop_reg "(#skinSize#*0.105)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containerbtm_reg "(#skinSize#*0.1925)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_reg "(#skinSize#*1.3)" "#@#positions.inc"')
	-- STD: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables width_container_std "(#skinSize#*1.0875)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_scroll "(#skinSize#*1.32)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_container_std "(#skinSize#*0.11)" "#@#positions.inc"')
	-- CONTAINER TEXT
	SKIN:Bang('!WriteKeyValue Variables ypos_containertextbtm 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_containertext "(#skinSize#*0.66)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertexttop "(#skinSize#*0.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables align_containertext_supposed "Center" "#@#positions.inc"')
	-- PURE:: UPDATE INDICATOR	
	SKIN:Bang('!WriteKeyValue Variables pure_xpos_indicator "(#skinSize#*0.69)" "#@#positions.inc"')
	-- PURE:: REGULAR: CONTAINERS	
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containertop_reg "(#skinSize#*0.045)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containerbtm_reg "(#skinSize#*0.1325)" "#@#positions.inc"')
	-- SWITCHES
	SKIN:Bang('!WriteKeyValue Variables bool_alignright 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables bool_aligncenter 1 "#@#positions.inc"')
	
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignCenter

function alignRight()
	-- PROGRESS BAR
	SKIN:Bang('!WriteKeyValue Variables orientation_progressbar "Vertical" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_progressbar "(#skinSize#*0.005)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_progressbar "(#skinSize#*0.25)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_progressbar "(#skinSize#*1.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progressbar "(#skinSize#*0.03)" "#@#positions.inc"')
	-- NOW
	SKIN:Bang('!WriteKeyValue Variables xpos_now "(#skinSize#*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_now "(#skinSize#*0.11)" "#@#positions.inc"')
	-- PLAYING
	SKIN:Bang('!WriteKeyValue Variables xpos_playing "(#skinSize#*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_playing "(#skinSize#*0.145)" "#@#positions.inc"')
	-- NOW PLAYING FOR CENTER
	SKIN:Bang('!WriteKeyValue Variables xpos_nowplaying "(#skinSize#*0.69)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_nowplaying "(#skinSize#*0.045)" "#@#positions.inc"')
	-- UPDATE INDICATOR
	SKIN:Bang('!WriteKeyValue Variables xpos_indicator "(#skinSize#*1.26)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_indicator "(#skinSize#*0.1175)" "#@#positions.inc"')
	-- TIME
	SKIN:Bang('!WriteKeyValue Variables xpos_time "(#skinSize#*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_time "(#skinSize#*0.035)" "#@#positions.inc"')
	-- PROGRESS
	SKIN:Bang('!WriteKeyValue Variables xpos_progress "(#skinSize#*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progress "(#skinSize#*0.065)" "#@#positions.inc"')
	-- SETTINGS
	SKIN:Bang('!WriteKeyValue Variables xpos_settings "(#skinSize#*1.215)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_settings "(#skinSize#*0.065)" "#@#positions.inc"')
	-- PLAY BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_play "(#skinSize#*1.23)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_play "(#skinSize#*0.235)" "#@#positions.inc"')
	-- PREVIOUS BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_prev "(#skinSize#*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_prev "(#skinSize#*0.2)" "#@#positions.inc"')
	-- NEXT BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_next "(#skinSize#*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_next "(#skinSize#*0.235)" "#@#positions.inc"')
	-- INTERFACE
	SKIN:Bang('!WriteKeyValue Variables align_interface "Left" "#@#positions.inc"')
	-- REGULAR: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables xpos_container_reg "(#skinSize#*0.01)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertop_reg "(#skinSize#*0.055)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containerbtm_reg "(#skinSize#*0.1425)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_reg "(#skinSize#*1.0875)" "#@#positions.inc"')
	-- STD: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables width_container_std "(#skinSize#*1.0875)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_scroll "(#skinSize#*1.28)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_container_std "(#skinSize#*0.11)" "#@#positions.inc"')
	-- CONTAINER TEXT
	SKIN:Bang('!WriteKeyValue Variables ypos_containertextbtm 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_containertext "(#skinSize#*1.09)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertexttop "(#skinSize#*0.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables align_containertext_supposed "Right" "#@#positions.inc"')
	-- PURE:: UPDATE INDICATOR	
	SKIN:Bang('!WriteKeyValue Variables pure_xpos_indicator "(#skinSize#*1.0925)" "#@#positions.inc"')
	-- PURE:: REGULAR: CONTAINERS	
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containertop_reg "(#skinSize#*0.045)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containerbtm_reg "(#skinSize#*0.1325)" "#@#positions.inc"')
	-- SWITCHES
	SKIN:Bang('!WriteKeyValue Variables bool_alignright 1 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables bool_aligncenter 0 "#@#positions.inc"')
	
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignRight

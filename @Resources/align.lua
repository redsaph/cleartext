--
-- DO NOT DELETE
--
-- ALIGNMENT MODULE
-- Made by Redsaph exclusively for Cleartext
--
-- janvelasco.com
-- github.com/redsaph/cleartext
--
-- If you have read this and have the intention
-- of using this, please do not delete this flower box
-- and just append on it.
--
-- Thank you very much.
--
-- Last modified by Redsaph on June 25, 2020
--

function alignLeft(size)

	-- PROGRESS BAR
	SKIN:Bang('!WriteKeyValue Variables orientation_progressbar "Vertical" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_progressbar "(' .. size .. '*0.005)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_progressbar "(' .. size .. '*0.25)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_progressbar "(' .. size .. '*0.22)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progressbar "(' .. size .. '*0.03)" "#@#positions.inc"')
	-- NOW
	SKIN:Bang('!WriteKeyValue Variables xpos_now "(' .. size .. '*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_now "(' .. size .. '*0.11)" "#@#positions.inc"')
	-- PLAYING
	SKIN:Bang('!WriteKeyValue Variables xpos_playing "(' .. size .. '*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_playing "(' .. size .. '*0.145)" "#@#positions.inc"')
	-- NOW PLAYING FOR CENTER
	SKIN:Bang('!WriteKeyValue Variables xpos_nowplaying "(' .. size .. '*0.69)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_nowplaying "(' .. size .. '*0.045)" "#@#positions.inc"')
	-- UPDATE INDICATOR
	SKIN:Bang('!WriteKeyValue Variables xpos_indicator "(' .. size .. '*0.07)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_indicator "(' .. size .. '*0.1175)" "#@#positions.inc"')
	-- TIME
	SKIN:Bang('!WriteKeyValue Variables xpos_time "(' .. size .. '*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_time "(' .. size .. '*0.035)" "#@#positions.inc"')
	-- PROGRESS
	SKIN:Bang('!WriteKeyValue Variables xpos_progress "(' .. size .. '*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progress "(' .. size .. '*0.065)" "#@#positions.inc"')
	-- SETTINGS
	SKIN:Bang('!WriteKeyValue Variables xpos_settings "(' .. size .. '*0.125)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_settings "(' .. size .. '*0.065)" "#@#positions.inc"')
	-- PLAY BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_play "(' .. size .. '*0.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_play "(' .. size .. '*0.235)" "#@#positions.inc"')
	-- PREVIOUS BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_prev "(' .. size .. '*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_prev "(' .. size .. '*0.2)" "#@#positions.inc"')
	-- NEXT BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_next "(' .. size .. '*0.2)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_next "(' .. size .. '*0.235)" "#@#positions.inc"')
	-- INTERFACE
	SKIN:Bang('!WriteKeyValue Variables align_interface "Right" "#@#positions.inc"')
	-- REGULAR: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables xpos_container_reg "(' .. size .. '*0.245)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertop_reg "(' .. size .. '*0.055)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containerbtm_reg "(' .. size .. '*0.1425)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_reg "(' .. size .. '*1.0875)" "#@#positions.inc"')
	-- STD: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables width_container_std "(' .. size .. '*1.0875)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_scroll "(' .. size .. '*1.28)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_container_std "(' .. size .. '*0.11)" "#@#positions.inc"')
	-- CONTAINER TEXT
	SKIN:Bang('!WriteKeyValue Variables ypos_containertextbtm 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_containertext 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertexttop "(' .. size .. '*0.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables align_containertext_supposed "Left" "#@#positions.inc"')
	-- PURE:: UPDATE INDICATOR	
	SKIN:Bang('!WriteKeyValue Variables pure_xpos_indicator 0 "#@#positions.inc"')
	-- PURE:: REGULAR: CONTAINERS	
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containertop_reg "(' .. size .. '*0.045)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containerbtm_reg "(' .. size .. '*0.1325)" "#@#positions.inc"')
	-- SWITCHES
	SKIN:Bang('!WriteKeyValue Variables bool_alignright 0 "#@#var.inc"')
	SKIN:Bang('!WriteKeyValue Variables bool_aligncenter 0 "#@#var.inc"')
	
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignLeft

function getLargestNumber(a, b)
	if a > b then
		return a
	else
		return b
	end -- ends if
end -- ends getLargestNumber

function alignCenter(size)
	-- PROGRESS BAR
	SKIN:Bang('!WriteKeyValue Variables orientation_progressbar "Horizontal" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_progressbar "(' .. size .. '*1.1)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_progressbar "(' .. size .. '*0.005)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_progressbar "(' .. size .. '*0.14)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progressbar "(' .. size .. '*0.1075)" "#@#positions.inc"')
	-- NOW
	SKIN:Bang('!WriteKeyValue Variables xpos_now "(' .. size .. '*0.6025)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_now "(' .. size .. '*0.045)" "#@#positions.inc"')
	-- PLAYING
	SKIN:Bang('!WriteKeyValue Variables xpos_playing "(' .. size .. '*0.7465)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_playing "(' .. size .. '*0.0455)" "#@#positions.inc"')
	-- NOW PLAYING FOR CENTER
	SKIN:Bang('!WriteKeyValue Variables xpos_nowplaying "(' .. size .. '*0.69)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_nowplaying "(' .. size .. '*0.045)" "#@#positions.inc"')
	-- UPDATE INDICATOR
	SKIN:Bang('!WriteKeyValue Variables xpos_indicator "(' .. size .. '*0.84)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_indicator "(' .. size .. '*0.057)" "#@#positions.inc"')
	-- TIME
	SKIN:Bang('!WriteKeyValue Variables xpos_time "(' .. size .. '*0.45)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_time "(' .. size .. '*0.055)" "#@#positions.inc"')
	-- PROGRESS
	SKIN:Bang('!WriteKeyValue Variables xpos_progress "(' .. size .. '*1.02)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progress "(' .. size .. '*0.055)" "#@#positions.inc"')
	-- SETTINGS
	SKIN:Bang('!WriteKeyValue Variables xpos_settings "(' .. size .. '*0.925)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_settings "(' .. size .. '*0.055)" "#@#positions.inc"')
	-- PLAY BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_play "(' .. size .. '*0.725)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_play 0 "#@#positions.inc"')
	-- PREVIOUS BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_prev "(' .. size .. '*0.575)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_prev 0 "#@#positions.inc"')
	-- NEXT BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_next "(' .. size .. '*0.835)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_next 0 "#@#positions.inc"')
	-- INTERFACE
	SKIN:Bang('!WriteKeyValue Variables align_interface "Center" "#@#positions.inc"')
	-- REGULAR: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables xpos_container_reg "(' .. size .. '*0.0265)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertop_reg "(' .. size .. '*0.105)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containerbtm_reg "(' .. size .. '*0.1925)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_reg "(' .. size .. '*1.3)" "#@#positions.inc"')
	-- STD: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables width_container_std "(' .. size .. '*1.0875)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_scroll "(' .. size .. '*1.32)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_container_std "(' .. size .. '*0.11)" "#@#positions.inc"')
	-- CONTAINER TEXT
	SKIN:Bang('!WriteKeyValue Variables ypos_containertextbtm 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_containertext "(' .. size .. '*0.66)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertexttop "(' .. size .. '*0.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables align_containertext_supposed "Center" "#@#positions.inc"')
	-- PURE:: UPDATE INDICATOR	
	SKIN:Bang('!WriteKeyValue Variables pure_xpos_indicator "(' .. size .. '*0.69)" "#@#positions.inc"')
	-- PURE:: REGULAR: CONTAINERS	
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containertop_reg "(' .. size .. '*0.045)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containerbtm_reg "(' .. size .. '*0.1325)" "#@#positions.inc"')
	-- SWITCHES
	SKIN:Bang('!WriteKeyValue Variables bool_alignright 0 "#@#var.inc"')
	SKIN:Bang('!WriteKeyValue Variables bool_aligncenter 1 "#@#var.inc"')
	
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignCenter

function alignRight(size)
	-- PROGRESS BAR
	SKIN:Bang('!WriteKeyValue Variables orientation_progressbar "Vertical" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_progressbar "(' .. size .. '*0.005)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_progressbar "(' .. size .. '*0.25)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_progressbar "(' .. size .. '*1.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progressbar "(' .. size .. '*0.03)" "#@#positions.inc"')
	-- NOW
	SKIN:Bang('!WriteKeyValue Variables xpos_now "(' .. size .. '*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_now "(' .. size .. '*0.11)" "#@#positions.inc"')
	-- PLAYING
	SKIN:Bang('!WriteKeyValue Variables xpos_playing "(' .. size .. '*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_playing "(' .. size .. '*0.145)" "#@#positions.inc"')
	-- NOW PLAYING FOR CENTER
	SKIN:Bang('!WriteKeyValue Variables xpos_nowplaying "(' .. size .. '*0.69)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_nowplaying "(' .. size .. '*0.045)" "#@#positions.inc"')
	-- UPDATE INDICATOR
	SKIN:Bang('!WriteKeyValue Variables xpos_indicator "(' .. size .. '*1.26)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_indicator "(' .. size .. '*0.1175)" "#@#positions.inc"')
	-- TIME
	SKIN:Bang('!WriteKeyValue Variables xpos_time "(' .. size .. '*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_time "(' .. size .. '*0.035)" "#@#positions.inc"')
	-- PROGRESS
	SKIN:Bang('!WriteKeyValue Variables xpos_progress "(' .. size .. '*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_progress "(' .. size .. '*0.065)" "#@#positions.inc"')
	-- SETTINGS
	SKIN:Bang('!WriteKeyValue Variables xpos_settings "(' .. size .. '*1.215)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_settings "(' .. size .. '*0.065)" "#@#positions.inc"')
	-- PLAY BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_play "(' .. size .. '*1.23)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_play "(' .. size .. '*0.235)" "#@#positions.inc"')
	-- PREVIOUS BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_prev "(' .. size .. '*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_prev "(' .. size .. '*0.2)" "#@#positions.inc"')
	-- NEXT BUTTON
	SKIN:Bang('!WriteKeyValue Variables xpos_next "(' .. size .. '*1.145)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_next "(' .. size .. '*0.235)" "#@#positions.inc"')
	-- INTERFACE
	SKIN:Bang('!WriteKeyValue Variables align_interface "Left" "#@#positions.inc"')
	-- REGULAR: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables xpos_container_reg "(' .. size .. '*0.01)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertop_reg "(' .. size .. '*0.055)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containerbtm_reg "(' .. size .. '*0.1425)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_reg "(' .. size .. '*1.0875)" "#@#positions.inc"')
	-- STD: CONTAINERS
	SKIN:Bang('!WriteKeyValue Variables width_container_std "(' .. size .. '*1.0875)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables width_container_scroll "(' .. size .. '*1.28)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables height_container_std "(' .. size .. '*0.11)" "#@#positions.inc"')
	-- CONTAINER TEXT
	SKIN:Bang('!WriteKeyValue Variables ypos_containertextbtm 0 "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables xpos_containertext "(' .. size .. '*1.09)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables ypos_containertexttop "(' .. size .. '*0.12)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables align_containertext_supposed "Right" "#@#positions.inc"')
	-- PURE:: UPDATE INDICATOR	
	SKIN:Bang('!WriteKeyValue Variables pure_xpos_indicator "(' .. size .. '*1.0925)" "#@#positions.inc"')
	-- PURE:: REGULAR: CONTAINERS	
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containertop_reg "(' .. size .. '*0.045)" "#@#positions.inc"')
	SKIN:Bang('!WriteKeyValue Variables pure_ypos_containerbtm_reg "(' .. size .. '*0.1325)" "#@#positions.inc"')
	-- SWITCHES
	SKIN:Bang('!WriteKeyValue Variables bool_alignright 1 "#@#var.inc"')
	SKIN:Bang('!WriteKeyValue Variables bool_aligncenter 0 "#@#var.inc"')
	
	SKIN:Bang('!Refresh #CURRENTCONFIG#')	
end -- ends alignRight

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
-- Thank you very much.
--
-- Last modified by Redsaph on November 26, 2017
--
	

function Initialize()
  dofile(SKIN:GetVariable('@')..'settings.lua')
end -- ends Initialize

function Update()
  activePlugin = SKIN:GetVariable('activePlugin')
  currentPlayer = SKIN:GetVariable('currentlySetName')
	nowPlayingStatus = SKIN:GetMeasure('mStatus0'):GetValue()
  spotifyStatus = SKIN:GetMeasure('mStatus1'):GetValue()

  print ('Spotify ' .. spotifyStatus .. ' Now Playing ' .. 
  nowPlayingStatus .. '\t Plugin: ' .. activePlugin .. '\t Player: ' .. currentPlayer)

  if not (nowPlayingStatus == 1 and spotifyStatus == 1) then
    if activePlugin ~= 'Spotify' and spotifyStatus == 1 then
      switchPlayer('Spotify')
      refreshCleartext()
    elseif activePlugin == 'Spotify' and nowPlayingStatus == 1 then
      switchPlayer(currentPlayer)
      refreshCleartext()
    end -- end player active check
  else
    print ("Both players are open. Please close one to continue.")
  end -- end conflict check

end -- ends Update
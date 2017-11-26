--
-- DO NOT DELETE
--
-- SMART SWITCHER ACTIONS FOR SPOTIFY AND NOWPLAYING
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
  webNowPlayingStatus = SKIN:GetMeasure('mStatus2'):GetValue()

  -- print ('Spotify ' .. spotifyStatus .. ' Now Playing ' .. 
  -- nowPlayingStatus .. ' Web ' .. webNowPlayingStatus .. '\t Plugin: ' .. activePlugin .. '\t Player: ' .. currentPlayer)

  if not (nowPlayingStatus == 1 and spotifyStatus == 1) and not (webNowPlayingStatus == 1 and spotifyStatus == 1) then
    if activePlugin ~= 'Spotify' and spotifyStatus == 1 then
      switchPlayer('Spotify')
      refreshCleartext()
    elseif activePlugin ~= 'WebNowPlaying' and webNowPlayingStatus == 1 then
      switchPlayer('WebNowPlaying')
      refreshCleartext()
    elseif activePlugin == 'Spotify' and nowPlayingStatus == 1 then
      switchPlayer(currentPlayer)
      refreshCleartext()
    end -- end player active check
    return 1
  else
    -- error ('Two music players are running. Please close one to continue. If closing does not ' ..
    --  'fix the issue, check if its process is closed in the Task Manager.')
    return 2
  end -- end conflict check

end -- ends Update
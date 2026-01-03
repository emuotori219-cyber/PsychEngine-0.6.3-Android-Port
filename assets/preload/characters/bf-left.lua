-- bf-left.lua
-- Left-facing boyfriend character script (shadow handled by shadow-manager.lua)

function onCreatePost()
    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-deadright');
    setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
    setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver');
    setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd');
end
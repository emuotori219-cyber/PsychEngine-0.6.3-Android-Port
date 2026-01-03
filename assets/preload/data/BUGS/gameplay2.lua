local step1312Triggered = false

function onStepHit()
    if curStep == 1312 and not step1312Triggered then
        step1312Triggered = true
        
        if downscroll then
            noteTweenY('OpponentStrumY0', 0, 1250, 0.001, "quadInOut")
            noteTweenY('OpponentStrumY1', 1, 1250, 0.001, "quadInOut")
            noteTweenY('OpponentStrumY2', 2, 1250, 0.001, "quadInOut")
            noteTweenY('OpponentStrumY3', 3, 1250, 0.001, "quadInOut")
        else
            noteTweenY('OpponentStrumY0', 0, 800, 0.001, "quadInOut")
            noteTweenY('OpponentStrumY1', 1, 800, 0.001, "quadInOut")
            noteTweenY('OpponentStrumY2', 2, 800, 0.001, "quadInOut")
            noteTweenY('OpponentStrumY3', 3, 800, 0.001, "quadInOut")
        end
        
        if middlescroll then
            noteTweenX('OpponentStrumX0', 0, 600, 0.1, "quadInOut")
            noteTweenX('OpponentStrumX1', 1, 1200, 0.1, "quadInOut")
            noteTweenX('OpponentStrumX2', 2, 1800, 0.1, "quadInOut")
            noteTweenX('OpponentStrumX3', 3, 2400, 0.1, "quadInOut")
        end
        
        runHaxeCode([[
            for (strum in game.opponentStrums)
            {
                strum.cameras = [game.camGame];
                strum.scrollFactor.set(1, 1);
                strum.scale.x = 2;
                strum.scale.y = 2;
                strum.x += 1150;
                strum.y += 500;
                
                game.opponentStrums.members[0].x -= 150;
                game.opponentStrums.members[0].y += 300;
                game.opponentStrums.members[1].x -= 100;
                game.opponentStrums.members[1].y += 300;
                game.opponentStrums.members[2].x += 150;
                game.opponentStrums.members[2].y += 300;
                game.opponentStrums.members[3].x += 190;
                game.opponentStrums.members[3].y += 300;
            }
            for (note in game.unspawnNotes) 
            {
                if (!note.mustPress) {
                    note.cameras = [game.camGame];
                    note.scrollFactor.set(1, 1);
                    note.scale.x = 2;
                    note.scale.y = 2;
                    if (note.isSustainNote) {
                        note.scale.y = 2.5;
                    } 
                }
            };
        ]])
        
        noteTweenAlpha('OpponentAlpha0', 0, 0.6, 0.001, 'linear');
        noteTweenAlpha('OpponentAlpha1', 1, 0.6, 0.001, 'linear');
        noteTweenAlpha('OpponentAlpha2', 2, 0.6, 0.001, 'linear');
        noteTweenAlpha('OpponentAlpha3', 3, 0.6, 0.001, 'linear');
        
        for i=0, getProperty('unspawnNotes.length') do
            if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 3)
            end
        end		
    end
end

function onUpdate(elapsed)
    if step1312Triggered then
        setObjectOrder('floor', getObjectOrder('opponentStrums.members[1]') + 50) 
        setObjectOrder('dadGroup', getObjectOrder('floor') + 15) 
        setObjectOrder('gfGroup', getObjectOrder('floor') + 12) 
        setObjectOrder('boyfriendGroup', getObjectOrder('floor') + 64) 
        setObjectOrder('bfrunning', getObjectOrder('boyfriendGroup') - 1) 
        setObjectOrder('bfShadow', getObjectOrder('bfrunning') - 1)  
        setObjectOrder('bg2-ground', getObjectOrder('bfShadow') - 1)
    end
end
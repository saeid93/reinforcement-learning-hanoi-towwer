function rewardedStates = rewardedMovesRewardAssigner( qTable )
finalStateMoves = find(qTable(:, 7) == 3 & qTable(:, 8) == 3 & qTable(:, 9) == 3 ...
     & qTable(:, 10) == 3 & qTable(:, 11) == 3 & qTable(:, 12) == 3);
 
rewardedStates = [finalStateMoves ones(2,1)*50];
end


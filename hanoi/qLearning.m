function qTable = qLearning(qTable , rewardedStates , learningRate , discountFactor , ... 
    numOfEpisodes , initialState , finalState , initialEpsilon)

currentEpsilon = initialEpsilon;
arrayOfReward = [];
sumOfEachRewards = 0;


for i = 1:numOfEpisodes
    
    counter = 0;
    sumOfEachRewards = 0;
    currentState = initialState;
    while isequal(currentState,finalState) == 0
        counter = counter + 1;
        policyChoosenAction = policy( qTable , currentState , currentEpsilon);
        %find the reward of the state
        rewardIndex = find(rewardedStates(:,1) == policyChoosenAction);
        
        if isempty(rewardIndex) == 1
            reward = 0;
        elseif isempty(rewardIndex) == 0
            %if rewardIndex<3
%             fprintf('plicy %d\n',policyChoosenAction);            
%             fprintf('reward %d\n',rewardIndex);
            reward = rewardedStates(rewardIndex,2); 
           % end
        end
        nextState = qTable(policyChoosenAction,7:12); 
        
        %find next state max
        %getting all possible actions for next state from qTable
        possibleMoves = find(qTable(:, 1) == nextState(1,1) & qTable(:, 2) == nextState(1,2) ...
            & qTable(:, 3) == nextState(1,3) & qTable(:, 4) == nextState(1,4) ...
            & qTable(:, 5) == nextState(1,5) & qTable(:, 6) == nextState(1,6));
        %concat value of possible moves
        [numOfPossibleMoves , l] = size(possibleMoves);
        qValues = [];
        for i = 1:numOfPossibleMoves
            qValues = [qValues ; qTable(possibleMoves(i),13)];
        end
        [val, idx] = max(qValues);
        nextStateBestAction = possibleMoves(idx,1);
        
        %q value update
        qTable(policyChoosenAction,13) = qTable(policyChoosenAction,13) + learningRate * ...
            (reward + discountFactor * qTable(nextStateBestAction,13) - qTable(policyChoosenAction,13));
        
        %moving to next state
        currentState = nextState;
        %acumulating reward at the end of state
        sumOfEachRewards = sumOfEachRewards + reward;
%         if counter == 100
%             break;
%         end
    end
    arrayOfReward = [arrayOfReward counter];
    currentEpsilon = epsilonGreedy(currentEpsilon);
end
plot(arrayOfReward);

end


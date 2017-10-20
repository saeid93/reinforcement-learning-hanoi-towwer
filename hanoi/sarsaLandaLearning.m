function qTable = sarsaLandaLearning(qTable , rewardedStates , learningRate , discountFactor , ...
    numOfEpisodes , initialState , finalState , initialEpsilon , landa)

currentEpsilon = initialEpsilon;
arrayOfReward = [];
sumOfEachRewards = 0;



for i = 1:numOfEpisodes
%     fprintf('episode: %d\n',i);
    counter = 0;
    sumOfEachRewards = 0;
    currentState = initialState;
    %array that holds the previous states
    previousStates = [];
    policyChoosenAction = policy( qTable , currentState , currentEpsilon);
    while isequal(currentState,finalState) == 0

        %add the start state to the states
        previousStates = [previousStates policyChoosenAction];
        
        counter = counter + 1;
        %policyChoosenAction = policy( qTable , currentState , currentEpsilon);
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
        %find next state after state
        afterStatePolicyChoosenAction = policy( qTable , nextState , currentEpsilon);
        %computing delta of the formula
        delta = reward + discountFactor * qTable(afterStatePolicyChoosenAction,13) - qTable(policyChoosenAction,13); 
        %increment Z of current state by one
        qTable(policyChoosenAction,14) = qTable(policyChoosenAction,14) + 1;
        
%----------------------------------  
        [l sizeOfPreviousStates] = size(previousStates);
        for j = 1:sizeOfPreviousStates
            qTable(previousStates(1,j),13) = qTable(previousStates(1,j),13) + learningRate * ...
                delta * qTable(previousStates(1,j),14);
            qTable(previousStates(1,j),14) = learningRate * landa * qTable(previousStates(1,j),14); 
            
        end


        
        %q value update
%         qTable(policyChoosenAction,13) = qTable(policyChoosenAction,13) + learningRate * ...
%             (reward + discountFactor * qTable(afterStatePolicyChoosenAction,13) - qTable(policyChoosenAction,13));
%         
        %moving to next state
        currentState = nextState;
        %moving to next action
        policyChoosenAction = afterStatePolicyChoosenAction;
        
        %acumulating reward at the end of state
        sumOfEachRewards = sumOfEachRewards + reward;
        if counter == 500
            break;
        end
    end
    arrayOfReward = [arrayOfReward counter];
    currentEpsilon = epsilonGreedy(currentEpsilon);
end
plot(arrayOfReward);

end


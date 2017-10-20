function qTable = sarsaLearning(qTable , rewardedStates , learningRate , discountFactor ...
    , numOfEpisodes , initialState , finalState , initialEpsilon)

currentEpsilon = initialEpsilon;
arrayOfReward = [];
sumOfEachRewards = 0;



for i = 1:numOfEpisodes
    
    counter = 0;
    sumOfEachRewards = 0;
    currentState = initialState;
    policyChoosenAction = policy( qTable , currentState , currentEpsilon);
    while isequal(currentState,finalState) == 0
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
        
        %q value update
        qTable(policyChoosenAction,13) = qTable(policyChoosenAction,13) + learningRate * ...
            (reward + discountFactor * qTable(afterStatePolicyChoosenAction,13) - qTable(policyChoosenAction,13));
        
        %moving to next state
        currentState = nextState;
        %moving to next action
        policyChoosenAction = afterStatePolicyChoosenAction;
        
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


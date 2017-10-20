function qTable = monteCarlo(qTable , rewardedStates , learningRate , discountFactor , ...
    numOfEpisodes , initialState , finalState , initialEpsilon)

currentEpsilon = initialEpsilon;
arrayOfReward = [];
sumOfEachRewards = 0;
arrayOfReturns = [];
episode = [];
episodeNumber = 0;
states = stateGenerator;
[numOfStates , l] = size(states);
reward = 500;
counterOfGoal = 0;
for i = 1:numOfEpisodes
    episode = [];
    counter = 0;
    sumOfEachRewards = 0;
    episode = [];
    intialStateIndex = randi([1 numOfStates]);
    initialState = states(intialStateIndex,:);
    currentState = initialState;
    
    treshHold = 500;
    %generating arbitary episode
    while isequal(currentState,finalState) == 0 && counter ~= treshHold
        counter = counter + 1;
        policyChoosenAction = policy( qTable , currentState , currentEpsilon);
        nextState = qTable(policyChoosenAction,7:12);
        episode = [episode ; currentState nextState];
        currentState = nextState;
    end
%     fprintf('episode number %d \n',i);
%     fprintf('length of episode: %d \n',counter);
    [sizeOfEpisode , l] = size(episode);
    %we didn't reach the final state
    if(sizeOfEpisode == treshHold)
        for j = 1:sizeOfEpisode
            indexToBeUpdated = find(qTable(:, 1) == episode(j,1) & qTable(:, 2) == episode(j,2) ...
            & qTable(:, 3) == episode(j,3) & qTable(:, 4) == episode(j,4) ...
            & qTable(:, 5) == episode(j,5) & qTable(:, 6) == episode(j,6) ...
            & qTable(:, 7) == episode(j,7) & qTable(:, 8) == episode(j,8) ...
            & qTable(:,9) == episode(j,9)  & qTable(:, 10) == episode(j,10) ... 
            & qTable(:, 11) == episode(j,11) & qTable(:, 12) == episode(j,12));
%             fprintf('%d\n',i);
            qTable(indexToBeUpdated, 15) = qTable(indexToBeUpdated, 15) + 1;
            qTable(indexToBeUpdated, 13) = (qTable(indexToBeUpdated, 13) * qTable(indexToBeUpdated, 15)) / (qTable(indexToBeUpdated, 15)+1); 
        end
        %reached the final state
    else
%         fprintf('goal reached!\n');
counterOfGoal = counterOfGoal + 1;
        for j = 1:sizeOfEpisode
            indexToBeUpdated = find(qTable(:, 1) == episode(j,1) & qTable(:, 2) == episode(j,2) ...
                & qTable(:, 3) == episode(j,3) & qTable(:, 4) == episode(j,4) ...
                & qTable(:, 5) == episode(j,5) & qTable(:, 6) == episode(j,6) ...
                & qTable(:, 7) == episode(j,7) & qTable(:, 8) == episode(j,8) ...
                & qTable(:,9) == episode(j,9)  & qTable(:, 10) == episode(j,10) ...
                & qTable(:, 11) == episode(j,11) & qTable(:, 12) == episode(j,12));
            qTable(indexToBeUpdated, 15) = qTable(indexToBeUpdated, 15) + 1;
            qTable(indexToBeUpdated, 13) = (qTable(indexToBeUpdated, 13) * qTable(indexToBeUpdated, 15) + reward) / (qTable(indexToBeUpdated, 15)+1); 
        end
    end
%     fprintf('---------------\n');
    arrayOfReward = [arrayOfReward counter];
%     currentEpsilon = epsilonGreedy(currentEpsilon);
    
end
fprintf('goal reached %d\n', counterOfGoal);

end


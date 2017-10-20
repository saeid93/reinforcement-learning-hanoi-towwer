function policyChoosenAction = policy( qTable , currentState , epsilon)
%randomness is optimized by epsilon

%getting all possible actions from qTable
possibleMoves = find(qTable(:, 1) == currentState(1,1) & qTable(:, 2) == currentState(1,2) ... 
    & qTable(:, 3) == currentState(1,3) & qTable(:, 4) == currentState(1,4) ...
    & qTable(:, 5) == currentState(1,5) & qTable(:, 6) == currentState(1,6));
%concat value of possible moves
[numOfPossibleMoves , l] = size(possibleMoves);
qValues = [];
for i = 1:numOfPossibleMoves
    qValues = [qValues ; qTable(possibleMoves(i),13)];
end
%choosing whether the action should be random or max
randomOrMax = randomOrMaxActionChooser(epsilon);
%max
if randomOrMax == 1
    [val, idx] = max(qValues);
    policyChoosenAction = possibleMoves(idx,1);
%random
elseif randomOrMax == 0
    policyChoosenAction = softmax( qTable , possibleMoves);
    policyChoosenAction = possibleMoves(randperm(numOfPossibleMoves,1),1);
end
end


function policyChoosenAction = softmax( qTable , possibleMoves)
%SOFTMAX Summary of this function goes here
%   Detailed explanation goes here
temperature = 0.5;
possibleMovesQ = [];
[numOfPossibleMoves , l] = size(possibleMoves);
for i = 1:numOfPossibleMoves
    possibleMovesQ = [possibleMovesQ qTable(i,13)];
end
softMaxSum = sum( exp(possibleMovesQ)/temperature );
softMaxProbabilities = possibleMovesQ/softMaxSum;
policyChoosenAction = randsample(possibleMoves,1,true,softMaxProbabilities);
end


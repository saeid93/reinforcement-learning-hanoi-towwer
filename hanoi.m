clear;
qTable = qTableGenerator;
rewardedStates = rewardedMovesRewardAssigner(qTable);

%setting learning parameters
learningRate = 0.5;
discountFactor = 0.5;
initialEpsilon = 1;
numOfEpisodes = 1000;
landa = 0.5;
initialState = [1 1 1 1 1 1];
finalState = [3 3 3 3 3 3];
%choosing type of algorithm
% 1 -> qlearning
% 2 -> sarsa
% 3 -> sarsa landa
choose = input('choose the type of learning\n1.qlearning\n2.sarsa\n3.sarsa landa learning\n4.monte carlo\n');
if choose == 1
    fprintf('\nlearning...\n');
    qTable = qLearning(qTable , rewardedStates , learningRate , discountFactor , numOfEpisodes , initialState , finalState , initialEpsilon);
    cache = input('learning has been finished press any key to test the agent\n');
    learningTest(qTable , initialState , finalState);
elseif choose == 2
    fprintf('\nlearning...\n');
    qTable = sarsaLearning(qTable , rewardedStates , learningRate , discountFactor , numOfEpisodes , initialState , finalState , initialEpsilon);
    cache = input('learning has been finished press any key to test the agent\n');
    learningTest(qTable , initialState , finalState);
elseif choose == 3
    fprintf('\nlearning...\n');
    qTable = sarsaLandaLearning(qTable , rewardedStates , learningRate , discountFactor , numOfEpisodes , initialState , finalState , initialEpsilon , landa);
    cache = input('learning has been finished press any key to test the agent\n');
    learningTest(qTable , initialState , finalState);
elseif choose == 4
    fprintf('\nlearning...\n');
    qTable = monteCarlo (qTable , rewardedStates , learningRate , discountFactor ,numOfEpisodes , initialState , finalState , initialEpsilon);
    cache = input('learning has been finished press any key to test the agent\n');
    learningTest(qTable , initialState , finalState);
end

i=1;
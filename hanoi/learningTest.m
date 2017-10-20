function qLearningTest(qTable , initialState , finalState)

counter = 1;
currentState = initialState;
while isequal(currentState,finalState) == 0
    policyChoosenAction = policy( qTable , currentState , 0);
    nextState = qTable(policyChoosenAction,7:12);
    
    
    
    %moving to next state
    fprintf('number of move: %d\n',counter);
    
    
    firstRod = [];
    secondRod = [];
    thirdRod = [];
    for i = 6:-1:1
        if currentState(1,i) == 1
            firstRod = [i firstRod];
        elseif currentState(1,i) == 2
            secondRod = [i secondRod];
        elseif currentState(1,i) == 3
            thirdRod = [i thirdRod];
        end
    end
    [l sizeofirstRod] = size(firstRod);
    [l sizeofSecondRod] = size(secondRod);
    [l sizeofThirdRod] = size(thirdRod);
    firstRod = [zeros(1,6-sizeofirstRod) firstRod];
    secondRod = [zeros(1,6-sizeofSecondRod) secondRod];
    thirdRod = [zeros(1,6-sizeofThirdRod) thirdRod];
    
    firstRod = firstRod';
    secondRod = secondRod';
    thirdRod = thirdRod';
    
    honoi = [firstRod secondRod thirdRod];
    
    firstRod = [];
    secondRod = [];
    thirdRod = [];
    for i = 6:-1:1
        if nextState(1,i) == 1
            firstRod = [i firstRod];
        elseif nextState(1,i) == 2
            secondRod = [i secondRod];
        elseif nextState(1,i) == 3
            thirdRod = [i thirdRod];
        end
    end
    [l sizeofirstRod] = size(firstRod);
    [l sizeofSecondRod] = size(secondRod);
    [l sizeofThirdRod] = size(thirdRod);
    firstRod = [zeros(1,6-sizeofirstRod) firstRod];
    secondRod = [zeros(1,6-sizeofSecondRod) secondRod];
    thirdRod = [zeros(1,6-sizeofThirdRod) thirdRod];
    
    firstRod = firstRod';
    secondRod = secondRod';
    thirdRod = thirdRod';

    
    honoi = [honoi firstRod secondRod thirdRod];
    honoi = [honoi ; [-1 -1 -1 -1 -1 -1]];
    
    for i = 1:7
        for j = 1:6
            if honoi(i,j) == 0
                fprintf('  ');
            elseif honoi(i,j) == -1
                fprintf('- ');
            else
                fprintf('%d ',honoi(i,j));
            end
            if j == 3 && i ~= 6
               fprintf('           '); 
            end
            if j == 3 && i == 6
                fprintf('  ----->   ');
            end
        end
        fprintf('\n');
    end

%     for i = 1:6
%         fprintf('%d ',nextState(1,i));
%     end
    fprintf('\n');
    
    counter = counter + 1;
    currentState = nextState;
end
end

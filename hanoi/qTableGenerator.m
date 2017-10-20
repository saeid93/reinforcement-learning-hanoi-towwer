function qtable = qTableGenerator
%in order to produce qTable we need run state generator
%to have the states at the first place
states = stateGenerator;
[numOfStates,l] = size(states);
%we keep the state that we want to  find transitions from that
tempOriginState = [];
tempDestination = [];
actions = [];
for i = 1:numOfStates
    %get the origin
    tempOriginState = states(i,:);
    for j = 1:6
        numOfCurrentStateUpperDisk = 0;
        numOfNextStateUnderDisk = 0;
        if tempOriginState(1,j) == 1
            for k = 1:(j-1)
                if tempOriginState(1,k) == 1
                    numOfCurrentStateUpperDisk = numOfCurrentStateUpperDisk + 1;
                end
            end
            if numOfCurrentStateUpperDisk == 0
                %going to 2
                numOfNextStateUnderDisk = 0;
                for k = 1:(j-1)
                    if tempOriginState(1,k) == 2
                        numOfNextStateUnderDisk = numOfNextStateUnderDisk + 1;
                    end
                end
                if numOfNextStateUnderDisk == 0
                    tempDestination = tempOriginState;
                    tempDestination(1,j) = 2;
                    actions = [actions ; tempOriginState tempDestination];
                end
                %going to 3
                numOfNextStateUnderDisk = 0;
                for k = 1:(j-1)
                    if tempOriginState(1,k) == 3
                        numOfNextStateUnderDisk = numOfNextStateUnderDisk + 1;
                    end
                end
                if numOfNextStateUnderDisk == 0
                    tempDestination = tempOriginState;
                    tempDestination(1,j) = 3;
                    actions = [actions ; tempOriginState tempDestination];
                end
            end
        elseif tempOriginState(1,j) == 2
            numOfCurrentStateUpperDisk = 0;
            for k = 1:(j-1)
                if tempOriginState(1,k) == 2
                    numOfCurrentStateUpperDisk = numOfCurrentStateUpperDisk + 1;
                end
            end
            if numOfCurrentStateUpperDisk == 0
                %going to 1
                numOfNextStateUnderDisk = 0;
                for k = 1:(j-1)
                    if tempOriginState(1,k) == 1
                        numOfNextStateUnderDisk = numOfNextStateUnderDisk + 1;
                    end
                end
                if numOfNextStateUnderDisk == 0
                    tempDestination = tempOriginState;
                    tempDestination(1,j) = 1;
                    actions = [actions ; tempOriginState tempDestination];
                end
                %going to 3
                numOfNextStateUnderDisk = 0;
                for k = 1:(j-1)
                    if tempOriginState(1,k) == 3
                        numOfNextStateUnderDisk = numOfNextStateUnderDisk + 1;
                    end
                end
                if numOfNextStateUnderDisk == 0
                    tempDestination = tempOriginState;
                    tempDestination(1,j) = 3;
                    actions = [actions ; tempOriginState tempDestination];
                end
            end
        elseif tempOriginState(1,j) == 3
            numOfCurrentStateUpperDisk = 0;
            for k = 1:(j-1)
                if tempOriginState(1,k) == 3
                    numOfCurrentStateUpperDisk = numOfCurrentStateUpperDisk + 1;
                end
            end
            
            if numOfCurrentStateUpperDisk == 0
                %going to 2
                numOfNextStateUnderDisk = 0;
                for k = 1:(j-1)
                    if tempOriginState(1,k) == 2
                        numOfNextStateUnderDisk = numOfNextStateUnderDisk + 1;
                    end
                end
                if numOfNextStateUnderDisk == 0
                    tempDestination = tempOriginState;
                    tempDestination(1,j) = 2;
                    actions = [actions ; tempOriginState tempDestination];
                end
                %going to 1
                numOfNextStateUnderDisk = 0;
                for k = 1:(j-1)
                    if tempOriginState(1,k) == 1
                        numOfNextStateUnderDisk = numOfNextStateUnderDisk + 1;
                    end
                end
                if numOfNextStateUnderDisk == 0
                    tempDestination = tempOriginState;
                    tempDestination(1,j) = 1;
                    actions = [actions ; tempOriginState tempDestination];
                end
            end
        end
        
    end
end

[numOfActions,l] = size(actions);
%column 1 to 6 --> start state
%column 6 to 12 --> destenation state
%column 13 --> q values
%column 14 --> eligibility traces
%column 15 --> counter for mont carlo
qtable = [actions ones(numOfActions,1) zeros(numOfActions,1) zeros(numOfActions,1)];

end
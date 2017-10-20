function states = stateGenerator
%template state that is going to
templateState = [];
%states that used used as template to make the whole states
templateStates = [];
%whole states
states = [];
%3 nested for's in order to make template states
for i = 6:-1:0
    for j = 6-i:-1:0
        for k = 6-i-j:-1:0
            if i+j+k == 6
                templateState = [templateState ones(1,i)];
                templateState = [templateState ones(1,j)*2];
                templateState = [templateState ones(1,k)*3];
                templateStates = [templateStates ; templateState];
                templateState = [];
            end
        end
    end
end
%find the number of template states
[numOfTemplateStates , l] = size(templateStates);
%choosen template state as the blue print
tempTemplateState = [];
%temp generated states from blueprint to be added to states
tempGeneratedStates = [];
for i = 1:numOfTemplateStates
    tempTemplateState = templateStates(i,:);
    tempGeneratedStates = unique(perms(tempTemplateState),'rows');
    states = [states ; tempGeneratedStates];
end
end
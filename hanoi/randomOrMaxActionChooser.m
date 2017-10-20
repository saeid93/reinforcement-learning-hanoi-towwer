function randomOrMax = randomOrMaxActionChooser(epsilon)

%max = 1
%random = 0
randomNumber = rand;
if randomNumber > epsilon
    randomOrMax = 1;
else
    randomOrMax = 0;
end
    
end


function KPTest_OZTHapproachWZTH()

% as OZ approaches WZ threshold, what happens

%deltaOZ = [10 5 1]; nW = length(deltaOZ);
deltaOZ = [4 3 2 1]; nW = length(deltaOZ);

F = figure;
title('changing OZ to approach WZ'); 
xlabel('Time At Quit'); 
ylabel('SunkCostNess: S slope - C slope');
hold on

L = cell(nW,1);
for iW = 1:nW    
    R = GenerateKepecsTest('offerEnterFunction', @(x)x>-deltaOZ(iW));
    pEarn = CalculateKepecs_pEarn(R);
    [S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);
    
    figure; KPShow_OffersTaken(R); title(sprintf('OZ = WZ + %d', deltaOZ(iW)));
    figure; KPShow_SunkCostSlopes(S,R); title(sprintf('OZ = WZ + %d', deltaOZ(iW)));

    figure(F);
    L{iW} = sprintf('OZ threshold = WZ threshold + %d', deltaOZ(iW));
    plot(1:max(R.offer), S(:,1)-C(:,1), 'o-');
    drawnow;
end
legend(L);

end
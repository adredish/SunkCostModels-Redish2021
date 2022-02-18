function KPTest_DecisionTimeWZ()

% KPTest Delayed Start
% if delay start by Xs, what happens?
% KEPECS finds that increased delay to count decreases sunk costs.
% (==> KD should be > RD?, compare Duin 2021)

decisionTimeWZ = [0,3,5,8];  nD = length(decisionTimeWZ);

hF = figure;
title('Changing delay to start'); 
xlabel('Time Spent (s)'); 
ylabel('SunkCostNess: \Delta(slope)');
hold on

L = cell(nD,1);
for iD = 1:nD
    R = GenerateKepecsTest('decisionTimeWZ', decisionTimeWZ(iD));
    pEarn = CalculateKepecs_pEarn(R);
    [S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);
    
    figure; KPShowAttritionBias(R); 
    
    figure(hF);
    L{iD} = sprintf('\\sigma_n=0 for %d s', decisionTimeWZ(iD));
    plot(1:max(R.offer), S(:,1)-C(:,1), '.-');
    drawnow;
end
legend(L);
KPFigureLayout

%%
figure
clf; title('Changing delay to start'); 
xlabel('Time Spent (s)'); 
ylabel('SunkCostNess: \Delta(slope)');
hold on

L = cell(nD,1);
for iD = 1:nD
    R = GenerateKepecsTest('hardDecisionTimeWZ', decisionTimeWZ(iD),  'offerEnterFunction', @(x)ones(size(x)));
    pEarn = CalculateKepecs_pEarn(R);
    [S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);

    L{iD} = sprintf('T_{WZ}=0 for %d s', decisionTimeWZ(iD));
    plot(1:max(R.offer), S(:,1)-C(:,1), '.-');
    drawnow;
end
legend(L);
KPFigureLayout;
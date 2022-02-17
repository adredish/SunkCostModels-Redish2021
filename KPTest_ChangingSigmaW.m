function KPTest_ChangingSigmaW()

% KPTest Changing Sigma W
% if change W slope , what happens?
% KEPECS finds 

sigmaW = [8 5 3 1 0.5 0.25 0]; nW = length(sigmaW);

F = figure; clf; 
title('changing \sigma_W'); 
xlabel('Time Spent (s)'); 
ylabel('SunkCostNess: \Delta(slope)');
hold on

L = cell(nW,1);
for iW = 1:nW    
    fprintf('--- SigmaW = %.2f\n', sigmaW(iW));

    R = GenerateKepecsTest('sigmaW', sigmaW(iW));
    pEarn = CalculateKepecs_pEarn(R);
    [S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);
    
    figure;  
    KPShow_pEarn(pEarn, R); %KPShow_SunkCostSlopes(S,R); 
    title(sprintf('\\sigma_W = %.2f', sigmaW(iW)));
    KPFigureLayout

    figure;
    KPShowAttritionBias(R);    

    figure(F)
    L{iW} = sprintf('\\sigma_W = %.2f', sigmaW(iW));
    plot(1:max(R.offer), S(:,1)-C(:,1), '.-');
    drawnow;
end

legend(L, 'location', 'southeast');
KPFigureLayout


end
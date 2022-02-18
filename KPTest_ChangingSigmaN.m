function KPTest_ChangingSigmaN()

% KPTest Changing Sigma N
% if change N slope , what happens?
% KEPECS finds 

sigmaN = [5 3 1 0]; nW = length(sigmaN);

F = figure;
title('changing \sigma_N'); 
xlabel('Time Spent (s)'); 
ylabel('Sunk Sensitivity: \Delta(slope)');
hold on

L = cell(nW,1);
for iW = 1:nW    
    fprintf('--- SigmaN = %d\n', sigmaN(iW));
    R = GenerateKepecsTest('sigmaN', sigmaN(iW));
    pEarn = CalculateKepecs_pEarn(R);
    [S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);
    
    figure;  
    KPShow_pEarn(pEarn, R); %KPShow_SunkCostSlopes(S,R); 
    title(sprintf('\\sigma_N = %d', sigmaN(iW)));
    KPFigureLayout

    figure;
    KPShowAttritionBias(R);    
    title(sprintf('\\sigma_N = %d', sigmaN(iW)));

    figure(F);
    L{iW} = sprintf('\\sigma_N = %d', sigmaN(iW));
    plot(1:max(R.offer), S(:,1)-C(:,1), '.-');
    drawnow;
    

end

legend(L, 'location', 'northwest');
KPFigureLayout


end
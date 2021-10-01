function KPTest_ChangingW()

% KPTest Changing W
% if change W starting point relative to threshold, what happens?
% KEPECS finds that increased W > threshold decreases sunk costs.
% (==> Hungrier rats show lower sunk costs?, compare Sweis thesis 4.17)

sigmaW = 5;
%hungerW = [-8, -5, -3, 0, 3, 5, 8];  nW = length(hungerW);
%hungerW = [0, 3, 5, 8];  nW = length(hungerW);
hungerW = [-8, -5, -3, 0];  nW = length(hungerW);

fd = 'c:\Users\adredish\Desktop';

F = figure; clf;
title('changing hunger'); 
xlabel('Time At Quit'); 
ylabel('SunkCostNess: S slope - C slope');
hold on
L = cell(nW,1);
for iW = 1:nW
    R = GenerateKepecsTest('hungerW', hungerW(iW), 'sigmaW', sigmaW);
    pEarn = CalculateKepecs_pEarn(R);
    %[S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);
    figure; KPShow_pEarn(pEarn, R);
    drawnow; saveas(gcf, fullfile(fd, [num2str(iW) '-pEarn.jpg']));
    [S0,C0] = CalculateKepecs_SunkCostMeans(pEarn,R);
    figure; KPShow_SunkCostArea(S0,C0,R,'means');
    drawnow; saveas(gcf, fullfile(fd, [num2str(iW) '-SC.jpg']));

%     figure; KPShow_OffersTaken(R); title(sprintf('hungerW = %d', hungerW(iW)));
%     figure; KPShow_SunkCostSlopes(S,R); title(sprintf('hungerW = %d', hungerW(iW)));

    figure(F)
    L{iW} = sprintf('W = TH + %.0f', hungerW(iW));
    plot(1:max(R.offer), S0(:,1)-C0(:,1), 'o-');
    title('Changing hunger');
    drawnow;
end
legend(L);

end
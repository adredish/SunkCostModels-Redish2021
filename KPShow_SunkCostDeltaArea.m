function KPShow_SunkCostDeltaArea(S,C,R)

maxD = max(R.offer);

plot(1:maxD, S(:,1)-C(:,1), 'ko-');
xlabel('Time At Quit');
ylabel('SunkCost slopes - control');
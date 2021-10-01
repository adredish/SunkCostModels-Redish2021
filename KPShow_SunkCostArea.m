function KPShow_SunkCostArea(S,C,R, T)

maxD = max(R.offer);

clf;
hold on
plot(1:maxD, S(:,1), 'bp', 1:maxD, C(:,1), 'ko');
legend('data', 'controls','Location', 'southeast');
xlabel('Time Spent (s)');
ylabel(T);

KPFigureLayout();
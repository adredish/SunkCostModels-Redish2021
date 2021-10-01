function KPShow_SunkCostSlopes(S, R)

maxD = max(R.offer);

clf; hold on;
c = KPColorMap(maxD);

TSQs = [1:5 10:5:(maxD-1)];
% calculate slopes
for iTSQ = TSQs
    maxTSQ = maxD-iTSQ+1;
    h = plot(1:maxTSQ,polyval(S(iTSQ,:),1:maxTSQ));
    set(h, 'color', c(iTSQ,:));
end
legend off
xlabel('Time remaining');
ylabel('p(Earn)');
ylim([0 1]);
set(gca, 'yTick', [0 1]);
legend(arrayfun(@(x) sprintf('%.0fs invested', x), TSQs, 'UniformOutput', false), ...
    'Location', 'southwest');

KPFigureLayout

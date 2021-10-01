function KPShow_pEarn(pEarn, R)
maxD = max(R.offer);

clf; hold on;
c = KPColorMap(maxD);

TSQs = [1:5 10:5:(maxD-1)];
% calculate slopes
for iTSQ = TSQs
    h = plot(1:maxD,pEarn(iTSQ,:), 'o');
    set(h, 'color', c(iTSQ,:));
end
legend off

xlabel('Time remaining (s)');
ylabel('p(Earn)');
yticks([0 1]);
ylim([0 1]);
legend(arrayfun(@(x) sprintf('%.0fs invested', x), TSQs, 'UniformOutput', false), ...
    'Location', 'southwest');

KPFigureLayout


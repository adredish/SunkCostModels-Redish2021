function KPShow_pEarnXvalue(PEV)

clf;
[V, TSQ] = ndgrid(PEV.values, 1:30);
scatter(V(:), PEV.pEarnV(:), 10, TSQ(:))
hold on;
colormap(KPColorMap(30));
line([0 0], ylim, 'color', 'k', 'LineWidth', 2);
xlabel('value');
ylabel('p(Earn)');

c = KPColorMap(30);
h = []; L = {};
for iC = 1:3:30
    L{end+1} = sprintf('%d s invested', iC);
   h(end+1) = plot(nan, nan, 'o', 'color', c(iC,:));
end

legend(h, L, 'location', 'southeast');


KPFigureLayout


function KPFigureLayout()


set(gca, 'fontname', 'Helvetica', 'FontSize', 18);

L = get(gca, 'legend');
if ~isempty(L)
    set(L, 'fontname', 'Helvetica', 'FontSize', 12);
end
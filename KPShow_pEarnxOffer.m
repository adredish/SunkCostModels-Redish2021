function KPShow_pEarnxOffer(H)

clf
c = jet(30);
for iO = 1:30
    subplot(211); hold on;
    plot(1:30, H(iO,:), 'o-', 'color', c(iO,:));    

    subplot(212); hold on;
    plot(1:29, diff(H(iO,:)), 'o-', 'color', c(iO,:));
end

subplot(211); KPFigureLayout; 
ylabel('pEarn');
set(gca, 'xtick', [1 10 20 30], 'ytick', [0.5 1], ...
    'xlim', [1 30], 'ylim', [0.5 1]);

colormap jet; C = colorbar; caxis([1 30]); C.Ticks = [1 30]; ylabel(C,'offer(s)');

subplot(212); KPFigureLayout; 
colormap jet; C = colorbar; caxis([1 30]); C.Ticks = [1 30]; ylabel(C,'offer(s)');
set(gca, 'xtick', [1 10 20 30], 'ytick', [0 0.1], ...
    'xlim', [1 30], 'ylim', [0 0.12]);
ylabel('d(pEarn)/dt');
xlabel('Time spent');


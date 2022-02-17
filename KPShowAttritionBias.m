function H = KPShowAttritionBias(R)

assert(all(isnan(R.isEarn)==isnan(R.isQuit)));
k = isnan(R.isEarn);
R.isEarn(k) = false; R.isQuit(k) = false; R.TSQ(k) = -5;

H = nan(30,40);
mu = nan(30,1);
se = nan(30,1);

for iTS = 1:30
    stillAt = ~k & (R.isEarn & (R.offer > iTS)) | (R.isQuit & (R.TSQ > iTS));
    H(iTS,:) = histcounts(R.W0(stillAt),0.5:1:40.5);
    H(iTS,:) = H(iTS,:) ./ sum(H(iTS,:), 'omitnan');
    mu(iTS) = mean(R.W0(stillAt));
    se(iTS) = nanstderr(R.W0(stillAt));
end

clf;
imagesc(H');
axis xy
hold on;
errorbar(1:30, mu, se, 'k');
xlabel('TimeSpent');
ylabel('W0');

caxis([0 0.1]);
C = colorbar;
ylabel(C, 'proportion');
C.Ticks = [0 0.1];

set(gca, 'fontname', 'Helvetica', 'FontSize', 18);

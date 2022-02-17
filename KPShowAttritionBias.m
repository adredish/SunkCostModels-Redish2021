function H = KPShowAttritionBias(R)

assert(all(isnan(R.isEarn)==isnan(R.isQuit)));
k = ~isnan(R.isEarn);  

H = nan(30,30);
mu = nan(30,1);
se = nan(30,1);

for iTS = 1:30
    stillAt = (R.isEarn(k) & (R.offer(k) > iTS)) | (R.isQuit(k) & (R.TSQ(k) > iTS));
    H(iTS,:) = histcounts(R.W0(stillAt),0.5:1:30.5);
    H(iTS,:) = H(iTS,:) ./ sum(H(iTS,:));
    mu(iTS) = mean(R.W0(stillAt));
    se(iTS) = nanstderr(R.W0(stillAt));
end

clf;
imagescWnan(H');
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



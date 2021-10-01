function KPShow_OffersTaken(R)

subplot(2,1,1);
Hmu = accumarray(R.offer, R.isStay, [], @nanmean, nan);
Hse = accumarray(R.offer, R.isStay, [], @nanstderr, nan);
ShadedErrorbar(R.delayRange, Hmu, Hse, 'color', 'b');
xlabel('Offer (s)');
ylabel('p(Accept)'); ylim([0 1]);
KPFigureLayout
line(R.threshold*[1 1], ylim, 'color', 'k');

subplot(2,1,2);
Hmu = accumarray(R.offer, R.isQuit, [], @nanmean, nan);
Hse = accumarray(R.offer, R.isQuit, [], @nanstderr, nan);
ShadedErrorbar(R.delayRange, Hmu, Hse, 'color', 'r');
xlabel('Offer (s)');
ylabel('p(Quit | Accept)'); ylim([0 1]);
KPFigureLayout
line(R.threshold*[1 1], ylim, 'color', 'k');





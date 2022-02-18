function H = CalculateKepecs_pEarnxOffer(R)

k = isnan(R.isEarn);
R.isEarn(k) = false; R.isQuit(k) = false; R.TSQ(k) = -5;

H = nan(30,30);

for iO = 1:30
    for iTS = 1:iO
        stillAt = R.isStay & R.offer==iO & ((R.isEarn & (R.offer >= iTS)) | (R.isQuit & (R.TSQ > iTS)));
        H(iO, iTS) = mean(R.isEarn(stillAt));
    end
end


end

    
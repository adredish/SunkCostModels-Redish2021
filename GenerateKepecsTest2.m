function R = GenerateKepecsTest2(varargin)

fprintf('Generating Kepecs Test...');

% --- parameters

% world
nOffers = 1e6;
maxOffer = 30;
varargin = process_varargin(varargin);

delayRange = 1:maxOffer; 

% agent
threshold = 18;
sigmaW = 5;
sigmaN = 3;
quitThresholdStartFactor = 1.0; 
quitThresholdSlope = 1.0;

% constant pQuit
prob_Use_pQuitFunction = 0;
pQuitFunction = [];  % to make an explicit pQuit function, use 1 input of offer length, so constant pquit = @(x)0.05

% offer enter function
offerEnterFunction = @(x)x > 0;

% delay to start
decisionTimeWZ = 0;
hardDecisionTimeWZ = 0;
hungerW = 0;
varargin = process_varargin(varargin);
nomore_varargins(varargin);

% Stay/Skip
offer = ceil(rand(nOffers,1)*maxOffer);
W0 = threshold + randn(nOffers,1) * sigmaW + hungerW;

isStay = offerEnterFunction(W0-offer);
isSkip = ~isStay;

% Earn/Quit
isQuit = nan(size(offer));
isEarn = nan(size(offer));
TSQ = nan(size(offer));  % time spent at quit
TRQ = nan(size(offer));  % time remaining at quit

for iO = 1:nOffers
    if isStay(iO)
        W1 = W0(iO);
        for iT = offer(iO):-1:0
            W1 = W1 + randn*sigmaN;
            if W1 < iT % quit
                isQuit(iO) = true; isEarn(iO) = false;
                TSQ(iO) = iT; TRQ(iO) = offer(iO) - iT;
                break;
            end                
        end
        if iT == 0
            isQuit(iO) = false; isEarn(iO) = true;
        end
    end
end

% package
R.offer = offer;
R.isStay = isStay;
R.isSkip = isSkip;
R.delayRange = delayRange;
R.threshold = threshold;
R.sigmaW = sigmaW;
R.sigmaN = sigmaN;

R.isQuit = isQuit;
R.isEarn = isEarn;
R.TSQ = TSQ;
R.TRQ = TRQ;

R.W0 = W0;

fprintf('DONE.\n');
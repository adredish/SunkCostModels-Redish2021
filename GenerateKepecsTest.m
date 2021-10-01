function R = GenerateKepecsTest(varargin)

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
        if ~isempty(pQuitFunction) && rand < prob_Use_pQuitFunction
            quitThreshold = pQuitFunction(offer(iO));
            W1 = rand(1,offer(iO));
        else % use Kepecs model
            quitThreshold = quitThresholdStartFactor * offer(iO) - quitThresholdSlope * (0:(offer(iO)-1));
            dW = cumsum(randn(size(quitThreshold))*sigmaN);
            
            dW(1:min(decisionTimeWZ, length(dW))) = 0;
            
            quitThreshold(1:min(hardDecisionTimeWZ, length(dW))) = 0;
            
            W1 = W0(iO) + dW;
        end
        f = find(W1 < quitThreshold, 1, 'first');

        if isempty(f)
            isQuit(iO) = false; isEarn(iO) = true;
        else
            isQuit(iO) = true; isEarn(iO) = false;
            TSQ(iO) = f; TRQ(iO) = offer(iO) - f;
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
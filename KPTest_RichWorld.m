function KPTest_RichWorld()

% rich world
% Sweis 2018 thesis / PLoS Biology
% what if all offers < W?

clear; close all;

R = GenerateKepecsTest('maxOffer', 15, 'sigmaW', 0);
figure; KPShow_OffersTaken(R); title('maxOffer=15, sigmaW=0');

pEarn = CalculateKepecs_pEarn(R);
[S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);
figure; KPShow_SunkCostSlopes(S,R); title('maxOffer=15, sigmaW=0');
figure; KPShow_SunkCostArea(S,C,R); title('maxOffer=15, sigmaW=0');
figure; KPShow_pEarn(pEarn, R); title('maxOffer=15, sigmaW=0');

%%
R = GenerateKepecsTest('maxOffer', 15, 'sigmaW', 3);
figure; KPShow_OffersTaken(R); title('maxOffer=15, sigmaW=3');

pEarn = CalculateKepecs_pEarn(R);
[S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);
figure; KPShow_SunkCostSlopes(S,R); title('maxOffer=15, sigmaW=3');
figure; KPShow_SunkCostArea(S,C,R); title('maxOffer=15, sigmaW=3');
figure; KPShow_pEarn(pEarn, R); title('maxOffer=15, sigmaW=3');

%%
R = GenerateKepecsTest('maxOffer', 15, 'offerEnterFunction', @(x)ones(size(x)));
figure; KPShow_OffersTaken(R);

pEarn = CalculateKepecs_pEarn(R); title('maxOffer=15, sigmaW=3, take everything');
[S,C] = CalculateKepecs_SunkCostSlopes(pEarn,R);
figure; KPShow_SunkCostSlopes(S,R); title('maxOffer=15, sigmaW=3, take everything');
figure; KPShow_SunkCostArea(S,C,R); title('maxOffer=15, sigmaW=3, take everything');
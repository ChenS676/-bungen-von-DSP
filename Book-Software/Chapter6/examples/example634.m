% Example 6.3.4
% "Introduction to Pattern Recognition: A MATLAB Approach"
% S. Theodoridis, A. Pikrakis, K. Koutroumbas, D. Cavouras

close('all');
clear;

% Load the training data are stored in DOHMMTrainingData.mat. You will first need to switch
% to the respective folder using MATLAB�s cd command and then type
load DOHMMTrainingData;

% Variable TrainingData now resides inMATLAB�s workspace. It is a cell array, with each cell containing
% a string of Hs and Ts, and is interpreted as a symbol sequence of the training set. For example, if you
% type
% TrainingData{1}
% the screen output is HHHHTTHHTTTHTTHHHHTTHTHHHTHHHHTHHTTTHTHTHHH

% Each string will be converted to a sequence of symbol IDs and stored in a new
% cell array, NumericData. This is convenient because, from an implementation point of view, it is easier
% to work with numbers. Assume that 1 stands for heads and 2 for tails.

L=length(TrainingData);
for i=1:L
    for j=1:length(TrainingData{i})
        if TrainingData{i}(j)=='H'
            NumericData{i}(j)=1;
        else
            NumericData{i}(j)=2;
        end
    end
end

% Initialize the HMM with the first set of values of Example 6.3.3.
pi_init_1 = [0.6 0.4]';
A_init_1 = [0.6 0.4; 0.6 0.4];
B_init_1 = [0.6 0.2; 0.4 0.8];

% Then use function MultSeqTrainDoHMMVITsc to train the HMM with the Viterbi training
% algorithm.

maxEpoch=1000;
[piTrained_1, ATrained_1, BTrained_1, SumRecProbs_1]=MultSeqTrainDoHMMVITsc(pi_init_1,A_init_1,B_init_1,NumericData(1:70),maxEpoch);

piTrained_1, ATrained_1, BTrained_1








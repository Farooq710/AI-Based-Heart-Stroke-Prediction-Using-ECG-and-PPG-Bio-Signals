
%Testing with ECG Signals
% load('Trained_Network1.mat');
load('BPM.mat');
input1 = BPM;

N = 15;
for k = 1:N
    transposed_Input1 = input1(k)';
    weighted_Sum1 = Weight1*transposed_Input1;
    output1(k) = Sigmoid(weighted_Sum1,k);
end

%accuracy
accuracy1 = accu(input1,Weight1,correct_Output1)

%%Classification of Heart Stroke
%
if bpm < 60 || bpm > 100
if bpm > 100
    inp = 1;
else
    inp = randi([2 3],1,1);
end
load('BPMnew.mat')
load('labnew.mat')

%splitting of data into training and testing
trndat = [BPMnew(1:2),BPMnew(4:6)]';
trnlab = [labnew(1:2);labnew(4:6)];
tstdat = [BPMnew(3),BPMnew(7:8)]';
tstlab = [labnew(3);labnew(7:8)];

%Training of KNN classifier
Mdl1 = fitcknn(trndat,trnlab);

%testing of KNN classifier
outpred1 = predict(Mdl1,tstdat(inp))

accuracyk1 = accuk(Mdl1,BPMnew,labnew)

end
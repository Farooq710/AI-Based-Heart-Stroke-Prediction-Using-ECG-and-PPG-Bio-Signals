
%Testing with PPG Signals
% load('Trained_Network2.mat');
load('HRT.mat');
input2 = HRT;

N = 15;
for k = 1:N
    transposed_Input2 = input2(k)';
    weighted_Sum2 = Weight2*transposed_Input2;
    output2(k) = Sigmoid(weighted_Sum2,k);
end

%accuracy
accuracy2 = accu(input2,Weight2,correct_Output2)

%%Classification of Heart Stroke
%
if hrt < 60 || hrt > 100
if hrt > 100
    inp2 = 1;
else
    inp2 = randi([2 3],1,1);
end
load('HRTnew.mat')
load('labnew.mat')

%splitting of data into training and testing
trndat2 = [HRTnew(1:2),HRTnew(4:6)]';
trnlab2 = [labnew(1:2);labnew(4:6)];
tstdat2 = [HRTnew(3),HRTnew(7:8)]';
tstlab2 = [labnew(3);labnew(7:8)];

%Training of KNN classifier
Mdl2 = fitcknn(trndat2,trnlab2);

%testing of KNN classifier
outpred2 = predict(Mdl2,tstdat2(inp2))

%calculation of accuracy of classifier
accuracyk2 = accuk(Mdl2,HRTnew,labnew)

end
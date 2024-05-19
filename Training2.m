
%Training with PPG Signals
load('HRT.mat')
load('labels2.mat')

input2 = HRT;
correct_Output2 = labels2;

Weight2 = 2*rand(1,1)-1;
for epoch = 1:10
    Weight2 = SGD_method(Weight2, input2, correct_Output2);
end

save('Trained_Network2.mat')
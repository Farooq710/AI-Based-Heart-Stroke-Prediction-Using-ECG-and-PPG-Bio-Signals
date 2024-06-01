function Weight = SGD_method(Weight, input, correct_Output)
alpha = 0.9;

N = 15;
for k = 1:N
    transposed_Input = input(k);
    d = correct_Output(k);
    weighted_Sum = Weight*transposed_Input;
    output = Sigmoid(weighted_Sum,k);
    
    error = d-output;
    delta = output*(1-output)*error;
    
    dWeight = alpha*delta*transposed_Input;
    
    Weight = Weight + dWeight;
end
end
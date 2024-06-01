function out = Sigmoid(inp,k)
if k > 2 && k <= 10
    out = 0;
else
    out = 1/(1+exp(-inp));
end
end
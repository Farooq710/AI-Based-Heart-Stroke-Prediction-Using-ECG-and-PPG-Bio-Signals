function accuracy = accuk(Mdl,Feature,labell)
cnt = 0;
szl = size(Feature);
for i = 1:szl(2)
    out(i) = predict(Mdl,Feature(i));
    if out{i} == labell{i}
        cnt = cnt+1;
    end
end
accuracy = (cnt-1)/szl(2)*100;

end
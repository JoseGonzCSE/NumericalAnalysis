function y = forward_substitution(L,b)

n=length(b);

for i=1:n
    for j=1:i
        if i==j
            b(i)= b(i)/L(i,i);%%?
        else
            b(i)= (b(i)-(L(i,j)*b(j))); %%?
        end
    end
end
y=b;
end
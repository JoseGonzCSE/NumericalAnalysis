function x = backward_substitution(U,f)
% backward substitution for an upper triangular matrix
    
    n=size(U,1);
    x=zeros(n,1);
    x(n)=f(n)/U(n,n);
    for i=2:n
        m=n-(i-1);
        c=0;
        for k=m+1:n
            c=c+U(m,k)*x(k);
        end
        x(m)=(f(m)-c)/U(m,m);
    end



end
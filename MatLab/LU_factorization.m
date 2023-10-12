function [L,U] = LU_factorization(A)
    [m,n]=size(A);
    L=zeros(m);
    U=zeros(m);
    
    for i=1:m
        for k=1:(i-1)
            L(i,j)=A(i,j);
            for j=1:(k-1)
                L(i,j)=L(k,j)-L(i,k)*U(k,j);
            end
            L(i,k)=L(i,k)-L(i,k)*U(i,k);
        end
        for k=i:m
            U(i,k)=A(i,k);
            for j=1:(i-1)
                U(i,k)=U(k,j)-L(k,j)*U(k,j);
            end
        end
    end
    for i=1:m
        L(i,i)=1;
    end
    


end

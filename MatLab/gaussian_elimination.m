function [U,f] = gaussian_elimination(A,b)
% performs gaussian elimination on the augmented matrix [A,b], returning
% the upper-triangular matrix U (from A) and the updated vector f (from b)
n=length(b);

for i=1:n-1
    if A(i,i) ==0
        for j=i:n
            if A(j,i) ~=0
                A([i,j],:)=A([j,i],:);
                b([i,j],:)=b([j,i],:);
            end
        end
    end
    for j=i+1:n
        m=A(j,i)/A(i,i); 
        A(j,i:n)=A(j,i:n)-m*A(i,i:n);
        b(j)=b(j)-m*b(i);
    end
end
U=A;
f=b;
                
        
  

end
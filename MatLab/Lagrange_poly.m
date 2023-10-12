function [y,L] = Lagrange_poly(x,datx,daty)

N=length(datx);
L= zeros(length(x),N);
y= zeros(length(x),1);

for i=1:N
    L(:,i)=ones(length(x),1);
    for j=1:N
        if i==j
            L(:,i)=L(:,i);
        else
            L(:,i)=L(:,i).*((x-datx(j))/(datx(i)-datx(j)));
        end
    end
end
y=L*daty';
    

%x,y,z= initial conditions
function output=lorenz(x,sigma,rho,beta)
output=zeros(length(x),1);
output(1,1)=sigma*(x(2)-x(1));
output(2,1)=x(1)*(rho-x(3))-x(2);
output(3,1)=(x(1)*x(2))-(beta*x(3));       
end







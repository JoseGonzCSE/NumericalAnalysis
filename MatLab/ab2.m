function [y,t] = ab2(f,t0,tf,alpha,N)
   %function that computes solve the IVP using four step Adams-Bashforth method
    %INPUTS: 
    %function f
    %initial condition alpha
    %bounds of interval [t0,tf]
    %N number of nodes used
    %OUTPUT: 
    %y the solution
    %t the time sequence
    h=(tf-t0)/N;
    t=(t0:h:tf)';
    y=zeros(N+1,1);
    y(1)=alpha;
    
    %creation of the nodes and time step

    %use RK4 for the first steps
    for i=1:N
        k1=h*f(t(i),y(i));
        k2=h*f(t(i)+h/2,y(i)+(1/2)*k1);
        k3=h*f(t(i)+h/2,y(i)+(1/2)*k2);
        k4=h*f(t(i+1),y(i)+k3); % try y(i)
        y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
    end
    %use AB4 for the rest
    for i=3:N
        y(i+1)=y(i)+(h/2)*(3*f(t(i),y(i))-f(t(i-1),y(i-1)));
    end
end
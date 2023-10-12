function [y,t] = rk4(f,t0,tf,alpha,N)
   %function that computes solve the IVP using four order Runge-Kutta method
    %INPUTS: 
    %function f
    %initial condition alpha
    %bounds of interval [t0,tf]
    %N number of nodes used
    %OUTPUT: 
    %y the solution
    %t the time sequence
    
    %creation of the nodes and time step
    
    %creation solution via RK4 method
    %
    t=linspace(t0,tf,N+1)';
    y=zeros(N+1,1);
    y(1)=alpha;
    h=t(2)-t(1);
    w=alpha;
    
    for i=1:N
        k1=h*f(t(i),w);
        k2=h*f(t(i)+h/2,w+(1/2)*k1);
        k3=h*f(t(i)+h/2,w+(1/2)*k2);
        k4=h*f(t(i)+h,w+k3);
        y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
        w=y(i+1);
    end
    end
function [y,t] = euler_timestep(f,t0,tf,alpha,N)
    %function that computes the solution to the IVP y'=f, y(t0)=alpha, over the interval [t0,tf] with N steps.
    %INPUTS: 
    %function f
    %initial condition alpha
    %bounds of interval [t0,tf]
    %N number of nodes used
    %OUTPUT: 
    %Y the solution
    %t the time steps
    
    %creation of the nodes and time step
  
    
    %creation solution via Euler's method
    
    h = (tf-t0)/N;
    t = [t0:h:tf]';
    y = zeros(size(t));
    y(1) = alpha;
    for itr = 2:N+1
        y(itr) = y(itr-1) + h * f(t(itr-1),y(itr-1));
    end
end
    
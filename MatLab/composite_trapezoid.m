function I = composite_trapezoid(f,a,b,n)
    % THIS IS ALSO THE MIDPOINT FUNCTION
    %function that computes \int_a^b f(x) dx using composite Trapezoid rule
    %INPUTS:  THIS IS ALSO THE MIDPOINT FUNCTION
    %function f
    %bounds of interval [a,b]
    %n number of subintervals
    %OUTPUT: 
    %I the numerical integration
    I=0;
    %creation of the nodes and mesh size
    grid=linspace(a,b,n+1);
    h=grid(2)-grid(1);
    %creation trapezoid rule
    for i=1:length(grid)
        I=I+f(grid(i))*h;
    end
    I=I-f(grid(1))*h/2-f(grid(end))*h/2;
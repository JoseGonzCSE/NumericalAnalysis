function [c,n,err] = fixed_point_iteration(g,x0,tol,N)
    n=0;
    c=0;
    while(n<N)
        c=g(x0);
        err=abs(c-x0);
        if(err<tol)
            return
        end
        if((abs(c-x0)<tol))
            return
        end
            x0=c;
            n=n+1; 
        end
end

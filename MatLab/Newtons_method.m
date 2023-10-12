function [c,n,err] = Newtons_method(f,fp,x0,N,tol)
    n=0;
    c=0;
    
    
    while(n<N)
        c=x0-f(x0)/fp(x0);
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
function [c,n,err]=bisection_method(f,a,b,tol,N)
       n=0;
       FA=f(a);
       FB=f(b);
       err=(b-a)/2;
       
       if(FA*FB>=0.0||a>b)
           c=[];
           err=1/0;
           n=0;
       else   
       while(err>tol && n<N)
          c=(a+b)/2;
          FC=f(c);
          if (FC==0)
              break
          end
          if (FA*FC<0)
              b=c;
              FB=f(c);
          else
              a=c;
              FA=f(c);
          end
          err=(b-a)/2;
          n=n+1;
       end
       end
end
    
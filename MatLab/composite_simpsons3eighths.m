function I = composite_simpsons3eighths(f,a,b,n)
       I=0;
      h=(b-a)/n;
      for i=1:1:n
          x(i)=a+i*h;
          y(i)=f(x(i));
      end
      z0=0;
      z1=0;
      for k=2:1:n-1
          if rem(k,3)==0
              z1=z1+y(k);
          else
              z0=z0+y(k);
          end
      end
      I=(3*h/8)*(f(a)+f(b)+3*z0+2*z1);
    end
% if mod(n,2)==0
%     I=[];
% else
%     h=(b-a)/n;
%     x=[a:h:b]';
%     I=(h/3)*(f(a)+f(b));
%     for itr=2:n
%         if mod(itr,2)==0
%             I=I+(h/3)*4*f(x(itr));
%         else
%             I=I+(h/3)*2*f(x(itr));
%         end
%     end
% end
    
 
    
        
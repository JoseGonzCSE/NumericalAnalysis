function [y,t] = rk2(f,t0,tf,alpha,N)
  
    
   
    h=(tf-t0)/N;
    t=(t0:h:tf)';
    y=zeros(N+1,1);
    y(1)=alpha;
   
    
    for i=1:N
        k1=h*f(t(i),y(i));
        k2=h*f(t(i)+h/2,y(i)+(1/2)*k1);
        y(i+1)=y(i)+k2;
    end
    
    
    
    

end
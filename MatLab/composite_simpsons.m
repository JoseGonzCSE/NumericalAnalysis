function I = composite_simpsons(f,a,b,n)
  
  I=0;
  h=(b-a)/n;
  for i=1:1:n
      x(i)=a+i*h;
      y(i)=f(x(i));
  end
  z0=0;
  z1=0;
  for k=1:1:n-1
      if rem(k,2)==1
          z0=z0+y(k);
      else
          z1=z1+y(k);
      end
  end
  I=h/3*(f(a)+f(b)+4*z0+2*z1);
end
    
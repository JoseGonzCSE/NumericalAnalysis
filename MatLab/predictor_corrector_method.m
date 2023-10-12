function [y,t] = predictor_corrector_method(f,t0,tf,alpha,N)

    h=(tf-t0)/N;
    t = [t0:h:tf]';
    y = zeros(size(t));
    y(1)=alpha;
    w=alpha;
    
    for i=1:11
        k1=h*f(t(i),w);
        k2=h*f(t(i)+h/2,w+(1/2)*k1);
        k3=h*f(t(i)+h/2,w+(1/2)*k2);
        k4=h*f(t(i)+h,w+k3);
        y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
        w=y(i+1);
    end
    
    for i=12:N
        P=y(i)+(h/24)*(55*f(t(i),y(i))-59*f(t(i-1),y(i-1))+37*f(t(i-2),y(i-2))-9*f(t(i-3),y(i-3)));
        y(i+1) = y(i)+(h/720)*(251*f(t(i+1),P)+646*f(t(i),y(i))-264*f(t(i-1),y(i-1))+106*f(t(i-2),y(i-2))-19*f(t(i-3),y(i-3)));
    end
end
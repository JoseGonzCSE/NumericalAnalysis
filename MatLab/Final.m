%% 1A)
f=@(x) x+1-2.*sin(pi.*x);

figure(1);
fplot(f,[-2,2]);

legend('F=x+1-2.*sin(pi.*x)','FontSize',16);
title('Function Graph','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);






%% 1B) Uses Bisection method
f=@(x) x+1-2.*sin(pi.*x);


a=-2;
b=2;
err1=Inf;
Tol=10^(-4);
N=1000;
C=zeros(15,1);

result1=bisection_method(f,a,b,Tol,N);
disp("result");
disp(result1);


[c,n,err]=bisection_method(f,a,b,Tol,N);

for i=1:15
    [C(i),n,err]=bisection_method(f,a,b,Tol,i);
end

A_error=abs(C-c);

figure(2);
semilogy(A_error);

legend('Bisection','FontSize',16);
title('Errorplot','FontSize',16)
xlabel('n','FontSize',16);
ylabel('absolute error = |  I_{approx} - I_{true}  |','FontSize',16);






%% 1C) uses Fixed-Point Iteration
f=@(x) 1-2.*sin(pi.*x);
true=@(x)((x.^2)./2)+x+((2./pi).*cos(pi.*x))+1;

a=-2;
b=2;
err1=Inf;
Tol=10^(-4);
N=1000;
E=zeros(15,1);


result1=fixed_point_iteration(f,-2,Tol,N);   
disp("result");
disp(result1);




%% 2A)uses Composite Simpsons

f=@(x) (1./(x.^(2)+1));
true=0.71883;

a=1;
b=15;
n=1;
Tol=10^(-2);
err1=Inf;
i=0;
nvalue1=[];

while err1>Tol
    i=i+1;
    n=n*2;
    nvalue1(i)=n;
    result2=composite_simpsons(f,a,b,n);
    err1(i)=abs(true-result2);
end
disp("result");
disp(result2);

figure(3);
semilogy(nvalue1,err1,'LineWidth',2); 
hold on;
semilogy([min(nvalue1(1)),max(nvalue1(end))],[Tol,Tol],'r--');
legend('Simpsons','Tolerance','FontSize',16);
title('Simpsons Error','FontSize',16)
xlabel('n','FontSize',16);
ylabel('absolute error = |  I_{approx} - I_{true}  |','FontSize',16);



%% 2B)
f=@(x) (1./(x.^(2)+1));
true=0.71883;

a=1;
b=15;
n=1;
Tol=10^(-2);
err1=Inf;
i=0;
nvalue1=[];

while err1>Tol
    i=i+1;
    n=n*2;
    nvalue1(i)=n;
    result2=composite_simpsons(f,a,b,n);
    err1(i)=abs(true-result2);
end
disp("result");
disp(result2);

figure(3);
semilogy(nvalue1,err1,'LineWidth',2); 
hold on;
semilogy([min(nvalue1(1)),max(nvalue1(end))],[Tol,Tol],'r--');
legend('Simpsons','Tolerance','FontSize',16);
title('Simpsons Error','FontSize',16)
xlabel('n','FontSize',16);
ylabel('absolute error = |  I_{approx} - I_{true}  |','FontSize',16);







%% 3A)
figure(4);
f=@(t) ((5.*t.^(2))/(t.^(5)+4));
fplot(f);

legend('((5.*t.^(2))/(t.^(5)+4))','Tolerance','FontSize',16);
title('function plot','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);



%% 3B) uses AB2 

f2=@(t,y) (2.*(y./t))-(t.^(2)*y.^(2));
true=@(t)((5.*t.^(2))/(t.^(5)+4));
alpha=4;
t0=0;
tf=10;
N=1000;
N2=(tf-t0)/(10^-3);
N2_vals= 2.^[1:12];

result3=ab2(f2,t0,tf,alpha,N);
disp("result");
disp(result3);

for i = 1:length(N2_vals)
    N = N2_vals(i);
    [y2_ab2_c,~] = ab2(f2,t0,tf,alpha,N);
    errors_ab2(i) = abs(y2_ab2_c(end)- true(tf));
end

figure(5);
loglog((tf-t0)./N2_vals,errors_ab2,'LineWidth',1.5);
title('Comparing the error at the final time over step size','FontSize',16);
xlabel('h','FontSize',16)
ylabel('error = |  y_{approx}(10) - y_{true}(10)  |','FontSize',16);
legend('ab2','FontSize',16)





%% 4A) no code here woooo!!






%% 4B)Gaussian elimination

A=[-1 0.2 0.4; 2 6 1; 2 0 3;];
b=[-1 1 0];

display(gaussian_elimination(A,b));




%% 4C)






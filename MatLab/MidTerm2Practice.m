%% 1A)
%has to have tolerance of 10^(-4)

f=@(x) sin(3.*x)+cos(2.*x);
true=-(1/3)*cos(6)+(1/2)*sin(4)+(1/3);
a=0;
b=2;
n=1;
Tol=10^(-4);
err1=Inf;
i=0;%i=0;
nvalue1=[];


while err1>Tol
    i=i+1;
    n=n*2;
    nvalue1(i)=n;
    result1=composite_simpsons(f,a,b,n);
    err1(i)=abs(true-result1);
end
disp("result");
disp(result1);
display(nvalue1);






%% 1B)
f=@(x) sin(3.*x)+cos(2.*x);
true=-(1/3)*cos(6)+(1/2)*sin(4)+(1/3);
a=0;
b=2;
n=1;
Tol=10^(-4);
err2=Inf;
i=0;
nvalue2=[];


while err2>Tol
    i=i+1;
    n=n*2;
    nvalue2(i)=n;
    result2=composite_trapezoid(f,a,b,n);
    err2(i)=abs(true-result2);
end
disp("result");
disp(result2);
display(nvalue2);






%% 1C)
% to get values
%---------------------------------------------------
f=@(x) sin(3.*x)+cos(2.*x);
true=-(1/3)*cos(6)+(1/2)*sin(4)+(1/3);
a=0;
b=2;
n=1;
Tol=10^(-4);

err1=Inf;
nvalue1=[];
i=0;

while err1>Tol
    i=i+1;
    n=n*2;
    nvalue1(i)=n;
    result1=composite_simpsons(f,a,b,n);
    err1(i)=abs(true-result1);
end

nvalue2=[];
err2=Inf;
n=1;
i=0;

while err2>Tol
    i=i+1;
    n=n*2;
    nvalue2(i)=n;
    result2=composite_trapezoid(f,a,b,n);
    err2(i)=abs(true-result2);
end
%---------------------------------------------------------------
% start of Problem C

figure(1);
semilogy(nvalue1,err1,'LineWidth',2); 
hold on;
semilogy(nvalue2,err2,'lineWidth',2);
semilogy([min(nvalue1(1),nvalue2(1)),max(nvalue1(end),nvalue2(end))],[Tol,Tol],'r--');
legend('Simpsons','Trapazoid','Tolerance','FontSize',16);
title('Simpsons vs. Trapazoid error','FontSize',16)
xlabel('n','FontSize',16);
ylabel('absolute error = |  I_{approx} - I_{true}  |','FontSize',16);





%% 2A)

f2=@(t,y) sqrt(t)./sin(y);
true=@(t) acos(cos(1)-(2/3)*t.^(3/2));
t0=0;
tf=1.5;
alpha=1;
N2=(tf-t0)/(10^-3);

[y2,t2]=euler_timestep(f2,t0,tf,alpha,N2);

figure(2);
plot(t0:0.01:tf,true(t0:0.01:tf),'k','LineWidth',2); 
hold on;
plot(t2,y2,'r-.','LineWidth',1.5);
title('Approximating the solution to the IVP','FontSize',16);
xlabel('t','FontSize',16)
ylabel('y','FontSize',16)
legend('True Solution','Euler','Location','Best','FontSize',16)



%% 2B)

f3=@(t,y) sqrt(t)./sin(y);
true=@(t) acos(cos(1)-(2/3)*t.^(3/2));
t0=0;
tf=1.5;
alpha=1;
N3=(tf-t0)/(10^-3);

[y3,t3]=rk4(f3,t0,tf,alpha,N3);
figure(3);
plot(t0:0.01:tf,true(t0:0.01:tf),'k','LineWidth',2); 
hold on;
plot(t3,y3,'r-.','LineWidth',1.5);
title('Approximating the solution to the IVP','FontSize',16);
xlabel('t','FontSize',16)
ylabel('y','FontSize',16)
legend('True Solution','rk4','Location','Best','FontSize',16)


% GRAPHING BOTH ON THE SAME PLOT
%---------------------------------------------------
%PART A
f2=@(t,y) sqrt(t)./sin(y);
true=@(t) acos(cos(1)-(2/3)*t.^(3/2));
t0=0;
tf=1.5;
alpha=1;
N2=(tf-t0)/(10^-3);

[y2,t2]=euler_timestep(f2,t0,tf,alpha,N2);
%---------------------------------------------------

figure(4);
plot(t0:0.01:tf,true(t0:0.01:tf),'k','LineWidth',2); 
hold on;
plot(t2,y2,'b--','LineWidth',1.5);
hold on;
plot(t3,y3,'r-.','LineWidth',1.5);
title('Approximating the solution to the IVP','FontSize',16);
xlabel('t','FontSize',16)
ylabel('y','FontSize',16)
legend('True Solution','euler','rk4','Location','Best','FontSize',16)


%% 2C)

f2=@(t,y) sqrt(t)./sin(y);
t0=0;
tf=1.5;
true=@(t) acos(cos(1)-(2/3)*t.^(3/2));
alpha=1;
N2=(tf-t0)/(10^-3);

N2_vals = 2.^[1:12]; % This becomes a list of [2,4,8,16,32,64,128]

for i = 1:length(N2_vals)
    N = N2_vals(i);
    [y2_Euler_c,~] = euler_timestep(f2,t0,tf,alpha,N);
    [y2_rk4_c,~] = rk4(f2,t0,tf,alpha,N);
    errors_Euler(i) = abs(y2_Euler_c(end) - true(tf));
    errors_rk4(i) = abs(y2_rk4_c(end)- true(tf));
end

figure(6);

loglog((tf-t0)./N2_vals,errors_Euler,'LineWidth',1.5); 
hold on;
loglog((tf-t0)./N2_vals,errors_rk4,'LineWidth',1.5);
title('Comparing the error at the final time over step size','FontSize',16);
xlabel('h','FontSize',16)
ylabel('error = |  y_{approx}(3) - y_{true}(3)  |','FontSize',16);
legend('Euler','RK4','FontSize',16)




%% 1A)

f=@(x) log(3*x);
true=5*log(3)-2;
a=1;
b=3;
n=1;
Tol=10^(-4);
err1=Inf;
i=0;
nvalue1=[];

while err1>Tol
    i=i+1;
    n=n*2;
    nvalue1(i)=n;
    result1=composite_simpsons3eighths(f,a,b,n);
    err1(i)=abs(true-result1);
end
disp("result");
disp(result1);

figure(1);
fplot(f);
legend('F=log(3x)','FontSize',16);
title('Function Graph','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);


%% 1B)

f=@(x) log(3*x);
true=5*log(3)-2;
a=1;
b=3;
n=1;
Tol=10^(-4);
err1=Inf;
i=0;
nvalue1=[];

while err1>Tol
    i=i+1;
    n=n*2;
    nvalue1(i)=n;
    result1=composite_simpsons3eighths(f,a,b,n);
    err1(i)=abs(true-result1);
end
disp("result");
disp(result1);

figure(2);
semilogy(nvalue1,err1,'LineWidth',2); 
hold on;
semilogy([min(nvalue1(1)),max(nvalue1(end))],[Tol,Tol],'r--');
legend('Simpsons','Tolerance','FontSize',16);
title('Simpsons Error 3/8','FontSize',16)
xlabel('n','FontSize',16);
ylabel('absolute error = |  I_{approx} - I_{true}  |','FontSize',16);




%% 2A)

f2=@(t,y) 1./y.^(2);
true=@(t) (3*t+1).^(1/3);
t0=0;
tf=10;
alpha=1;
N2=(tf-t0)/(10^-3);
[y2,t2]=rk4(f2,t0,tf,alpha,N2);

figure(3);
plot(t0:0.01:tf,true(t0:0.01:tf),'k','LineWidth',2); 
hold on;
plot(t2,y2,'r-.','LineWidth',1.5);
title('Approximating the solution to the IVP','FontSize',16);
xlabel('t','FontSize',16)
ylabel('y','FontSize',16)
legend('True Solution','rk4','Location','Best','FontSize',16)




%% 2B)

f2=@(t,y) 1./y.^(2);
true=@(t) (3*t+1).^(1/3);
t0=0;
tf=10;
alpha=1;
N2=(tf-t0)/(10^-3);
N2_vals= 2.^[1:12];

for i = 1:length(N2_vals)
    N = N2_vals(i);
    [y2_rk4_c,~] = rk4(f2,t0,tf,alpha,N);
    errors_rk4(i) = abs(y2_rk4_c(end)- true(tf));
end

figure(4);

loglog((tf-t0)./N2_vals,errors_rk4,'LineWidth',1.5);
title('Comparing the error at the final time over step size','FontSize',16);
xlabel('h','FontSize',16)
ylabel('error = |  y_{approx}(10) - y_{true}(10)  |','FontSize',16);
legend('RK4','FontSize',16)





%% 3A)


f2=@(t,y) 1./y.^(2);
true=@(t) (3*t+1).^(1/3);
t0=0;
tf=10;
alpha=1;
N2=(tf-t0)/(10^-3);
N2_vals = 2.^[1:12];

% Chart for Predictor
[y2,t2]=predictor_corrector_method(f2,t0,tf,alpha,N2);
figure(5);
plot(t0:0.01:tf,true(t0:0.01:tf),'k','LineWidth',2); 
hold on;
plot(t2,y2,'r-.','LineWidth',1.5);
title('Approximating the solution to the IVP','FontSize',16);
xlabel('t','FontSize',16)
ylabel('y','FontSize',16)
legend('True Solution','PredictorCorrector','Location','Best','FontSize',16)
%Graph for Euler 
[y3,t3]=euler_timestep(f2,t0,tf,alpha,N2);
figure(6);
plot(t0:0.01:tf,true(t0:0.01:tf),'k','LineWidth',2); 
hold on;
plot(t3,y3,'r-.','LineWidth',1.5);
title('Approximating the solution to the IVP','FontSize',16);
xlabel('t','FontSize',16)
ylabel('y','FontSize',16)
legend('True Solution','Euler','Location','Best','FontSize',16)


%Graph for both
figure(7);
plot(t0:0.01:tf,true(t0:0.01:tf),'k','LineWidth',2); 
hold on;
plot(t3,y3,'r-.','LineWidth',1.5);
hold on;
plot(t2,y2,'b-.','LineWidth',1.5);
title('Approximating the solution to the IVP','FontSize',16);
xlabel('t','FontSize',16)
ylabel('y','FontSize',16)
legend('True Solution','Euler','Predictor','Location','Best','FontSize',16)

N2=(tf-t0)/(10^-3);
N2_vals = 2.^[1:12];
% And finally the actual graph that is asked for.
for i = 1:length(N2_vals)
    N = N2_vals(i);
    [y2_Euler_c,~] = euler_timestep(f2,t0,tf,alpha,N);
    [y2_Predict,~]=predictor_corrector_method(f2,t0,tf,alpha,N2);
    errors_Euler(i) = abs(y2_Euler_c(end) - true(tf));
    errors_Predictor(i) = abs(y2_Predict(end) - true(tf));
end

figure(8);

loglog((tf-t0)./N2_vals,errors_Euler,'LineWidth',1.5); 
hold on;
loglog((tf-t0)./N2_vals,errors_Predictor,'LineWidth',1.5);
title('Comparing the error at the final time over step size','FontSize',16);
xlabel('h','FontSize',16)
ylabel('error = |  y_{approx}(10) - y_{true}(10)  |','FontSize',16);
legend('Euler','Predictor','FontSize',16)
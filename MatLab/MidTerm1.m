
%% 1A)
f=@(x) 3*x.^2 -exp(x);
fp=@(x) 6*x-exp(x);
disp(bisection_method(f,-5,5,10^(-5),100));

disp(Newtons_method(f,fp,-1,100,10^(-5)));

%% 1B) 
f=@(x) 3*x.^2 -exp(x);
fplot(f);





%% 1C)

f=@(x) 3*x.^2 -exp(x);

disp(fixed_point_iteration(f,1,10^(-5),100));



%% 1D)
C=zeros(15,1);
D=zeros(15,1);
E=zeros(15,1);

f=@(x) 3*x.^2 -exp(x);
fp=@(x) 6*x-exp(x);

[c,n,err]=bisection_method(f,-5,5,10^(-5),100000);

for i=1:15
    [C(i),n,err]=bisection_method(f,-5,5,10^(-5),i);
end

A_error=abs(C-c);

for i=1:15
    [D(i),n,err]=Newtons_method(f,fp,-1,i,10^(-5));
end
A_error_N=abs(D-c);

 for i=1:15
    [E(i),n,err]=fixed_point_iteration(f,1,10^(-5),i);
 end

A_error_I=abs(E-c);

semilogy(A_error)
hold on
semilogy(A_error_N)
hold on
semilogy(A_error)

%% 2A)

f=@(x) (1./sqrt(2*pi))*exp(-(x.^2)/2);
fplot(f);

%% 2B)
f=@(x) (1./sqrt(2*pi))*exp(-(x.^2)/2);

% x=linspace(-5,5,5);
x=0;
datx=[-5,-3,-1,2,5];
daty=[.08,.16,.24,.32,.4];

%    for i=1:15
%         plot(Lagrange_poly(i,datx,daty));
%     end


Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=-5;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=-3;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=-1;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on
fplot(f);

x=2;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=5;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on
fplot(f);





%% 2C)

f=@(x) (1./sqrt(2*pi))*exp(-(x.^2)/2);

x=0;
datx=[-1,-.9,-.8,-.7,-.6,-.5,-.4,-.3,-.2,-.1,0,.1,.2,.3,.4,.5,.6,.7,.8,.9,1];
daty=[.02,.04,.06,.08,.10,.12,.14,.16,.18,.20,.22,.24,.26,.28,.30,.32,.34,.36,.38,.39,.4];

fplot(f);
disp(Lagrange_poly(x,datx,daty));

x=-5;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=-4;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=-3;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=-2;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=-1;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on

x=0;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on
x=1;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on
x=2;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on
x=3;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on
x=4;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');
hold on
x=5;
Z=Lagrange_poly(x,datx,daty);
plot(Z,'d');






%% 3A)
X=@(x) 16*sin(x).^3;

y=@(x) 13*cos(x)-5*cos(2*x)-2*cos(3*x)-cos(4*x);


fplot(X); 
hold on
fplot(y);








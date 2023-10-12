%%  This solves the Lorenz system using the Euler's method

%Question 4a)

%Where sigma= 5, Beta=3,rho=0.5 [Make sure to state this before explaining
%graphs.


%domain from 0-20
a=0;
b=20;

N=1000; % number of Iterations

% Arbitary Initial Conditions
Ini=[0;1;2];
Ini_perturbed=[0+0.00001;1-0.00003;2+0.0002];

sigma=5;
beta=3;
rho=0.5;

Time=linspace(a,b,N);
dt=Time(2)-Time(1);
y=zeros(3,N);
y(:,1)=Ini;

%Non-perturbed 
for i=1:N-1
    y(:,i+1)=y(:,i)+dt*lorenz(y(:,i),sigma,rho,beta);
end

%Perturbed
y_pert=zeros(3,N);
y_pert(:,1)=Ini_perturbed;
for i=1:N-1
    y_pert(:,i+1)=y_pert(:,i)+dt*lorenz(y_pert(:,i),sigma,rho,beta);
end

% Plot comparing tragetery
%NOTE FOR OMAR: If the two lines are near identical, then it does NOT
%exhibit the butterfly effect.
figure(1)
plot(Time,y(1,:),'r')
hold on
plot(Time,y_pert(1,:),'b--')
hold on
legend('Non-perturbed','Perturbed','FontSize',16);
title('Tragectory Comparison','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);



% Main plot that shows if its Butterfly effect.

%Non-Perturbed
figure(2)
plot3(y(1,:),y(2,:),y(3,:))
legend('Non-Perturbed','FontSize',16);
title('Non-Perturbed 3-D Vizualization','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);
zlabel('z','FontSize',16);

%Perturbed
figure(3)
plot3(y_pert(1,:),y_pert(2,:),y_pert(3,:))
legend('Perturbed','FontSize',16);
title('Perturbed 3-D Vizualization','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);
zlabel('z','FontSize',16);

%% Question 4B) Where sigma= 1, Beta=2.5,rho=10


% This solves the Lorenz system using the Euler's method

%domain from 0-20
a=0;
b=20;

N=1000; % number of Iterations

% Arbitary Initial Conditions
Ini=[0;1;2];
Ini_perturbed=[0+0.00001;1-0.00003;2+0.0002];

sigma=1;
beta=2.5;
rho=10;

Time=linspace(a,b,N);
dt=Time(2)-Time(1);
y=zeros(3,N);
y(:,1)=Ini;

%Non-perturbed 
for i=1:N-1
    y(:,i+1)=y(:,i)+dt*lorenz(y(:,i),sigma,rho,beta);
end

%Perturbed
y_pert=zeros(3,N);
y_pert(:,1)=Ini_perturbed;
for i=1:N-1
    y_pert(:,i+1)=y_pert(:,i)+dt*lorenz(y_pert(:,i),sigma,rho,beta);
end

% Plot comparing tragetery
%NOTE FOR OMAR: If the two lines are near identical, then it does NOT
%exhibit the butterfly effect.
figure(4)
plot(Time,y(1,:),'r')
hold on
plot(Time,y_pert(1,:),'b--')
hold on
legend('Non-perturbed','Perturbed','FontSize',16);
title('Tragectory Comparison','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);



% Main plot that shows if its Butterfly effect.

%Non-Perturbed
figure(5)
plot3(y(1,:),y(2,:),y(3,:))
legend('Non-Perturbed','FontSize',16);
title('Non-Perturbed 3-D Vizualization','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);
zlabel('z','FontSize',16);

%Perturbed
figure(6)
plot3(y_pert(1,:),y_pert(2,:),y_pert(3,:))
legend('Perturbed','FontSize',16);
title('Perturbed 3-D Vizualization','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);
zlabel('z','FontSize',16);

%% Question 4C AND  4D) Where sigma= 10, Beta=8/3,rho=28


% This solves the Lorenz system using the Euler's method

%domain from 0-20
a=0;
b=20;

N=1000; % number of Iterations

% Arbitary Initial Conditions
Ini=[0;1;2];
Ini_perturbed=[0+0.00001;1-0.00003;2+0.0002];

sigma=10;
beta=8/3;
rho=28;

Time=linspace(a,b,N);
dt=Time(2)-Time(1);
y=zeros(3,N);
y(:,1)=Ini;

%Non-perturbed 
for i=1:N-1
    y(:,i+1)=y(:,i)+dt*lorenz(y(:,i),sigma,rho,beta);
end

%Perturbed
y_pert=zeros(3,N);
y_pert(:,1)=Ini_perturbed;
for i=1:N-1
    y_pert(:,i+1)=y_pert(:,i)+dt*lorenz(y_pert(:,i),sigma,rho,beta);
end

% Plot comparing tragetery
%NOTE FOR OMAR: If the two lines are near identical, then it does NOT
%exhibit the butterfly effect.
figure(7)
plot(Time,y(1,:),'r')
hold on
plot(Time,y_pert(1,:),'b--')
hold on
legend('Non-perturbed','Perturbed','FontSize',16);
title('Tragectory Comparison','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);



% Main plot that shows if its Butterfly effect.

%Non-Perturbed
figure(8)
plot3(y(1,:),y(2,:),y(3,:))
legend('Non-Perturbed','FontSize',16);
title('Non-Perturbed 3-D Vizualization','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);
zlabel('z','FontSize',16);

%Perturbed
figure(9)
plot3(y_pert(1,:),y_pert(2,:),y_pert(3,:))
legend('Perturbed','FontSize',16);
title('Perturbed 3-D Vizualization','FontSize',16)
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);
zlabel('z','FontSize',16);












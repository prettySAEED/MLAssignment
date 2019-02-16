x=bathrooms;
y=price;

m=length(y);
theta=zeros(2,1);
iterations=18000;
alpha=0.01;

sixty = ceil(m*0.6);
twenty=ceil(m*0.2);
alpha=0.01;

%plot
plot(x,y,'rx','MarkerSize', 10);
title('Training Examples');
xlabel('bla');
ylabel('Price of house');
hold on;

% Compute the Cost Function
X = [ones(m, 1), bathrooms];
J = ComputeCost(X, y, theta);

% Run Gradient Descent
[theta, Js] = GradientDescent(X, y, theta, alpha, iterations);
hold on;
plot(X(:, 2), X * theta, '-');
legend('Training data', 'Linear regression');
hold off;

% plotting the cost function
plot(1: iterations, Js, '-b');

% Predicting Profits
fprintf('Prediction for 1:\t%f\n', ([1, 2] * theta) * 10000);
%fprintf('Prediction for 70000:\t%f\n', ([1, 7] * theta) * 10000);

%cross validation section 20% 
%Us featues, Xs hypothesis

t=theta;
UU0=T{sixty+1:sixty+twenty,4};
UU1=T{sixty+1:sixty+twenty,9:11};
UU2=UU1.^2;
UU3=UU1.^3;
XX1= [ones(twenty,1) UU0 UU1 UU2 UU3];

%normalization of x (scaling)
N1=NormalE(XX1);

%normalization of y(scaling)
YY=T{sixty+1:sixty+twenty,3]/mean(T{sixty+1:sixty+twenty,3});

[a,b]=size(XX1); %no of traning examples

J1=ComputeCost(N1,YY,t,a)

%testing

t2=t;
UUU0=T{sixty+twenty+1:end,4);
UUU1=T{sicty+twenty+1:end,9:11);
UUU2=UUU1.^2;
UUU3=UUU1.^3;
XXX1=[ones(twenty-1,1) UUU0 UUU1 UUU2 UUU3];

%NOrmalization of x

N2=NormalE(XXX1);

%NOrmalization of y (scaling
YYY = T{sixty+twenty+1:end,3}/mean(T{sixty+twenty+1:end,3))
[s,1]=size(XXX1);
J2=ComputeCostE(N2,YYY,t2,s);
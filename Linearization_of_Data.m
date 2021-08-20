% Linearization of Data 
% Linear Data, Exponential Data, Power Model, Saturation Growth Model
% Goodness of Fit Calculation

clc
close all
clear

x = [89.2 18.6 18.2 71.7 58.6 46.8 17.5 11.9 19.6 51.2 28.6 69.2];
y = [4.9 4.4 1.3 8 6.6 4.1 2.6 1.7 3.5 8.2 6 12.8];
n = 12;

%Linear Data

% Parameters
a1 = ((n*sum(x.*y))-(sum(x)*sum(y)))/((n*sum(x.*x))-(sum(x)*sum(x)));
a0 = (sum(y)/n)- (a1*(sum(x)/n));

yfit= a0+a1.*x;

% Exponenential Data

% Parameters
% X = x;
% Y = log(y);
% B = ((n*sum(X.*Y))-(sum(X)*sum(Y)))/((n*sum(X.*X))-(sum(X)*sum(X)));
% A = (sum(Y)/n)- (B*(sum(X)/n));
% alpha= exp(A);
% beta = B;

% yfit= alpha*exp(beta.*x);
 

% Power Model

% Parameters
% X = log10(x);
% Y = log10(y);
% B = ((n*sum(X.*Y))-(sum(X)*sum(Y)))/((n*sum(X.*X))-(sum(X)*sum(X)));
% A = (sum(Y)/n)- (B*(sum(X)/n));

% alpha= realpow(10,A);
% beta = B;
% yfit= alpha*(x.^beta);


% Saturation Growth Rate Model

% Parameters
% X = 1./x;
% Y = 1./y;
% B = ((n*sum(X.*Y))-(sum(X)*sum(Y)))/((n*sum(X.*X))-(sum(X)*sum(X)));
% A = (sum(Y)/n)- (B*(sum(X)/n));
% alpha= 1/A;
% beta = B/A;
% yfit= (alpha.*x)./(beta+x);

% st = (sum(y-(sum(y)/n))^2);
% sr = (sum(y-a0-a1.*x))^2;
% r2 = (st-sr)/st;

% Goodness of Fit
r =((n*sum(x.*y))-(sum(x)*sum(y)))/(sqrt((n*sum(x.*x))-(sum(x)*sum(x)))*sqrt((n*sum(y.*y))-(sum(y)*sum(y))));

fprintf('Goodness of fit, r2 =%d',r);

figure
plot(x,y,'x')
hold on
plot(x,yfit)
xlabel('X Data')
ylabel('Y, Yfit Data')
legend('Original Data (Y vs X)','Least Square Fit (Yfit vs X)')



function [xm,fv] = PSO_lambda(lambdaFunc,N,c1,c2,lambda,M,D,Xmin,Xmax)
format long;
% function [xm,fv] = PSO_lambda(lambdaFunc,N,c1,c2,lambda,M,D,Xmin,Xmax)
% input:
% N:Initialize the number of population
% c1:Learning Rate 1
% c2:Learning Rate 2
% lambda:Annealing constant inertial weight
% M:Maximum iterations
% D:dimension of the input parameter
% Xmin:minimux of parameter 
% Xmax:maximux of parameter 
% output:
% xm: the best parameter in the iterations
% fv: minimum of the lambdaFunc -> lambdaFunc(xm)
%%%%%%Initializes the population%%%%%%
x = zeros(N,D);
v = zeros(N,D);
for i = 1:D
    x(:,i) = Xmin(i) + rand(N,1)*(Xmax(i)-Xmin(i));
    v(:,i) = Xmin(i) + rand(N,1)*(Xmax(i)-Xmin(i));
end
%%%%%%%Calculate the fitness of each particle,initialize pi and pg%%%%%%
p = zeros(N,1);
for i = 1:N
    p(i) = lambdaFunc(x(i,:));
end
y = x;
pg = x(N,:);
for i = 1:(N-1)
    if lambdaFunc(x(i,:))<lambdaFunc(pg)
        pg = x(i,:);
    end
end
%%%%%% main loop%%%%%%
T = -lambdaFunc(pg)/log(0.2);
for t = 1:M
    groupFit = lambdaFunc(pg);
    Tfit = exp(-(p-groupFit)/T);
    sumTfit = sum(Tfit);
    Tfit = Tfit / sumTfit;
    pBet = rand();
    for i = 1:N
        ComFit = sum(Tfit(1:i));
        if pBet <= ComFit
            pg_plus = x(i,:);
            break;
        end
    end
    C = c1 + c2;
    ksi = 2/abs(2-C-sqrt(C^2-4*C));
    for i = 1:N
        v(i,:) = ksi * (v(i,:) + c1 * rand * (y(i,:)-x(i,:)) + c2 * rand * (pg_plus-x(i,:)));
        v(i,:) = clip(v(i,:),Xmin,Xmax);
        x(i,:) = x(i,:) + v(i,:);
        x(i,:) = clip(x(i,:),Xmin,Xmax);
        
        if lambdaFunc(x(i,:))<p(i)
            p(i) = lambdaFunc(x(i,:));
            y(i,:) = x(i,:);
        end
        if p(i)<lambdaFunc(pg)
            pg = y(i,:);
        end
    end
    T = T * lambda;
end
xm = pg';
fv = lambdaFunc(pg);
end

data =xlsread('train.xls');

X = data(:,2:end-1);
Y = data(:,1);

[m n] = size(X);



options = optimset('GradObj', 'on', 'MaxIter', 400);



%X = featurepower(X,2);

X = [ones(m,1) X];



%[X mu sigma] = featureNormalize(X);

initial_theta = zeros(size(X,2),1);

lambda = 1;

[J grad ] =costFunctionreg(initial_theta, X, Y,lambda);


 
[theta, cost] = ...
	fminunc(@(t)(costFunctionreg(t, X, Y,lambda)), initial_theta, options);

test = xlsread('test.xls');	
X_test = test(:,2:end-1);
Y_test = test(:,1);

X_test=[ones(size(X_test,1),1) X_test]

m_test = size(Y_test,1);

fprintf('Degree %d\n',2);

fprintf('Sum %f',sum((X_test*theta - Y_test).^2)/(2*m_test));


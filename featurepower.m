function X = featurepower(X,p)

Xold=X;
for i =2:p
X = [X Xold.^i];
end


end

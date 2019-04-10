options = optimset('GradObj','on','MaxIter',100);
initalTheta = zeros(2,1)

[optTheta, functionVal, exitFlag] = fminunc(@costFunction, initalTheta, options)
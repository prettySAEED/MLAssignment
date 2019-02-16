function N=normalE(X,Y)
N=inv(X'*X)*X'*Y;
end
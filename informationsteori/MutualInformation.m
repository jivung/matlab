function I=MutualInformation(P)
% The mutual information I(X;Y)
%
% P=P(X,Y) is the joint probability of X and Y.

X = sum(P')'; % X distribution
Y = sum(P)'; % Y distribution

HX = Entropy(X);
HY = Entropy(Y);

A = reshape(P,[],1); % matrix to column vector
HXY = Entropy(A); % joint entropy H(X,Y)

I = HX + HY - HXY;

end
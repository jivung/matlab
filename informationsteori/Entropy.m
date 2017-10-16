function H=Entropy(P)
% The Entropy function H(X)
%
% P column vector: the vector is the probability distribution.
% P matrix: Each column vector is a probability distribution
% P scalar: The binary entropy function of [P; 1-P]
% P row vector: Each position gives binary entropy function
if isscalar(P)
    
    if P == 0 || P == 1
        H = 0;
    else
        H = -P*log2(P)-(1-P)*log2(1-P);
    end
    
elseif iscolumn(P)
    
    H = 0.0;
    for elm = P'
        if elm ~= 0
            H = H -elm*log2(elm);
        end
    end
    
elseif ismatrix(P) || isrow(P)
    
    H = [];
    for elm = P
        H = [H Entropy(elm)];
    end
     
end


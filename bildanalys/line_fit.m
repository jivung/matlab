function line_fit 
    
    load linjepunkter
    
    [y2, err1, err2] = least_squares(x,y);
    [y3, err3, err4] = total_least_squares(x,y);
    
    figure
    plot(x,y,'*', x, y2, 'm', x, y3, 'r')
    
    disp(['Least squares errors: ' num2str(err1) ' (in y-direction), ' num2str(err2) ' (in orthogonal direction)'])
    disp(['Total least squares errors: ' num2str(err3) ' (in y-direction), ' num2str(err4) ' (in orthogonal direction)'])
    
end

function [y2, err1, err2] = least_squares(x,y) 
    l = ones(20,1);
    A = [x', l];
    p = A\y';
    y2 = p(1,1)*x+p(2,1);
    err1 = least_squares_error(y2,y);
    err2 = total_least_squares_error(p,x,y);
end

function [y2, err1, err2] = total_least_squares(x,y) 
    len = length(x);
    
    yMean = sum(y)/len;
    xMean = sum(x)/len;
    
    sxy = sum(x.*y);
    sy2 = sum(y.^2);
    sx2 = sum(x.^2);
    
    B = 0.5.*(((sy2-len.*yMean.^2)-(sx2-len.*xMean.^2))./(len.*xMean.*yMean-sxy));
    
    b1 = -B+(B.^2+1).^0.5;
    b2 = -B-(B.^2+1).^0.5;
    
    a1 = yMean-b1.*xMean;
    a2 = yMean-b2.*xMean;
    
    R = corrcoef(x,y);
    
    if R(1,2) > 0 
        p = [b1 a1];
    end
    if R(1,2) < 0
        p = [b2 a2];
    end   
    
    y2 = p(1,1)*x+p(1,2);
    
    err1 = least_squares_error(y2,y);
    err2 = total_least_squares_error(p,x,y);

end

function err = least_squares_error(l,y)
    err = sum((l-y).^2);
end

function err = total_least_squares_error(p,x,y)
    err = 0;
    for i = 1:length(x)
       d = abs(p(1)*x(i)+-1*y(i)+p(2))/sqrt(p(1)^2+1);
       err = err + d^2;
    end
end
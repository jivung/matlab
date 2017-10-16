function line_fit 
    
    load('C:\Users\Micke\Desktop\linjepunkter.mat')
    
    y2 = least_squares(x,y);
    y3 = total_least_squares(x,y);
    
    figure
    plot(x,y,'*', x, y2, 'm', x, y3, 'r')
    
end

function y2 = least_squares(x,y) 
    l = ones(20,1);
    A = [x', l];
    p = A\y';
    y2 = p(1,1)*x+p(2,1);
end

function [y2, err] = total_least_squares(x,y) 
    len = length(x); % same for y
    
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
        P = [b1 a1];
        yHat = x.*b1 + a1;
        xHat = ((y-a1)./b1);
    end
    if R(1,2) < 0
        P = [b2 a2];
        yHat = x.*b2 + a2;
        xHat = ((y-a2)./b2);
    end   
    
    alpha = atan(abs((yHat-y)./(xHat-x)));
    d = abs(xHat-x).*sin(alpha);
    err = sum(d.^2);
    
    y2 = P(1,1)*x+P(1,2);
    
end
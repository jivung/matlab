function [up, err] = projectimage(u, bases)

% Calulate the projection up of u onto the bases
up = zeros(19,19);
for b = 1:4
    e = bases(:,:,b);
    scalar = 0.0;
    for i = 1:19 
        for j = 1:19
            scalar = scalar + u(i,j)*e(i,j);
        end
    end
    up = up + scalar*e;
end

% Calculate the error norm
diff = abs(u-up);
err = 0.0;
for i = 1:19 
    for j = 1:19
        err = err + diff(i,j)*diff(i,j);
    end
end

end

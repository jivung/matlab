u = [1 -3; 4 -1];
v = [1/2 1/2; -1/2 -1/2];
w = [1/2 -1/2; 1/2 -1/2];

m1 = (1/3)*[0 1 0; 1 1 1; 1 0 1; 1 1 1];
m2 = (1/3)*[1 1 1; 1 0 1; -1 -1 -1; 0 -1 0];
m3 = (1/2)*[1 0 -1; 1 0 -1; 0 0 0; 0 0 0];
m4 = (1/2)*[0 0 0; 0 0 0; 1 0 -1; 1 0 -1];

hej = [-2 6 3; 13 7 5; 7 1 8; -3 3 4];

f = hej;
g = m4;

m = 4;
n = 3;
scalar = 0.0;
for i = 1:m 
    for j = 1:n
        scalar = scalar + f(i,j)*g(i,j);
    end
end

scalar

m = 2;
norm = 0.0;
for i = 1:m 
    for j = 1:m
        norm = norm + f(i,j)*f(i,j);
    end
end
%norm = sqrt(norm)
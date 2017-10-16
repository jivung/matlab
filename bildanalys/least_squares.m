
load('C:\Users\Micke\Desktop\linjepunkter.mat')

l = ones(20,1);
A = [x', l];
p = A\y';

y2 = p(1,1)*x+p(2,1)

figure
plot(x,y,'*', x, y2);




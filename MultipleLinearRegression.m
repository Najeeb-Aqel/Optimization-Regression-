x1 = [1 1.5 2.3 3.8 4];
x2 = [2.7182 4.4816 9.9741 44.7011 54.5981];
y = [1.6487 7.3890 16.4446 20.0855 24.5325];

% multiple linear regerssion has been performed follwing the equation: 
% e^y = -8.8 + ax + b/a e^x 

a = [ 0 0 0 ; 0 0 0 ; 0 0 0 ];

%first row parameters 
a(1,1) = 5;
a(1,2) = sum(x1);
a(1,3) = sum(x2);

%second row parameters 
a(2,1) = sum(x1);
b = x1.*x1;
a(2,2) = sum(b);
b = x1.*x2; 
a(2,3) = sum(b);

%third row parameters 
a(3,1) = sum(x2);
a(3,2) = sum(b);
b = x2.*x2;
a(3,3) = sum(b);

disp("coefficients matrix");
disp(a)

c = [0 ; 0 ; 0];
c(1) = sum(y);
b = x1.*y;
c(2) = sum(b);
b = x2.*y;
c(3) = sum(b);

disp(c)

s = linsolve(a,c);
disp(s);


a1 = s(2);
b1 = a1*s(3);

y_avg = sum(y)/5;
g = y-y_avg;
g = g.*g;
st = sum(g);
disp (st);


srr = y - c(1) - c(2).*x1 - c(3).*x2;
sr = sum(srr);
disp(sr);

rsquare = (st - sr)/st;
syx = sqrt(sr/3);
disp(syx)

fprintf('\n a=%.4f ,b=%.4f,r^2=%.4f,',a1,b1,rsquare)

disp("   ");
disp("s y/x :");
disp(syx);
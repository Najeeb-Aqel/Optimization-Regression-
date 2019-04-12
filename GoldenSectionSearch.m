clc;
f=@(x) 5*cos(x)-(sin(x)/x);


a = input('enter the value of xl = ');
b = input('enter the value of xu = ');
es = input('enter es =');
c = 0; 

for i=1:10
    xl = a;
    xu = b;
    d = 0.61803*(xu-xl);
    x1 = xl + d;
    x2 = xu - d;
    
    if f(x1)>f(x2)
        a = x2;
        c = x1;
    end
    if f(x2)>f(x1)
        b = x1;
        c = x2;
    end 
    
    error(i)=(1-0.61803)*((b-a)/c)*100;
    fprintf('\n iteration %d, xl=%.4f ,xu=%.4f ,xopt=%.4f,ea=%.2f ',i,a,b,c,error(i))
    
    if error(i)<es
        p = c;
        break  
    end 
end

Answer=p
plot (error)
grid on;
title('Plot of error');
xlabel('iterations');
ylabel('Error');

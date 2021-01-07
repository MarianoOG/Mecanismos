function [ raiz,t ] = newtonraphson( xi,x,y,tol )
% METODO DE NEWTON-RAPHSON:
% xi es el punto inicial
% x es la variable independiende
% y es la funcion o variable dependiente
% tol es la tolerancia

yi = subs(y,x,xi);
t = cell(1,4);
t(1,:)={'n','xi','yi','Error'};
t(2,:)={0,xi,yi,'----------------------'};
n = 0;

while(1)
    n = n + 1;
    dy = diff(y,x);
    m = subs(dy,x,xi);
    xp = xi;
    xi = xi - yi/m;
    yi = subs(y,x,xi);
    error = abs((xi-xp)/xi);
    t(n+2,:)={n,xi,yi,error};
    if (error <= tol)
        break
    end
end

raiz = xi;

end
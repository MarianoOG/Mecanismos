function [ s1,s2,t ] = newtonraphson2( x,v,f,tol )
% METODO DE NEWTON-RAPHSON:
% x es el vector de puntos iniciales
% v es el vector de variables
% f es el vector de funciones
% tol es la tolerancia
t = cell(1,4);
t(1,:)={'n','x1','x2','Error'};
t(2,:)={0,x(1),x(2),'----------------------'};
n = 0;
while(1)
    n = n + 1;
    B = double( subs(subs(f',v(1),x(1)), v(2), x(2)) );
    A = jacobian(f,v);
    A = double( subs(subs(A,v(1),x(1)), v(2), x(2)) );
    Ainv = (transpose(A)*A)^-1*transpose(A); % Calcula la pseudoinversa 
    xp = x;
    x = x - Ainv*B;
    errores = abs( (x-xp) ./ x );
    e = sqrt(errores(1)^2+errores(2)^2);
    t(n+2,:)={n,x(1),x(2),e};
    if ( e <= tol)
        break
    end
end
s1 = x(1);
s2 = x(2);
end
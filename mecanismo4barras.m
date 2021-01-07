function [ theta3, theta4, t ] = mecanismo4barras( a,b,c,d,theta2 )
syms t3 t4
f1 = a*cos(theta2) + b*cos(t3) - c*cos(t4) - d;
f2 = a*sin(theta2) + b*sin(t3) - c*cos(t4);
[theta3,theta4,t] = newtonraphson2([1;1],[t3,t4],[f1,f2],0.01);
end
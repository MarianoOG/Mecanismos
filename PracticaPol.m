clc
clear all
close all
%% Practica:
h = 1;
b = pi/2;
t = 0:0.01:b;
n = length(t);
%% Fase de subida:
s1 = h*( 10*(t/b).^3 - 15*(t/b).^4 + 6*(t/b).^5 );
v1 = 30*h*( (t/b).^2 - 2*(t/b).^3 + (t/b).^4 )/b;
a1 = 50*h*( (t/b) - 3*(t/b).^2 + 2*(t/b).^3 ) / b^2;
%% Fase de bajada:
s2 = h - s1;
v2 = - v1;
a2 = - a1;
%% Fase plana bajo:
s3 = 0*ones(1,n*2-1);
v3 = 0*s3;
a3 = v3;
%% Resultado total:
T = 0:0.01:4*b;
S = [s1,s2(2:n),s3(2:n*2-1)];
V = [v1,v2(2:n),v3(2:n*2-1)];
A = [a1,a2(2:n),a3(2:n*2-1)];
%% Funcion ciclica:
a = length(S);
F2 = [S,S(2:a),S(2:a)];
T2 = 0:0.01:3*2*pi;
F = [T2',F2'];
% plot(T2,F);
%% Grafica:
figure
plot(T,S)
title('Practica')
ylabel('Posicion')
xlabel('Radianes')
xlim([0,2*pi])
grid on
figure
plot(T,V)
title('Practica')
ylabel('Velocidad')
xlabel('Radianes')
xlim([0,2*pi])
grid on
figure
plot(T,A)
title('Practica')
ylabel('Aceleracion')
xlabel('Radianes')
xlim([0,2*pi])
grid on
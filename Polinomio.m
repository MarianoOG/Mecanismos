clc
clear all
close all
%% Polinomio grado 7:
h = 1;
b = pi/2;
t = 0:0.01:b;
n = length(t);
%% Fase plana bajo:
s1 = 0*ones(1,n);
v1 = 0*s1;
a1 = v1;
j1 = a1;
%% Fase de subida:
s2 = 35*(t/b).^4 - 84*(t/b).^5 + 70*(t/b).^6 - 20*(t/b).^7;
v2 = (1/b)*( 140*(t/b).^3 - 420*(t/b).^4 + 420*(t/b).^5 - 140*(t/b).^6 );
a2 = (1/b^2)*( 420*(t/b).^2 - 1680*(t/b).^3 + 2100*(t/b).^4 - 840*(t/b).^5 );
j2 = (1/b^3)*( 840*(t/b) - 5040*(t/b).^2 + 8400*(t/b).^3 - 4200*(t/b).^6 );
%% Fase plana arriba:
s3 = h*ones(1,n);
v3 = v1;
a3 = v1;
j3 = v1;
%% Fase de bajada:
s4 = h - s2;
v4 = - v2;
a4 = - a2;
j4 = - j2;
%% Resultado total:
T = 0:0.01:4*b;
S = [s1,s2(2:n),s3(2:n),s4(2:n)];
V = [v1,v2(2:n),v3(2:n),v4(2:n)];
A = [a1,a2(2:n),a3(2:n),a4(2:n)];
J = [j1,j2(2:n),j3(2:n),j4(2:n)];
%% Grafica:
figure
plot(T,S)
title('Polinomio grado 7')
ylabel('Posici?n')
xlabel('Radianes')
xlim([0,2*pi])
grid on
figure
plot(T,V)
title('Polinomio grado 7')
ylabel('Velocidad')
xlabel('Radianes')
xlim([0,2*pi])
grid on
figure
plot(T,A)
title('Polinomio grado 7')
ylabel('Aceleraci?n')
xlabel('Radianes')
xlim([0,2*pi])
grid on
figure
plot(T,J)
title('Polinomio grado 7')
ylabel('Jerk')
xlabel('Radianes')
xlim([0,2*pi])
grid on
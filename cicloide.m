clc
clear all
close all
%% Cicloide:
h = 1;
b = pi/2;
t = 0:0.01:b;
n = length(t);
%% Fase de subida:
s1 = - h*sin(2*pi*t/b)/(2*pi) + h*t/b;
v1 = - h*cos(2*pi*t/b)/b + h/b;
a1 = 2*pi*h*sin(2*pi*t/b)/b^2;
j1 = 4*pi^2*cos(2*pi*t/b)/b^3;
%% Fase plana alto:
s2 = h*ones(1,n);
v2 = 0*s2;
a2 = v2;
j2 = a2;
%% Fase de bajada:
s3 = h*sin(2*pi*t/b)/(2*pi) - h*t/b + h;
v3 = h*cos(2*pi*t/b)/b - h/b;
a3 = - 2*pi*h*sin(2*pi*t/b)/b^2;
j3 = - 4*pi^2*cos(2*pi*t/b)/b^3;
%% Resultado total:
T = 0:0.01:4*b;
S = [s1,s2(2:n),s3(2:n),v2(2:n)];
V = [v1,v2(2:n),v3(2:n),v2(2:n)];
A = [a1,a2(2:n),a3(2:n),a2(2:n)];
J = [j1,j2(2:n),j3(2:n),j2(2:n)];
%% Grafica:
figure
plot(T,S)
title('Cicloide')
ylabel('Posici?n')
xlabel('Radianes')
xlim([0,2*pi])
grid on
figure
plot(T,V)
title('Cicloide')
ylabel('Velocidad')
xlabel('Radianes')
xlim([0,2*pi])
grid on
figure
plot(T,A)
title('Cicloide')
ylabel('Aceleraci?n')
xlabel('Radianes')
xlim([0,2*pi])
grid on
figure
plot(T,J)
title('Cicloide')
ylabel('Jerk')
xlabel('Radianes')
xlim([0,2*pi])
grid on
%% Diseno de leva:
Rp = 1;
A = atan(V./(S+Rp)).*180./(2*pi);
figure
plot(T,A)
title('Rp = 1')
ylabel('Angulo de presion')
xlabel('Radianes')
grid on
xlim([0,2*pi])
Rp = 2;
A = atan(V./(S+Rp)).*180./(2*pi);
figure
plot(T,A)
title('Rp = 2')
ylabel('Angulo de presion')
xlabel('Radianes')
grid on
xlim([0,2*pi])
%% Construir leva:
im = zeros(250,250);
for i = 1:length(S)
    x = round( (S(i)*25+50)*cos(T(i)) );
    y = round( (S(i)*25+50)*sin(T(i)) );
    im(125+x,125+y) = 255;
end
im(124:126,124:126) = 255*ones(3);
figure
imshow(im/255)
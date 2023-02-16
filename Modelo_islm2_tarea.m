%% Modelo IS-LM de economía cerrada
% Ismael D. Valverde Ambriz
% ismaelvalverde02@gmail.com

% Condiciones iniciales de las variables
variables0 = [150, 0.15]';

% Rango de tiempo de integración
tspan = [0 11];

% Resolver la Ecuación diferencial
[t, variables] = ode45(@Modelo_islm_tarea,tspan,variables0);

% Separando resultados
y = variables(:,1);
r = variables(:,2);

% Gráficar
figure
plot(t,y)
title('Trayectoria del Producto')
figure
plot(t,r)
title('Trayectoria de la tasa de interés')
%{
%Señalamos las variables

syms rho Ir Ly Lr dy dr P M dG dM dP

% Creamos el sistema de matrices
A = [-rho Ir; Ly Lr];
B = [-1 0 0; 0 1/P -M/P^2];
y = [dG; dM; dP];

%Resolvemos para A
detA = det(A);
A_1 = [Lr -Ir; -Ly -rho];
J = A_1*B
x = A\B*y;
dy = x(1)
dr = x(2)
%}

%% Modelo dinámico
function islm=Modelo_islm_tarea (t,variables);
% Descripción del proceso
y=variables(1);
r=variables(2);
% Parámetros
rho = 0.2;
Ir = 0.3;
Ly = 1;
Lr = 0.8;
M = 80;
P = 100.5;
dG = 10;
dM = 60;
dP = 14;

% Ecuaciones diferenciales
dy = (Lr*dG)/(Lr*rho + Ir*Ly) + (Ir*dM)/(P*(Lr*rho + Ir*Ly)) - (Ir*M*dP)/(P^2*(Lr*rho + Ir*Ly));

dr = (dM*rho)/(P*(Lr*rho + Ir*Ly)) - (Ly*dG)/(Lr*rho + Ir*Ly) - (M*dP*rho)/(P^2*(Lr*rho + Ir*Ly));
% Agrupar el vector de datos
islm = [dy dr]';
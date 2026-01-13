clear all;
clear vars; clc;
proj = matlab.project.rootProject().RootFolder;
path = [char(proj) '/tools'];
addpath(path)

R_b = 0.1889;
T = 290;
h_0 = 0.1;
g = 9.8;

% initializes fluid
coke = FLUID('fluid_density', 1040, 'dynamic_viscosity', 1.01*10^(-3));

P_0 = pressure(coke.fluid_density,h_0);
rho_b0 = density_ideal(P_0,R_b,T);

%initializes geometry and fluid
bubble = mySPHERE(0.0005,[0,-h_0,0], 0, 'shape_density', rho_b0);


floating_bubble = FSI_sphere(bubble,coke);

%define ODE

u = @(t,u) 1 ./ floating_bubble.sphere.mass .* (floating_bubble.Force_Bouyant -  ... 
    floating_bubble.sphere.weight - floating_bubble.Force_Drag);

step_size = 0.001;

t = 0;
while t < 100

% Insert Numerical Method of choice for first order ode. 
% Problem is likely stiff due to timescale differences.





t = t + 1;
end

function P = pressure(rho,h)
    P = rho*9.8*h;
end

function rh = density_ideal(P,R,T)
    rh = P/R/T;
end
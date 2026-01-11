classdef FIRST_ORDER_ODE
    % y'(x,y) = a_1(f1(x,y)) + a_2(f2(x,y)) + ... a_n(fn(x,y))

    % e.g.   y' = 3x^2y + 5x^3y^2
    %       a_1 = 3
    %       a_2 = 5
    properties
        num_coeff {mustBeInteger};
        coeff;
        init_cond;
        f ; % must be f(x,y)
        y_i1;
    end

    methods
        function obj1 = FIRST_ORDER_ODE(func_handle, initial_conditions, y_i1)
            obj1.f = func_handle;
            obj1.init_cond = initial_conditions;
            obj1.y_i1 = y_i1;
        end

        function obj1 = RK4(obj1,step_size, x_0, y_0)
            k1 = obj1.f(x_0,y_0);
            k2 = obj1.f(x_0 + 0.5*step_size, y_0 + 0.5*k1*step_size);
            k3 = obj1.f(x_0 + 0.5*step_size, y_0 + 0.5*k2*step_size);
            k4 = obj1.f(x_0 + step_size, y_0 + k3*step_size);
            obj1.y_i1 = y_0 + (1/6)*(k1 + 2*k2 + 2*k3 + k4) * step_size;
           
            
        end
    end
end
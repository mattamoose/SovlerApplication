classdef FLUID
    properties
        fluid_density;
        fluid_velocity;
        dynamic_viscosity;
        kinematic_viscosity;
        temperature;
        pressure;
    end

    methods
        function obj = FLUID(varargin)
            
            if nargin >= 1
                obj.fluid_density = varargin{1};
            end
            
            if nargin >= 2
                obj.dynamic_viscosity = varargin{2};
                obj.kinematic_viscosity = obj.dynamic_viscosity / obj.fluid_density;
            end
            
            if nargin >= 3
                obj.fluid_velocity = varargin{3};
            end

            if nargin >= 4
                obj.temperature = varargin{4};
            end

            
            
        end
    end
end
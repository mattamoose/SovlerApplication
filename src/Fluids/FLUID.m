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
            obj = PropValPair_construction(obj,nargin,varargin{:});
            
            if isempty(obj.fluid_velocity)
                obj.fluid_velocity = 0;
            end            
        end
    end
end
classdef mySPHERE < SHAPE
    properties
        diameter
        radius
        
        
    end

    methods
        function obj = mySPHERE(diameter, density, position, velocity)
         
            obj@SHAPE([diameter,0,0], density, position, velocity);
            obj.diameter = obj.dimensions(1);
            obj.radius = obj.diameter/2;
            obj.surface_area = 4*pi*obj.radius^2;
            obj.volume = 4/3*pi*obj.radius^3;
            obj.planform_area = pi*obj.radius^2;
            obj.length_characteristic = obj.diameter;
            obj.mass = obj.volume*obj.shape_density;
            obj.weight = obj.mass * 9.8;
        end
        
    end
end

classdef mySPHERE < SHAPE
    properties
        diameter
        radius
        
        
    end

    methods
        function obj = mySPHERE(diameter, position, velocity, varargin)
         
            obj@SHAPE("dimensions", [diameter,0,0], ...
                "position", position, "shape_velocity", velocity);
            
            obj.diameter = obj.dimensions(1);
            obj.radius = obj.diameter/2;
            obj.surface_area = 4*pi*obj.radius^2;
            obj.volume = 4/3*pi*obj.radius^3;
            obj.planform_area = pi*obj.radius^2;
            obj.length_characteristic = obj.diameter;
            n = nargin-3;
            obj = PropValPair_construction(obj,n,varargin{:});
            if ~isempty(obj.shape_density)
                m = obj.volume*obj.shape_density;
                if isempty(obj.mass)
                    obj.mass = m;
                    obj.weight = obj.mass * 9.8;
                elseif abs(m - obj.mass) > 0.01
                    
                    error("Incompatible volume-density relationship or incorrect" + ...
                        "specified mass")
                end
            end
            
        end
        
        
    end
end

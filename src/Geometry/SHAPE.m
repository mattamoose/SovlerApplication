classdef SHAPE
    properties
        dimensions;
        surface_area;
        planform_area;
        shape_density;
        volume;
        mass;
        shape_velocity;
        position;
        length_characteristic;
        weight;
        

    end

    methods
        function obj = SHAPE(varargin)
            obj = PropValPair_construction(obj,nargin,varargin{:});
        end
           
        function obj1 = update_mass(obj)
            obj1 = obj.volume * obj.shape_density;
        end

        function obj1 = update_weight(obj)
            obj1 = 9.8 * obj.mass;
        end

        function obj = update_position(obj,copy,dt)
            if islogical(copy)
                if copy == true
                    obj.position = obj.position + obj.shape_velocity*dt;
                else
                    obj = obj.position + obj.shape_velocity*dt;
                end
            else
                error("Must define COPY:True or False")
            end
        end
    end
end
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
            if nargin >= 1
                obj.dimensions = varargin{1};
            end
            
            if nargin >= 2
                obj.shape_density = varargin{2};
            end

            if nargin >= 3
                obj.position = varargin{3};
            end

            if nargin >= 4
                obj.shape_velocity = varargin{4};
            end
        end
           
        function obj1 = update_mass(obj)
            obj1 = obj.volume * obj.shape_density;
        end

        function obj1 = update_weight(obj)
            obj1 = 9.8 * obj.mass;
        end

        function obj = update_position(obj,copy,dt)
            if islogical(copy)

                obj.position = obj.position + obj.shape_velocity*dt;

            else
                error("Must define COPY:True or False")
            end
        end
    end
end
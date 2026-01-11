classdef FSI < FLUID & SHAPE
    properties
        Structure_OBJ;
        Fluid_OBJ;
        Effective_Velocity;
        External_Reynolds;
        Force_Bouyant;
        Drag_Coefficient;
        Force_Drag;
        

    end

    methods
        function obj = FSI(aShape, aFluid)
            % get parent class properties and methods.
            
            %obj@SHAPE(aShape.dimensions, aShape.shape_density, aShape.position, ...
            %   aShape.shape_velocity);
            obj@FLUID(aFluid.fluid_density,aFluid.dynamic_viscosity,aFluid.fluid_velocity);
            
            obj.Structure_OBJ = aShape; obj.Fluid_OBJ = aFluid;
            obj.Effective_Velocity = obj.Structure_OBJ.shape_velocity ...
                - obj.Fluid_OBJ.fluid_velocity;
            obj.External_Reynolds = obj.Fluid_OBJ.fluid_density*obj.Effective_Velocity ...
                *obj.Structure_OBJ.length_characteristic / obj.Fluid_OBJ.dynamic_viscosity;
            obj.Force_Bouyant = obj.Fluid_OBJ.fluid_density*9.8*obj.Structure_OBJ.volume;
            
        end
        
        function obj1 = update_effective_velocity(obj)
            obj1 = obj.Structure_OBJ.shape_velocity - obj.Fluid_OBJ.fluid_velocity;
        end
        
        function obj1 = update_Reynolds_Ext(obj)
            obj1 = obj.Fluid_OBJ.fluid_density*obj.Effective_Velocity ...
                *obj.Structure_OBJ.length_characteristic / obj.Fluid_OBJ.dynamic_viscosity;
        end

        function obj1 = update_Force_Bouyant(obj)
            obj1 = obj.Fluid_OBJ.fluid_density*9.8*obj.Structure_OBJ.volume;
        end

        
    end
end
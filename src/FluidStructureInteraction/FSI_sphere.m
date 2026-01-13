classdef FSI_sphere < FSI
    properties
        sphere
        fluid
    

    end

    methods
        function obj = FSI_sphere(aSphere,aFluid)    

            obj@FSI(aSphere, aFluid);
            obj.sphere = aSphere; 
            obj.fluid = aFluid;
            
           
            obj.Drag_Coefficient = update_Drag_Coefficient(obj).Drag_Coefficient;
            obj.Force_Drag = update_Force_Drag(obj).Force_Drag;
 
        end

        function obj = update(obj,u)
            % Returns a copy of the instantiated object with corresponding
            %   updated values.
            obj.Effective_Velocity = u;
            obj.External_Reynolds = obj.update_Reynolds_Ext();
            obj.Drag_Coefficient = update_Drag_Coefficient(obj).Drag_Coefficient;
            obj.Force_Drag = update_Force_Drag(obj).Force_Drag;
            
        end


        function obj = update_Drag_Coefficient(obj)
            % Returns a copy of the instaniated object with updated Drag
            %      Coefficient value.
            Re = obj.External_Reynolds;
            if 0 < Re && Re < 1
               obj.Drag_Coefficient = 24/Re;
            elseif 1 <= Re && Re <= 1000
               obj.Drag_Coefficient = 24/Re*(1 + 0.15*Re^0.687);
            elseif Re <= 0
               obj.Drag_Coefficient = 0;
              
            else
               obj.Drag_Coefficient = 0.5;
            end
        end
        
        function obj = update_Force_Drag(obj)
            % Returns a copy of the instantiated object with an updated Drag
            %   Force value.
            obj.Force_Drag = obj.Drag_Coefficient * obj.fluid.fluid_density ...
               * obj.Effective_Velocity^2 * obj.sphere.planform_area;             
        end

        function obj = update_Reynolds(obj,u)
            % Returns a copy of the instantiated object with an updated
            %   Reynolds number.
            obj.External_Reynolds = u*obj.fluid.fluid_density*obj.sphere.length_characteristic ...
                / obj.fluid.dynamic_viscosity;
        end
        
        
        

    end
end
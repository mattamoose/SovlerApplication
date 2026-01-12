classdef FSI_sphere < FSI & mySPHERE
    properties
    
       
       
       
    end

    methods
        function obj = FSI_sphere(aShape,aFluid)    

            obj@FSI(aShape, aFluid);
            obj@mySPHERE(aShape.diameter, aShape.shape_density, aShape.position, ...
                aShape.shape_velocity);
           
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
            if Re < 1 && Re > 0
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
            obj.Force_Drag = obj.Drag_Coefficient * obj.fluid_density ...
               * obj.Effective_Velocity^2 * obj.planform_area;             
        end

        function obj = update_Reynolds(obj,u)
            % Returns a copy of the instantiated object with an updated
            %   Reynolds number.
            obj.External_Reynolds = u*obj.fluid_density*obj.length_characteristic ...
                / obj.dynamic_viscosity;
        end
        
        
        

    end
end
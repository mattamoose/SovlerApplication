function obj = PropValPair_construction(obj,n,varargin)
    if mod(n,2) ~= 0
                error("Arguments must be given in property-value pairs. " + ...
                    "E.g. fxn('dimension', [l,w,h])")
            else
                for ii = 1:2:n
                    prop_name = varargin{ii};
                    prop_val = varargin{ii + 1};

                    if isprop(obj,prop_name)
                        obj.(prop_name) = prop_val;
                    else
                        
                        fprintf('%s is an invalid property name. \n', string(prop_name))
                        error('^^^ Invalid Property Name ^^^')
                    end
                end
    end


             
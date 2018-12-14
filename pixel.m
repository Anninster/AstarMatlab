classdef pixel
    properties
        g
        f
        previous
        i
        j
        w
    end
    methods
        function obj= pixel(x,y)
            if nargin>0
                if isnumeric(x) && isnumeric(y)
                    obj.i=x;
                    obj.j=y;
                    obj.g=0;
                    obj.f=0;
                    obj.previous=[];
                    obj.w=0;
                else
                    error('x,y position locations should be passed')
                end
            end
        end
        
    end
end
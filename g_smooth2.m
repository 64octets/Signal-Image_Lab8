function h = g_smooth2(width)
% function h = g_smooth2(width)
%
% G_SMOOTH2  -- Produces the 2-D impulse reponse for a Gaussian
%               FIR filter with adjustable width
%
% Input Parameters:
%   width   -- specifies the standard deviation of the filter
%
% Output Parameters:
%   h       -- the resulting gaussian filter, normalized
%              so that sum(h(:)) = 1
%

% Written by Mark Bartsch, Winter 2002
% Modification History:
%    8/16/02  --  Added modification history (MB)


if width <= 0
    h = 1;
else
    x = 0:max(4*width,1);
    x = [fliplr(x) x(2:end)]';
    h = exp(-(x/width).^2/2);
    
    if length(h) > 3
        h(h < .001) = [];
    end
    h = h/sum(h);
    h = conv2(h,h');
end

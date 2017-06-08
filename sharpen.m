function out = sharpen(in,amount);
% function out = sharpen(in,amount)
%
% SHARPEN  --  Sharpens an image with varying "strength"
%
% Input Parameters:
%   in     --  the image to be sharpened
%   amount --  the "b" factor used to control the sharpening strength
%
% Output Parameters:
%   out    --  the resulting sharpened image
%

% Written by Mark Bartsch, Winter 2002
% Modification History:
%    8/16/02  --  Added modification history (MB)



h1 = [-.5; 2; -.5];
h2 = conv2(h1, h1');
h2(5) = 3;

edge = filter2(h2,in,'same');

out = edge*amount + in;
out = min(255,max(out,0));

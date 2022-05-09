% operator: \Lambda_alp R_{-\theta} \Delta
function [dx, dy] = directional_grad(im, alp, theta)
h = [-1 1]; %h = [1 -1];
dx0 = conv2(im,h); dx0 = dx0(:,2:end);
dy0 = conv2(im,h'); dy0 = dy0(2:end,:);

dx = ((cos(theta) * dx0) + (sin(theta) * dy0)) * alp;
dy = (cos(theta) * dy0) - (sin(theta) * dx0);
end

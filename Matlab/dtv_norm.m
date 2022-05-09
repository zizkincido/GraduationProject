% takes the l-2 norm of directional gradient 
% output: DTV(im)
%
function dtv = dtv_norm(im, alp, theta)
[dx, dy] = directional_grad(im, alp, theta);  
tmp = sqrt(abs(dx).^2 + abs(dy).^2);
dtv = reshape(sum(sum(tmp,1),2),[],1);
end

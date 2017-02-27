function [cropim diff]=imgcrop(ip_img)

 [r c]=find(ip_img);
 cropim=ip_img(min(r):max(r)+1,min(c):max(c)+1);
 if nargout==2
     diff=min(c);
 end
end
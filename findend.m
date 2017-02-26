function [cropline,remline,space]=findend(im,d)

temp=find(sum(im,d)==0);
endline=temp(1);
if d==2
cropline=im(1:endline,:);
remline=imgcrop(im(endline:end,:));
else
    cropline=im(:,1:endline);
[remline diff]=imgcrop(im(:,endline:end));

end
if nargout==3
    space=diff;
end
    
%clear;clc;close all;
function rectext(img)
img=im2bw(img,graythresh(img));
img=bwareaopen(img,5);km=1;
global word gg;
word=[];
%%%imshow(img)
while nnz(img)
cropimg=imgcrop(img);
[cline,img]=findend(cropimg,2);
while nnz(cline)
[cletter cline space]=findend(cline,1);
h = [0 0 0 0; 0 1 1 0;0 1 1 0;0 0 0 0];
if nnz(cletter)
cletter=imgcrop(cletter);
cletter=imresize((cletter),[42 24]);figure,imshow(cletter);
 %%%imwrite(cletter,strcat(pwd,'\db5\',num2str(km),'.bmp'));km=km+1;

corvalue=zeros(1,62);
for k=1:26
   
dbletter=imread(strcat(pwd,'\db4\',num2str(k),'.bmp'));
corvalue(k)=corr2(cletter,dbletter);
end
[maxv indx]=max(corvalue);
word=dbletters(word,indx);
if isempty(space)|| space>11
    word=[word ' '];
end

%figure,imshow(cletter)
end
end
end
%word=regexprep(word,'[^\w'']','');
word
pause(1);
%text to speech conversion
%close all;
%%sending data
disp('sending data...........................');
gg=length(word);
for k=1:gg
  
%     while(word(k)==' ');
%        word(k)=[];
%     end
   
 sercom(word(k));
pause(1);
end

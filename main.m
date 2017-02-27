clear;clc;close all;
imaqreset;
vid=videoinput('winvideo',2,'YUY2_640x480');
set(vid,'returnedcolorspace','rgb');
set(vid,'framespertrigger',inf);
set(vid,'framegrabinterval',5);
start(vid);
preview(vid);
pause;
closepreview(vid);
img=getsnapshot(vid);
stop(vid);
delete(vid);
imshow(img);
pause;
close all;
rectext(img);


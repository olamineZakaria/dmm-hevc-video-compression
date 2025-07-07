clc;
clear;
img=imread('depth_balloons_5_1.bmp');
L=size(img,1);
C=size(img,2);
s='ballons';
for i=1:16:L
	for j=1:16:C
		x=img(i:i+15,j:j+15);
		t=strcat(s,'_',num2str(i),'_',num2str(j),'_16.png');
	imwrite(x,t);
	end
	
end


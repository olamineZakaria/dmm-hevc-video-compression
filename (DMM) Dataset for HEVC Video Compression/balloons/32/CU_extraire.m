clc;
clear;
img=imread('depth_balloons_5_1.bmp');
L=size(img,1);
C=size(img,2);
s='ballons';
for i=1:32:L
	for j=1:32:C
		x=img(i:i+31,j:j+31);
		t=strcat(s,'_',num2str(i),'_',num2str(j),'_32.png');
	imwrite(x,t);
	end
	
end


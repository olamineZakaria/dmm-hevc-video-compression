clc;
clear;
img=imread('depth_balloons_5_1.bmp');
L=size(img,1);
C=size(img,2);
s='ballons';
for i=1:4:L
	for j=1:4:C
		x=img(i:i+3,j:j+3);
		t=strcat(s,'_',num2str(i),'_',num2str(j),'_4.png');
	imwrite(x,t);
	end
	
end


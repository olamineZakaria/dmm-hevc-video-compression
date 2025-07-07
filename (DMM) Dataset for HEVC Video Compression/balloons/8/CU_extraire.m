clc;
clear;
img=imread('depth_balloons_5_1.bmp');
L=size(img,1);
C=size(img,2);
s='ballons';
for i=1:8:L
	for j=1:8:C
		x=img(i:i+7,j:j+7);
		t=strcat(s,'_',num2str(i),'_',num2str(j),'_7.png');
	imwrite(x,t);
	end
	
end


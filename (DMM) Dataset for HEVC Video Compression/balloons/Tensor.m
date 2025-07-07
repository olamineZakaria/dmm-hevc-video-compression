clear;
clc;
format long;
img=imread('12.png');
%img=double(img);
L=size(img,1);
C=size(img,2);
gama=0.3;
h=fspecial('gaussian',3,gama);
A0=h(2,2);
A1=h(1,1);
A2=h(1,2);
Hx=[-1 0 1;-1 0 1;-1 0 1];
%Hy=[1 1 1;0 0 0;-1 -1 -1];
Hy=Hx';
indice=1;
n=1;
a=0;
b=0;
max=-100000000000000000000000000.0;
%subplot(2,2,1);
%imshow(img);
%img
%img1=img;
img1=double(zeros(L,C));
img2=zeros(L,C);
for i=2:L-1
	for j=2:C-1
		T11=0;
		T22=0;
		%for a=-n:n
			%for b=-n:n
				%if (i+a>=1 && i+a<=L) && (j+b>=1 && j+b<=C)
					%T11=T11+img(i+a,j+b)*Hx(a+n+1,b+n+1);
					%T22=T22+img(i+a,j+b)*Hy(a+n+1,b+n+1);
				%end
			%end
        %end
        T22=-img(i-1,j-1)-2*img(i,j-1)-img(i+1,j-1)+img(i-1,j+1)+2*img(i,j+1)+img(i+1,j+1);
        T11=-img(i-1,j-1)-2*img(i-1,j)-img(i-1,j+1)+img(i+1,j-1)+2*img(i+1,j)+img(i+1,j+1);
       % T11
       % T22
		T12=double(T11*T22);
		T22=double(T22*T22);
		T11=double(T11*T11);
        %return;
        %T11_=double(T11);
		%T12_=double(T12);
		%T22_=double(T22);
		T11_=double(A0*T11+2*T12*A2+A1*T22);
		T12_=double((A0+A1)*T12+A2*(T11+T22));
		T22_=double(A0*T22+2*A2*T12+A1*T11);
		l1=0.5*(T22_+T11_+sqrt((T22_-T11_)*(T22_-T11_)+(4*T12_*T12_)));
		%l2=0.5*(T22_+T11_-sqrt((T22_-T11_)*(T22_-T11_)+4*T12_*T12_));
		%X(indice,1)=l1;
		%X(indice,2)=l2;
		%indice=indice+1;
        if(l1~=0)
            %img1= insertShape(img1,'Rectangle',[i,j,i,i],'LineWidth',1,'Color','red');
			l1
			if(max<l1)
				max=l1;
				a=i;b=j;
			end
            img1(i,j)=l1;
        end
		%display([num2str(l1),'	',num2str(l2)]);
	end
end
for i=2:L-1
	for j=2:C-1
		if(img(i,j)<=(img(a,b)+20) && img(i,j)>=(img(a,b)-20))
			img2(i,j)=255;
		end
	end
end
subplot(1,3,1);
imshow(img);
subplot(1,3,2);
imshow(img1);
subplot(1,3,3);
imshow(img2);
%save_data(X,'Rex_3.txt',1,size(X,1));

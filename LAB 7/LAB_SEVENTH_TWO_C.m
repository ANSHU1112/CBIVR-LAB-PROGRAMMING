clc
clear all
IColor = imread('C:\Users\TEMP\Desktop\15BCE1282\3.jpg');
I = rgb2gray(IColor);
[r,c] = size(I);
G=double(I);   
PrewittH = [-1 0 1;-1 0 1;-1 0 1];%for measuring horizontal differences
PrewittV = [1 1 1;0 0 0;-1 -1 -1];%for measuring vertical differences
 
%Applying PerwittH operator
deltaH=zeros(r,c);
for i=2:r-1
    for j=2:c-1
        deltaH(i,j)=sum(sum(G(i-1:i+1,j-1:j+1).*PrewittH));
    end
end
%Modifying borders
for j=2:c-1
    deltaH(1,j)=G(1,j+1)-G(1,j);
    deltaH(r,j)=G(r,j+1)-G(r,j);  
end
for i=1:r
    deltaH(i,1)=G(i,2)-G(i,1);
    deltaH(i,c)=G(i,c)-G(i,c-1);  
end
 
%Applying PerwittV operator
deltaV=zeros(r,c);
for i=2:r-1
    for j=2:c-1
        deltaV(i,j)=sum(sum(G(i-1:i+1,j-1:j+1).*PrewittV));
    end
end
%Modifying borders
for j=1:c
    deltaV(1,j)=G(2,j)-G(1,j);
    deltaV(r,j)=G(r,j)-G(r-1,j);  
end
for i=2:r-1
    deltaV(i,1)=G(i+1,1)-G(i,1);
    deltaV(i,c)=G(i+1,c)-G(i,c);  
end
 
%Magnitude
deltaG=(abs(deltaH)+abs(deltaV))/2;
 
%Local edge direction (0<=theta<pi)
theta=zeros(r,c);
for i=1:r
    for j=1:c
        if (deltaH(i,j)==0)&&(deltaV(i,j)==0)
            theta(i,j)=0;
        elseif deltaH(i,j)==0
            theta(i,j)=pi;           
        else          
            theta(i,j)=atan(deltaV(i,j)/deltaH(i,j))+pi/2;
        end
    end
end
 
deltaGt = deltaG(:);
theta1=theta(:);
 
%Set a Threshold value for delta G
n = 16;
HD = zeros(1,n);
Threshold=12;
counti=0;
for m=0:(n-1)
    countk=0;
    for k = 1:length(deltaGt)
        if ((deltaGt(k)>=Threshold) && (theta1(k)>=(2*m-1)*pi/(2*n)) && (theta1(k)<(2*m+1)*pi/(2*n)))
            countk=countk+1;
            counti=counti+1;
        end
    end
    HD(m+1) = countk;
end
HDf = HD/counti;
figure;
plot(HDf);
title('Local Directionality Histogram HDf')
%peakdet function to find peak values
[m p]=findpeaks(HDf,0.000005);
 
Fd=0;
for np = 1:length(m)
    phaiP=m(np)*(pi/n);
    for phi=1:length(HDf)
            Fd=Fd+(phi*(pi/n)-phaiP)^2*HDf(phi);
    end
end
r = (1/n);
Fdirection = 1 - r*np*Fd

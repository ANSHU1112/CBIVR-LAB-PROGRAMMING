clc
clear all 
    IColor = imread('C:\Users\TEMP\Desktop\15BCE1282\1.jpg');
    I = rgb2gray(IColor);
    [r,c] = size(I);
    G=double(I);
    [counts,graylevels]=imhist(I);%histogram of image
    figure, imhist(I);
    title('Gray-level distribution')
    PI=counts/(r*c);
    averagevalue=sum(graylevels.*PI);%mean value
    u4=sum((graylevels-repmat(averagevalue,[256,1])).^4.*PI);%4th moment about mean
    variance=sum((graylevels-repmat(averagevalue,[256,1])).^2.*PI);%variance(2nd moment about mean)
    alpha4=u4/variance^2;%kurtosis
    %Contrast Value
    Fcontrast=sqrt(variance)/alpha4.^(1/4)
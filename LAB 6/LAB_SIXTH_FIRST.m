clc
clear all
q = imread('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 6\1.jpg');
figure, imshow(q)
imtool(q)

%Convert RGB to HSV
h = rgb2hsv(q);
figure, imshow(h)
imtool(h)

%Convert RGB to HSV
m = hsv2rgb(h)
imtool(m)
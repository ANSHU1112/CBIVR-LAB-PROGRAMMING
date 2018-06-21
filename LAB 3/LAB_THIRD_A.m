clc
clear all
a=imread('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\2.jpg');
figure, imshow(a)
title('INPUT IMAGE');
%%SIZE OF INPUT IMAGE
size(a)
%%GREYSCALE IMAGE OF INPUT IMAGE
g=rgb2gray(a);
figure, imshow(g)
title('GREYSCALE IMAGE');
%%CREATING HISTOGRAM OF THE INPUT IMAGE
figure, imhist(g)
title('HISTOGRAM');
%%CREATING ADJUST IMAGE 
adj=imadjust(g,[0.3,0.7],[]);
figure, imshow(adj)
title('ADJUST IMAGE');
%%CREATING BINARY IMAGE OF INPUT IMAGE
bi=im2bw(adj);
figure, imshow(bi)
title('BINARY IMAGE');
%%GETTING INFO OF THE INPUT IMAGE
info=imfinfo('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\2.jpg');
info
%%GETTING COLORMAP OF THE INPUT IMAGE
[IND,map] = rgb2ind(a,32);
figure('NAME','Indexed image with 32 Colors');
imshow(IND);
colormap(map)
title('COLORMAP');
%%APPLYING NOISE TO IMAGE
n=imnoise(g,'gaussian',0,0.025);
figure, imshow(n)
title('NOISE IMAGE');
%%APPLYING WIENER FILTER TO IMAGE
w=wiener2(n,[6,6]);
figure, imshow(w)
title('WIENER FILTERED IMAGE');
%%APPLYING LAPLACIAN FILTER TO IMAGE
%%creating laplacian filter
h=fspecial('laplacian');
%%aplying it 
b=imfilter(a,h);
figure, imshow(b)
title('LAPLACIAN FILTERED IMAGE');
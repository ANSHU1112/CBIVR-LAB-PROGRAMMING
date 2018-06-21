clc
clear all
q=imread('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 4\1.jpg');

%Creating channels 

redChannel = q(:, :, 1);
greenChannel = q(:, :, 2);
blueChannel = q(:, :, 3);
z = zeros(size(q), class(q));
redImage = z; redImage(:,:,1) = redChannel;
greenImage = z; greenImage(:,:,2) = greenChannel;
blueImage = z; blueImage(:,:,3) = blueChannel;

%Get histValues for each channel

[yRed, x] = imhist(redChannel);
[yGreen, x] = imhist(greenChannel);
[yBlue, x] = imhist(blueChannel);

%Getting the hist values

r = imhist(redChannel,32);
g = imhist(greenChannel,32);
b = imhist(blueChannel,32);

%%DATABASE
fr=[];
srcFiles = dir('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 4\*.jpg');
srcFiles;
for i=2:10
    d = strcat('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 4\',srcFiles(i).name);
    di = imread(d);
    
    %%Creating Channels
    
    redChannels = di(:, :, 1);
    greenChannels = di(:, :, 2);
    blueChannels = di(:, :, 3);
    zd = zeros(size(di), class(di));
    redImaged = zd; redImaged(:,:,1) = redChannels;
    greenImaged = zd; greenImaged(:,:,2) = greenChannels;
    blueImaged = zd; blueImaged(:,:,3) = blueChannels;

    %Getting the hist values

    rd = imhist(redChannels,32);
    gd = imhist(greenChannels,32);
    bd = imhist(blueChannels,32);

    rf = ((r-rd).^2)./(r+rd);
    gf = ((g-gd).^2)./(g+gd);
    bf = ((b-bd).^2)./(b+bd);
    sr = sum(rf);
    sg = sum(gf);
    sb = sum(bf);
    
    %Chi Square Distance
    
    fr(i) = mean([sr sg sb]);
end

clear min;
ra = [];
fr(1)=[];
fr;
ascen=sort(fr);
ascen;
[m,n] = size(fr);
for k=1:n
    mini=min(fr);
    ra(k)=find(fr==ascen(k))+1;
    fr;
end
ra;
for i=1:9
    name = strcat(num2str(ra(i)),'.jpg');
    filename = strcat('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 4\',name);
    result = imread(filename);
    figure;
    image(result);
end

fr
ascen
ra
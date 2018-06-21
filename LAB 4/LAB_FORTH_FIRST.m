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

%Plot them together in one plot

figure, plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');

%mean 

R=mean(r)
G=mean(g)
B=mean(b)


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

    %mean 

    Rd=mean(rd);
    Gd=mean(gd);
    Bd=mean(bd);
    
    fr(i)=abs(R-Rd);
end

ra=[];
fr(1)=[];
ascen=sort(fr);
[m, n]=size(fr);
k=1;
while(k<n+1)
    %%k
    ex=[];
    ex=find(fr==ascen(k));
    %ex
    [q, w]=size(ex);
    %%w
    
    if(w>1)
        for j=1:w
            %%ex(j)
            ra(k)=ex(j);
            k=k+1;
            %%k
        end
        k=k-1;
    elseif(w==1)
            ra(k)=ex;
    end
    
    k=k+1;
end
   
fr
ascen
ra

for i=1:9
    name = strcat(num2str(ra(i)),'.jpg');
    filename = strcat('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 4\',name);
    result = imread(filename);
   % figure;
    image(result);
end



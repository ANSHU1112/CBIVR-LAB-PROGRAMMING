clc
clear all
q=imread('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 7\1.jpg');
%figure, imshow(q)
cv=color_auto_correlogram(q,64);
h=imhist(cv,64);

%%DATABASE
fr=[];
srcFiles = dir('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 7\*.jpg');
srcFiles;
for i=2:10
    d = strcat('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 7\',srcFiles(i).name);
    di = imread(d);
    cvd=color_auto_correlogram(di,64);
    hd=imhist(cvd,64);
    
    %%Manhattan Distance
    
    fr(i) = sum(abs(h-hd));
end

ra=[];
fr(1)=[];
ascen=sort(fr);
[m, n]=size(fr);
k=1;
while(k<n+1)
    ex=[];
    ex=find(fr==ascen(k));
    [q, w]=size(ex);
    if(w>1)
        for j=1:w
            ra(k)=ex(j);
            k=k+1;
        end
        k=k-1;
    elseif(w==1)
            ra(k)=ex;
    end
    
    k=k+1;
end
   
for i=1:9
    name = strcat(num2str(ra(i)),'.jpg');
    filename = strcat('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 7\',name);
    result = imread(filename);
    figure;
    image(result);
end

fr
ascen
ra
clc
clear all
q=imread('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 4\1.jpg');

%size of query image
[x y z]=size(q);
total=x*y

%%DATABASE
fr=[];
srcFiles = dir('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 4\*.jpg');
srcFiles;
for i=2:10
    d = strcat('C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 4\',srcFiles(i).name);
    di = imread(d);
    
    %size of database image
    
    [xd yd zd]=size(di);
    totald=xd*yd
    
    fr(i)=abs(total-totald);
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


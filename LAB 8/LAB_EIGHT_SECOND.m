function glcm=exercise2(path,d)
%path is path of image
%d is displacement vector
d = 1;
path = 'C:\Users\PRIYANSHU SHARMA\Desktop\PRIYANSHU\6 STUDY\MATLAB\LAB 8\5.png';
clc
J=imread(path);
J=im2bw(J,graythresh(J));
[m,n]=size(J);
glcm=zeros(2,2);
for i=1:m
    for j=1:n-1
        if (J(i,j)==0 && J(i,j+d)==0)
            glcm(1,1)=glcm(1,1)+1;
        end
        if (J(i,j)==0 && J(i,j+d)==1)
            glcm(1,2)=glcm(1,2)+1;
        end
        if (J(i,j)==1 && J(i,j+d)==0)
            glcm(2,1)=glcm(2,1)+1;
        end
        if (J(i,j)==1 && J(i,j+d)==1)
            glcm(2,2)=glcm(2,2)+1;
        end
    end
end
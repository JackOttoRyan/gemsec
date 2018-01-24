%   before this script can be run import_image_new.m script must be run
imagetest2
figure
imshow(I);
figure
imshow(I2)
figure
imshow(bgr);
figure
surf(I(1:8:end,1:8:end));
figure
surf(I2(1:8:end,1:8:end));
figure
surf(bgr(1:8:end,1:8:end));
ini = table2array(rawAFMimage);
max=max(max(ini));
min=min(min(ini));
for i =1:512
    for j =1:512
        cor(i,j) = I2(i,j)*(max-min)+min;
    end
end
figure
surf(cor(1:8:end,1:8:end));
I3=mat2gray(cor);
figure
surf(I3(1:8:end,1:8:end));
figure
imshow(I3);
se = strel('line',80,60);
fgr1 = imopen(I3,se);
figure
imshow(fgr1);
se2 = strel('line',80,120);
fgr2 = imopen(I3,se2);
figure
imshow(fgr2);
se3 = strel('line',80,180);
fgr3 = imopen(I3,se3);
figure
imshow(fgr3);
fgr = fgr1+fgr2+fgr3;
figure
imshow(fgr);
se4 = strel('line',40,60);
fgr4 = imopen(I3,se4);
figure
imshow(fgr4);
se5 = strel('line',40,120);
fgr5 = imopen(I3,se5);
figure
imshow(fgr5);
se6 = strel('line',40,180);
fgr6 = imopen(I3,se6);
figure
imshow(fgr6);
fgr_2=fgr4+fgr5+fgr6;
figure
imshow(fgr_2);
figure
surf(fgr_2(1:8:end,1:8:end));
bw1 = imbinarize(fgr1);
bw2 = imbinarize(fgr2);
bw3 = imbinarize(fgr3);
bw1 = bwareaopen(bw1,100);
bw2 = bwareaopen(bw2,100);
bw3 = bwareaopen(bw3,100);
bw = bw1+bw2+bw3;
figure
imshow(bw);
figure
imshow(bw1);
figure
imshow(bw2);
figure
imshow(bw3);
for i =1:512
    for j =1:512
       blw(i,j)=bw1(i,j)+bw2(i,j)+bw3(i,j);
       if blw(i,j)>1
           blw(i,j)=1;
       end
       if blw(i,j)<1
           blw(i,j)=0;
       end
    end
end
figure
imshow(blw);
figure
imshow(bw);
blwh =imbinarize(I3,0.75);
imshow(blwh);
imshow(I3);
blwh =imbinarize(I3,0.5);
figure
imshow(blwh);
t =graythresh(I3);
blwh=imbinarize(I3,t);
figure
imshow(blwh);
figure
imshow(fgr1,[]);
figure
imshow(fgr1);
figure
imshow(fgr,[]);
figure
imshow(fgr);

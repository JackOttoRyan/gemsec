%   convert matrix of z values into a grayscale image
%   for function table2array(input matrix name given in import_image_new.m
I = mat2gray(table2array(rawAFMimage));
figure
imshow(I);
%   approximate background height
bgr = imopen(I,strel('rectangle',[5 250]));
figure
surf(double(bgr(1:8:end,1:8:end))), zlim auto
set(gca,'ydir','reverse');
figure
imshow(bgr);
%   remove background height from orginal grayscale image
I2=I-bgr;
figure
imshow(I2);
%   I2 is new image more leveled out image
%for i = 1:512
   % for j = 1:512
       % m(i,j) = (I2(i,j))/(I(i,j));
   % end
%end
%figure
%imshow(m);
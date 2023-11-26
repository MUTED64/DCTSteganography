pkg load signal;
pkg load image;

marked = imread('output.bmp');

gaussianwn=imnoise(marked,'gaussian',0.02);
imwrite(gaussianwn, 'gaussianwn.bmp');

H=fspecial('gaussian',[4,4],0.2); 
gaussianlp=imfilter(marked,H); 
imwrite(gaussianlp, 'gaussianlp.bmp');


cutted=marked;
cutted(1:64,1:400)=512;
imwrite(cutted, 'cutted.bmp');

rotated=imrotate(marked,10,'bilinear','crop');
imwrite(rotated, 'rotated.bmp');

scaled=imresize(marked,0.5);
imwrite(scaled, 'scaled.bmp');

imwrite(marked, 'compressed.jpg', 'Compression', 'jpeg', 'Quality', 50);
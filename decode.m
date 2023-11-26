pkg load signal;
pkg load image;

pictures = {'output.bmp', 'gaussianwn.bmp', 'gaussianlp.bmp', 'cutted.bmp', 'rotated.bmp', 'compressed.jpg'};

original_row = 480;
original_column = 640;

secret_row = 160;
secret_column = 160;

for k=1:6;
    marked = imread(pictures{k});
    marked_dcted = dct2(marked);
    secret = zeros(secret_row, secret_column);
    for i=1:secret_row;
        for j=1:secret_column;
            if marked_dcted(original_row-2*i+2, original_column-2*j+1) < marked_dcted(original_row-2*i+1, original_column-2*j+1)
                secret(i,j) = 255;
            else
                secret(i,j) = 0;
            end
        end
    end
    imwrite(uint8(secret), strcat('secret_', pictures{k}, '.bmp'));
end
pkg load signal;
pkg load image;

% Read the original image
original = imread('original.bmp');
[original_row, original_column] = size(original);

% Read the secret message image
secret = im2bw(imread('./SecretPics/secret160.bmp'));
[secret_row, secret_column] = size(secret);

img_dcted = dct2(original);
alpha = 15;

for i=1:secret_row;
    for j=1:secret_column;
        if secret(i,j)==0
            if img_dcted(original_row-2*i+2, original_column-2*j+1) < img_dcted(original_row-2*i+1, original_column-2*j+1)
                swap = img_dcted(original_row-2*i+2, original_column-2*j+1);
                img_dcted(original_row-2*i+2, original_column-2*j+1) = img_dcted(original_row-2*i+1, original_column-2*j+1);
                img_dcted(original_row-2*i+1, original_column-2*j+1) = swap;
            end
        else
            if img_dcted(original_row-2*i+2, original_column-2*j+1) > img_dcted(original_row-2*i+1, original_column-2*j+1)
                swap = img_dcted(original_row-2*i+2, original_column-2*j+1);
                img_dcted(original_row-2*i+2, original_column-2*j+1) = img_dcted(original_row-2*i+1, original_column-2*j+1);
                img_dcted(original_row-2*i+1, original_column-2*j+1) = swap;
            end
        end
        if img_dcted(original_row-2*i+2, original_column-2*j+1) < img_dcted(original_row-2*i+1, original_column-2*j+1)
            img_dcted(original_row-2*i+2, original_column-2*j+1) = img_dcted(original_row-2*i+2, original_column-2*j+1) - alpha;
            img_dcted(original_row-2*i+1, original_column-2*j+1) = img_dcted(original_row-2*i+1, original_column-2*j+1) + alpha;
        else
            img_dcted(original_row-2*i+2, original_column-2*j+1) = img_dcted(original_row-2*i+2, original_column-2*j+1) + alpha;
            img_dcted(original_row-2*i+1, original_column-2*j+1) = img_dcted(original_row-2*i+1, original_column-2*j+1) - alpha;
        end
    end
end

output = idct2(img_dcted);
imwrite(uint8(output), 'output.bmp');
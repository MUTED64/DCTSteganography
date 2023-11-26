# DCTSteganography

## Description

- `encode.m`: a simple steganography program that uses the Discrete Cosine Transform to hide a message in an image. The program takes in a secret image and a carrier image(640x480) and outputs a new image with the message hidden inside.
- `attack.m`: a program that make transformations to the encoded image to check the robustness of the encoding. The program takes in the encoded image and outputs the image after the transformation.
- `decode.m`: a program that decodes the message hidden in the encoded image. The program takes in the encoded image and outputs the hidden secret image.

## Principle

The program uses the Discrete Cosine Transform to hide a message in an image. The program uses the DCT to hide the message in the high frequency components of the image. for each pixel in the secret image, the program takes 2x2 pixels in the DCT domain of the carrier image, and choose 2 pixels of those 4 pixels, using their umerical relationships to hide the secret image pixel. the secret image is hided in the highest frequency components (bottom-right corner) of the carrier image pixels, which are the least visible to the human eye. The program then uses the inverse DCT and outputs the encoded image.

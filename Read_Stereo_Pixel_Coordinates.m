%% Load images to visualise pixel co-ordinates for left and right images taken with stereo setup.
I1 = im2gray(imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Experiment\LeftCamera\GX010007-frames\frame0-00-01.00.jpg'));
I2 = im2gray(imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Experiment\RightCamera\GX010190-frames\frame0-00-01.00.jpg'));

% Opens Image Viewer and displays the image file with file name I1 and I2. The bottom of the screen displays the pixel co-ordinates as you move the mouse over the image.
imtool(I1)
imtool(I2)

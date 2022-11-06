% Read an image from the file specified by filename, inferring the format of the file from its contents.
I1 = imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Experiment\LeftCamera\GX010009-frames\BWL.jpg');

% Display a image from a file I1.
imtool(I1)

% Estimates the area of the objects in binary image I1.
bwarea(I1)

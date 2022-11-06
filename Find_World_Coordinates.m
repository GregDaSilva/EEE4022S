%% Display world points on stereo image using matched points entered by user. I1 refers to image 1 and I2 refers to image 2.
I1 = im2gray(imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Experiment\LeftCamera\GX010007-frames\frame0-00-01.00.jpg'));
I2 = im2gray(imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Experiment\RightCamera\GX010190-frames\frame0-00-01.00.jpg'));

% Create 2 matrices for each image holding pixel locations from image 1 and its matched point from image 2
I1Box1 = [2007 1498 ; 1949 1385 ; 1900 1517; 2051 1556];
I2Box1 = [1946 1559; 1887 1447 ; 1838 1579 ;1986 1617];

% Depending on number of pixel points indicated, the following may need to be changed. Typically four matched points are expected. Matched points are broken up intotheir columns.
I1corner1 = I1Box1(1,:);
I1corner2 = I1Box1(2,:);
I1corner3 = I1Box1(3,:);
I1corner4 = I1Box1(4,:);

I2corner1 = I2Box1(1,:);
I2corner2 = I2Box1(2,:);
I2corner3 = I2Box1(3,:);
I2corner4 = I2Box1(4,:);

% Find the 3-D locations of matching pairs of undistorted image points from two stereo images.
corner1 = triangulate(I1corner1,I2corner1,stereoParams)/1000;
corner1(1,1) = sprintf("%0.2f",corner1(1,1));
corner1(1,2) = sprintf("%0.2f",corner1(1,2));
corner1(1,3) = sprintf("%0.2f",corner1(1,3));
corner2 = triangulate(I1corner2,I2corner2,stereoParams)/1000;
corner2(1,1) = sprintf("%0.2f",corner2(1,1));
corner2(1,2) = sprintf("%0.2f",corner2(1,2));
corner2(1,3) = sprintf("%0.2f",corner2(1,3));
corner3 = triangulate(I1corner3,I2corner3,stereoParams)/1000;
corner3(1,1) = sprintf("%0.2f",corner3(1,1));
corner3(1,2) = sprintf("%0.2f",corner3(1,2));
corner3(1,3) = sprintf("%0.2f",corner3(1,3));
corner4 = triangulate(I1corner4,I2corner4,stereoParams)/1000;
corner4(1,1) = sprintf("%0.2f",corner4(1,1));
corner4(1,2) = sprintf("%0.2f",corner4(1,2));
corner4(1,3) = sprintf("%0.2f",corner4(1,3));

% Insert text back onto image one to display 3D points from first matched points
position = I1corner1;
value = [num2str(corner1)];
RGB = insertText(I1,position,value);

% Insert text back onto image one to display 3D points from second matched points
position = I1corner2;
value = [num2str(corner2)];
RGB = insertText(RGB,position,value);

% Insert text back onto image one to display 3D points from third matched points
position = I1corner3;
value = [num2str(corner3)];
RGB = insertText(RGB,position,value);

% Insert text back onto image one to display 3D points from fourth matched points
position = I1corner4;
value = [num2str(corner4)];
RGB = insertText(RGB,position,value);

% Display image 1 with 3D points
figure
imshow(RGB),title('Numeric values');

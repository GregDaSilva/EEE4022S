%% Display world points on image using points entered by user
I1 = im2gray(imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Experiment\LeftCamera\GX010007-frames\frame0-00-01.00.jpg'));
I2 = im2gray(imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Experiment\RightCamera\GX010190-frames\frame0-00-01.00.jpg'));

I1Box1 = [2007 1498 ; 1949 1385 ; 1900 1517; 2051 1556];
I2Box1 = [1946 1559; 1887 1447 ; 1838 1579 ;1986 1617];

I1corner1 = I1Box1(1,:);
% I1corner2 = I1Box1(2,:);
I1corner3 = I1Box1(3,:);
% I1corner4 = I1Box1(4,:);

I2corner1 = I2Box1(1,:);
% I2corner2 = I2Box1(2,:);
I2corner3 = I2Box1(3,:);
% I2corner4 = I2Box1(4,:);


corner1 = triangulate(I1corner1,I2corner1,stereoParams)/1000;
corner1(1,1) = sprintf("%0.2f",corner1(1,1));
corner1(1,2) = sprintf("%0.2f",corner1(1,2));
corner1(1,3) = sprintf("%0.2f",corner1(1,3));
% corner2 = triangulate(I1corner2,I2corner2,stereoParams)/1000;
% corner2(1,1) = sprintf("%0.2f",corner2(1,1));
% corner2(1,2) = sprintf("%0.2f",corner2(1,2));
% corner2(1,3) = sprintf("%0.2f",corner2(1,3));
corner3 = triangulate(I1corner3,I2corner3,stereoParams)/1000;
corner3(1,1) = sprintf("%0.2f",corner3(1,1));
corner3(1,2) = sprintf("%0.2f",corner3(1,2));
corner3(1,3) = sprintf("%0.2f",corner3(1,3));
% corner4 = triangulate(I1corner4,I2corner4,stereoParams)/1000;
% corner4(1,1) = sprintf("%0.2f",corner4(1,1));
% corner4(1,2) = sprintf("%0.2f",corner4(1,2));
% corner4(1,3) = sprintf("%0.2f",corner4(1,3));

position = I1corner1;
value = [num2str(corner1)];

RGB = insertText(I1,position,value);


% position = I1corner2;
% value = [num2str(corner2)];
% RGB = insertText(RGB,position,value);

position = I1corner3;
value = [num2str(corner3)];
RGB = insertText(RGB,position,value);

% position = I1corner4;
% value = [num2str(corner4)];
% RGB = insertText(RGB,position,value);

figure
imshow(RGB),title('Numeric values');
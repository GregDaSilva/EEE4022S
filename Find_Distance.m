%% Find Distance to a point on the image
matchedPoints1 = [1957 1507];
matchedPoints2 = [1894 1568];
worldPoints = triangulate(matchedPoints1,matchedPoints2,stereoParams);
point3d = triangulate(matchedPoints1, matchedPoints2, stereoParams);
distanceInMeters = norm(point3d)/1000;

%imshowpair(I1, I2, 'montage');

%disparityMap = disparitySGM(im2gray(J1),im2gray(J2));
%figure 
%imshow(disparityMap,[0,100],'InitialMagnification',55);


distanceAsString = sprintf('%0.2f meters', distanceInMeters);
distanceAsString
 
%imshowpair(I1, I2, 'montage');
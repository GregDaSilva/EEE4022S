%% Find Distance to a matched point on the stereo image pairs.

% load pixel co-ordinates of two matched points into arrays. matchedPoints1 refer to image 1 and matchedPoints2 refer to image 2.
matchedPoints1 = [1957 1507];
matchedPoints2 = [1894 1568];

% Return the 3-D locations of matching pairs of undistorted image points from two stereo images.
worldPoints = triangulate(matchedPoints1,matchedPoints2,stereoParams);

% Return the 3-D locations of matching pairs of undistorted image points from two stereo images.
point3d = triangulate(matchedPoints1, matchedPoints2, stereoParams);

% Find distance to a point in a 3D location.
distanceInMeters = norm(point3d)/1000;

% Display stereo images overlapping one another.
imshowpair(I1, I2, 'montage');

% Format distance to two decimal places and indicate units.
distanceAsString = sprintf('%0.2f meters', distanceInMeters);

% Display distance.
disp("Distance to matched point is " + distanceAsString)

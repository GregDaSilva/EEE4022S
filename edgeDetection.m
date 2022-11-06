%% Detect pancake ice floes from an image

% read image and convert to greyscale.
I1 = im2gray(imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Agi Data\Buoy Retrievals\Buoy Retrieval - 24 July 16h00\SHARC 1\GX010181-frames\frame0-00-01.00.jpg'));

% Display image
imshow(I1)
title('Original Image');

%% Create a binary image from image I1 using name-value pairs to control aspects of adaptive thresholding.
bw = imbinarize(I1,"adaptive","ForegroundPolarity","bright");
imshow(bw)

%% Remove all connected components (objects) that have fewer than P pixels from the binary image bw, producing another binary image, bw. This operation is known as an area opening.
bw = bwareaopen(bw,500);
imshow(bw)

%%  Create a disk-shaped structuring element, where r specifies the radius and then perform morphological closing.
se = strel('disk',2);

% Perform morphological closing on the grayscale or binary image bw, using the structuring element SE. The morphological close operation is a dilation followed by an erosion, using the same structuring element for both operations.
bw = imclose(bw,se);
imshow(bw)

%% Fill holes in the input binary image bw. In this syntax, a hole is a set of background pixels that cannot be reached by filling in the background from the edge of the image.
bw = imfill(bw,'holes');
imshow(bw)

%% Traces the exterior boundaries of objects.
[B,L] = bwboundaries(bw,'noholes');

%% Detect boundaries
imshow(label2rgb(L,@jet,[.5 .5 .5]))
hold on
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2),boundary(:,1),'w','LineWidth',2)
end

%% Find roundness of detected pancakes and display values larger than the threshold.

% Measures area for each labeled region in label image L.
stats = regionprops(L,'Area','Centroid');

threshold = 0.4;

% loop over the boundaries
for k = 1:length(B)

  % obtain (X,Y) boundary coordinates corresponding to label 'k'
  boundary = B{k};

  % compute a simple estimate of the object's perimeter
  delta_sq = diff(boundary).^2;    
  perimeter = sum(sqrt(sum(delta_sq,2)));
  
  % obtain the area calculation corresponding to label 'k'
  area = stats(k).Area;
  
  % compute the roundness metric
  metric = 4*pi*area/perimeter^2;
  
  % display the results
  metric_string = sprintf('%2.2f',metric);

  % mark objects above the threshold with a black circle
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(centroid(1),centroid(2),'ko');
  end
  if metric > 0.45
  text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color','bl',...
       'FontSize',14,'FontWeight','bold')
  end
end

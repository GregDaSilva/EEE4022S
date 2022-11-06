%%
I1 = im2gray(imread('C:\Users\Donovan Da Silva\OneDrive - University of Cape Town\University\Fourth Year\EEE4022S\Agi Data\Buoy Retrievals\Buoy Retrieval - 24 July 16h00\SHARC 1\GX010181-frames\frame0-00-01.00.jpg'));
imshow(I1)
title('Original Image');
%%
bw = imbinarize(I1,"adaptive","ForegroundPolarity","bright");
imshow(bw)
%%
bw = bwareaopen(bw,500);
imshow(bw)
%%
se = strel('disk',2);
bw = imclose(bw,se);
imshow(bw)

%%
bw = imfill(bw,'holes');
imshow(bw)

%%
% bw = imfill(bw,'holes');
% imshow(bw)

%%
[B,L] = bwboundaries(bw,'noholes');

%%
imshow(label2rgb(L,@jet,[.5 .5 .5]))
hold on
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2),boundary(:,1),'w','LineWidth',2)
end

%%
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

title(['Metrics Closer to 1 Indicate that ',...
       'the Object is Approximately Round'])

% 
% [~,threshold] = edge(I1,'sobel');
% fudgeFactor = 0.6;
% BWs = edge(I1,'sobel',threshold * fudgeFactor);
% 
% imshow(BWs)
% title('Binary Gradient Mask')
% 
% se90 = strel('line',3,90);
% se0 = strel('line',3,20);
% 
% BWsdil = imdilate(BWs,[se90 se0]);
% imshow(BWsdil)
% title('Dilated Gradient Mask')
% 
% BWdfill = imfill(BWsdil,'holes');
% imshow(BWdfill)
% title('Binary Image with Filled Holes')
% 
% 
% BWnobord = imclearborder(BWdfill,26);
% imshow(BWnobord)
% title('Cleared Border Image')
% 
% seD = strel('diamond',1);
% BWfinal = imerode(BWnobord,seD);
% BWfinal = imerode(BWfinal,seD);
% imshow(BWfinal)
% title('Segmented Image');
% 
% imshow(labeloverlay(I1,BWfinal))
% title('Mask Over Original Image')
% BWoutline = bwperim(BWfinal);
% Segout = I1; 
% Segout(BWoutline) = 255; 
% imshow(Segout)
% title('Outlined Original Image')
% 

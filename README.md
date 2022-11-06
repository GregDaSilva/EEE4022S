# EEE4022S
EEE Final Year Project

This repository contains the code used for the EEE4022S Final Year Project, RAV2022-05. 
The aim of this project is to develop an image processing and parameter extraction algorithm. 
This project forms the preliminary investigation for extracting and estimating size and shape of pancake ice floes from images.

## Calibrate Stereo Set-up
This program calibrates stereo parameters using checkerboard images captured during the calibration process.\
https://github.com/GregDaSilva/EEE4022S/blob/main/Rugby_Field_StereoCamCalibrate.m

## Read Pixel Coordinates
This program is essential for the triangulation process and allows a person to read pixel coordinates from stereo image pairs.
https://github.com/GregDaSilva/EEE4022S/blob/main/Read_Stereo_Pixel_Coordinates.m

## Find Distance to a Point
THis program allows a user to enter matched pixel coordinates from stereo images and with the stereo parameters generated through calibration, the distance from the camera to the point (typically an object) can be found.
https://github.com/GregDaSilva/EEE4022S/blob/main/Find_Distance.m

## Find World Points using Stereo Parameters
This program takes in multiple matched points from stereo image pairs and produces 3D world points to determine the distance between pixel points in meters. 
This is useful in finding the size of objects.
https://github.com/GregDaSilva/EEE4022S/blob/main/Find_World_Coordinates.m

## Find Number of Shaded Pixels in Binary Image
This program allows a person to count the number of pixels in a binary image. 
These pixels are shaded as white in a binary image. Knowing the number of pixels can be useful in determining the area of an object. 
The dimensions of a pixel needs to be determined for this the area to be estimated.
https://github.com/GregDaSilva/EEE4022S/blob/main/Find_Binary_Area.m

## Extract Frames from a Video File
This program allows a user to extract frames from a video at a specified rate.
https://github.com/GregDaSilva/EEE4022S/blob/main/extract_frames_opencv.py

## Detect Pancake Ice Floes
This program takes an image from the Marginal Ice Zone (MIZ) in the Southern Ocean (SO) and outputs pancake ice floes detected in the image. 
It is best to use this program with images facing the ocean without any interferences from a ship or bright light in the sky.
https://github.com/GregDaSilva/EEE4022S/blob/main/edgeDetection.m 

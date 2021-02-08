% Programmed by Amir Monemian
% Last revision: 02-04-2021
% Takes a video input and transforms into a tiff file

workingDir = pwd; %Use current folder to create a directory

file = uigetfile('.mp4') ; %Select an MP4 file to convert to video
v = VideoReader(file); %Read in desired video file
frames = round(v.Duration*v.FrameRate); 

%Have user choose the number of frames to save
y = input(['There is ' num2str(frames) ' frames in the video, how many would you like to save? : '],'s') ; %get desired number of saved images
x = floor( frames / str2num(y) ) ; %value controls number of saved frames

%Save the frames at TIFF files
i = 1; %loop count
n = 1 ; %picture count
while i < frames
    
   img = read(v,i); %Create an image from frame i
   filename = [sprintf('T_%04d',n) '.tif']; %names the file and identifies it as a TIFF
   fullname = fullfile(workingDir, filename); %file and location
   imwrite(img,fullname) ; %writes image to location
   
   
   i = i + x;
   n = n + 1 ; 
end
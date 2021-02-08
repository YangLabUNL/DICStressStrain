function [validx,validy]=Displacement_Average(validx,validy)

%load data in case you did not load it into workspace yet
% Programmed by Amir Monemian
% Last revision: 02-04-2021

if exist('validy')==0
    [validyname,Pathvalidy] = uigetfile('*.dat','Open validy.dat');
    if validyname==0
        disp('You did not select a file!')
        return
    end
    cd(Pathvalidy);
    validy=importdata(validyname,'\t');
end

sizevalidy=size(validy);
looppoints=sizevalidy(1,1);
loopimages=sizevalidy(1,2);

%calculate the displacement relative to the first image in y
%direction

clear disply;

validyfirst=mean(validy(:,1),2)*ones(1,sizevalidy(1,2));
disply=validy-validyfirst;
clear validyfirst


ave_new_lower = -mean(disply);
save ave_new_lower.mat

plot(ave_new_lower);

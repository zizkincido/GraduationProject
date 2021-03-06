
% Specify the folder where the files live.
myFolder = '...\ARC DATABASE\Ortak';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.jpg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    %fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
    imageArray = imread(fullFileName);

  
    im = double(imageArray);
    im = im/max(im(:));
    im=rgb2gray(im);

   % figure, imshow(im)

    wmc = weightedMeanCurvature(im);
    wmc01 = rescale(wmc);

    figure, hist = histogram(wmc01,150, 'Normalization','probability');

    mwc_feature = hist.BinCounts;
 
    
    
   % J = entropy(imageArray)
    writematrix(mwc_feature,'Wmc_ARC_Cropped.csv','WriteMode','append')
   % imshow(imageArray);  % Display image.
    drawnow; % Force display to update immediately.
end








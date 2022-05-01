im = double(imread('curvy.jpg'));
im = im/max(im(:));
im=rgb2gray(im);

figure, imshow(im)

range = deg2rad(0:15:179);
dtv = zeros(1,numel(range));
i = 1;
for theta = range
    dtv(i) = dtv_norm(im, 3, theta);
    i=i+1;
end

figure, plot(rad2deg(range),dtv)

%print(dtv)
fprintf('%f\n', dtv);




% Specify the folder where the files live.
  myFolder = '..\ARC DATABASE\le_blanc';
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
    %J = entropy(imageArray)
    writematrix(dtv,'DTVnorm_matthie.csv','WriteMode','append')
   % imshow(imageArray);  % Display image.
    drawnow; % Force display to update immediately.
end

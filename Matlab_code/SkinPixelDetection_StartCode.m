%Use a Generative Model and Bayesian rule to detect skin pixels in the classroom images

%@Dr. Zhaozheng Yin, Missouri S&T, Spring 2018

clc;
clear all;
close all;
warning('off', 'Images:initSize:adjustingMag');

%file directory
trainingImageDirectory = 'C:\Users\jbn42\Desktop\ImagesJan22\';
testingImageDirectory = 'C:\Users\jbn42\Desktop\ImagesJan29\';
annotatedTrainingImageDirectory = 'C:\Users\jbn42\Desktop\ImagesJan22_annotated\';
annotatedTestingImageDirectory = 'C:\Users\jbn42\Desktop\ImagesJan29_Annotated\';

%your parameters
nDim = 255; %number of bins

%training process
if 1
    tt= cputime;
    Pr_x_given_w_equalsTo_1 = zeros(nDim,nDim,nDim);
    Pr_x_given_w_equalsTo_0 = zeros(nDim,nDim,nDim);    
    trainingImageFiles = dir(trainingImageDirectory);
    annotatedTrainingImageFiles = dir(annotatedTrainingImageDirectory);
    %initialize prior
    Pr_w_equalsTo_1 = 0;
    
    for iFile = 3:size(trainingImageFiles,1)
        %load the image and facial image regions
        origIm=imread([trainingImageDirectory trainingImageFiles(iFile).name]);    
        bwMask = imread([annotatedTrainingImageDirectory annotatedTrainingImageFiles(iFile).name]);    
        
        %visualization and generate the mask indicating the facial regions
        [nrows,ncols,~]= size(origIm);
        showIm = origIm; showIm(bwMask) = 255;
        figure; imshow(showIm,[]);

        %your code to compute prior
        Pr_w_equalsTo_1 = Pr_w_equalsTo_1 + sum(bwMask(:));

        %your code to compute likelihood
        for irow = 1:nrows
            for icol = 1:ncols
                r = origIm(irow,icol,1) + 1;
                g = origIm(irow,icol,2) + 1;
                b = origIm(irow,icol,3) + 1;
                if bwMask(irow,icol) == 1
                    Pr_x_given_w_equalsTo_1(r,g,b) = Pr_x_given_w_equalsTo_1(r,g,b) + 1;
                else
                    Pr_x_given_w_equalsTo_0(r,g,b) = Pr_x_given_w_equalsTo_0(r,g,b) + 1;
                end
            end
        end
    end
    %your code to make the prior and likehood as distributions
    Pr_w_equalsTo_1 = Pr_w_equalsTo_1 / ((size(trainingImageFiles,1)-2) * nrows * ncols);
    Pr_w_equalsTo_0 = 1 - Pr_w_equalsTo_1;
    
    Pr_x_given_w_equalsTo_1 = Pr_x_given_w_equalsTo_1 / sum(Pr_x_given_w_equalsTo_1(:));
    Pr_x_given_w_equalsTo_0 = Pr_x_given_w_equalsTo_0 / sum(Pr_x_given_w_equalsTo_0(:));
    
    disp(['traning: ' num2str(cputime-tt)]);
    save('SkinPixelDetection_TrainedProbs.mat','Pr_x_given_w_equalsTo_1','Pr_x_given_w_equalsTo_0','Pr_w_equalsTo_1','Pr_w_equalsTo_0');
end

%testing
load('SkinPixelDetection_TrainedProbs.mat','Pr_x_given_w_equalsTo_1','Pr_x_given_w_equalsTo_0','Pr_w_equalsTo_1','Pr_w_equalsTo_0');
testingFiles = dir(testingImageDirectory);
annotatedTestingImageFiles = dir(annotatedTestingImageDirectory);

%initialize TP, FP, FN
TP = zeros((size(testingFiles,1)-2),1);
FP = zeros((size(testingFiles,1)-2),1);
FN = zeros((size(testingFiles,1)-2),1);

for iFile = 3:size(testingFiles,1)
    tt = cputime;
    
    %load the image and facial image regions
    origIm=imread([testingImageDirectory testingFiles(iFile).name]);    
    [nrows, ncols,~] = size(origIm);
    gtMask = imread([annotatedTestingImageDirectory annotatedTestingImageFiles(iFile).name]);    
    
    %initialize posterior probability and detectedSkinMask
    Pr_w_equalsTo_1_given_x = zeros(nrows,ncols);
    Pr_w_equalsTo_0_given_x = zeros(nrows,ncols);
    detectedSkinMask = zeros(nrows,ncols);
    
    %your code to do the inference
    for irow = 1:nrows
        for icol = 1:ncols
            r = origIm(irow,icol,1) + 1;
            g = origIm(irow,icol,2) + 1;
            b = origIm(irow,icol,3) + 1;
            Pr_w_equalsTo_1_given_x(irow,icol) = Pr_x_given_w_equalsTo_1(r,g,b) * Pr_w_equalsTo_1;
            Pr_w_equalsTo_0_given_x(irow,icol) = Pr_x_given_w_equalsTo_0(r,g,b) * Pr_w_equalsTo_0;
            detectedSkinMask(irow,icol) = Pr_w_equalsTo_1_given_x(irow,icol) > Pr_w_equalsTo_0_given_x(irow,icol);
        end
    end

    %your code to compute the TP, FP,FN
    for irow = 1:nrows
        for icol = 1:ncols
            if detectedSkinMask(irow,icol) == true && gtMask(irow,icol) == true
                TP(iFile-2) = TP(iFile-2) + 1;
            elseif detectedSkinMask(irow,icol) - gtMask(irow,icol) == -1
                FN(iFile-2) = FN(iFile-2) + 1;
            elseif detectedSkinMask(irow,icol) - gtMask(irow,icol) == 1
                FP(iFile-2) = FP(iFile-2) + 1;
            end
        end
    end
    
    disp([num2str(iFile-2) ' testing: ' num2str(cputime-tt)]);
    
    %some visualization
    showIm = origIm; showIm(nrows*ncols+find(detectedSkinMask)) = 255;
    figure; imshow([origIm repmat(255*detectedSkinMask,[1 1 3]) showIm],[]);
end

%your code to compute the precision, recall and F-score
precision = sum(TP) / (sum(TP) + sum(FP));
recall = sum(TP) / (sum(TP) + sum(FN));
F1 = 2 * (precision * recall) / (precision + recall);


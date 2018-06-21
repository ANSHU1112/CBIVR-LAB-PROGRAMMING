srcFiles = dir('C:\Users\Kanishk\VITSEM5\CBIR\lab\lab9\*.png');
for i=1:10
    %k = i-1;
    img = imread(strcat('C:\Users\Kanishk\VITSEM5\CBIR\lab\lab9\',srcFiles(i).name));
    [hog_2x2, vis2x2] = extractHOGFeatures(img,'CellSize',[2 2]);
    [hog_4x4, vis4x4] = extractHOGFeatures(img,'CellSize',[4 4]);
    [hog_8x8, vis8x8] = extractHOGFeatures(img,'CellSize',[8 8]);
    % Show the original image
    figure;
    subplot(2,3,1:3); imshow(img);

    % Visualize the HOG features
    subplot(2,3,4);
    plot(vis2x2);
    title({'CellSize = [2 2]'; ['Length = ' num2str(length(hog_2x2))]});

    subplot(2,3,5);
    plot(vis4x4);
    title({'CellSize = [4 4]'; ['Length = ' num2str(length(hog_4x4))]});

    subplot(2,3,6);
    plot(vis8x8);
    title({'CellSize = [8 8]'; ['Length = ' num2str(length(hog_8x8))]});
end
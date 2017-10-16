alfabet = 'abcdefghijklmnopqrstuvwxyz';
datadir = '../datasets/short1';

a = dir(datadir);

file = 'im2';

fnamebild = [datadir filesep file '.jpg'];
fnamefacit = [datadir filesep file '.txt'];

bild = imread(fnamebild);
fid = fopen(fnamefacit);
facit = fgetl(fid);
% % fclose(fid);

load('C:\Users\Micke\Desktop\ocrsegments.mat')

%load classification_data

% Get training data
X = zeros(6,100); 
for i = 1:100
    X(:,i) = segment2features(S{i});
end

% Train classifier
mdl = fitcknn(X', y');

for i = 1:100
 y2 = features2class(X(:,i), mdl);
end


%% Try out the segmentation
S2 = im2segment(bild);
% followed by feature extraction for one of the segments
test = 4;
B = S2{test};

x = segment2features(B);

% followed by classification of the feature
y2 = features2class(x,mdl);

alfabet(y2);
%%
if 1==1,
    figure(1); colormap(gray);
    for k = 1:1;
        imagesc(S2{test});
        title(['Classified as class nr: ' num2str(y2) ' which corresponds to the character ' upper(alfabet(y2))]);
        %disp('tryck på en tangent');
        %pause;
    end;
end;

function [S] = im2segment(im)

% Make a binary version of the input image 
% where a pixel is 1 if its value is smaller than 255/2, 0 otherwise
[m, n] = size(im);
binary_image = zeros(m, n);
for h = 1:m 
    for w = 1:n
        if im(h,w) < 255/2 
           binary_image(h,w) = 1;
        end
    end
end

% Seperates sections in the image and labels each pixel with a section
% number
[L, num] = bwlabel(binary_image, 8);

% Creates an own image for each section
S = cell(1,5);
for kk = 1:5;
    [r, c] = find(L==kk); % Gets the cooridanates of the pixels in a section
    rc = [r c];
    new_image = zeros(m, n);
    for i = 1:size(r)
        new_image(rc(i,1), rc(i,2)) = 1;
    end
    S{kk} = new_image;
end

end
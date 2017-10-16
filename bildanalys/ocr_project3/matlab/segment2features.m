function features = segment2features(I)

% Feature 1: Longest column of 1's
cols = sum(I);
max_col = max(cols);

% Feature 2: Longest row of 1's
rows = sum(I,2);
max_row = max(rows);

% Feature 3: Total number of 1's
total_sum = sum(cols);

% Feature 4: Largest square area of 1's
largest_square = 1;
[m,n] = size(I);
for i = 1:m
    for j = 1:n
        if I(i,j) == 1
            for k = 1:10
                square = I(i:i+k, j:j+k);
                if ~isempty(find(square<1)) 
                    break
                end
                if 1+k > largest_square 
                   largest_square = 1+k;
                end
            end
        end
    end
end

% Crop the image of empty space
cropped = I;
cropped( ~any(cropped,2), : ) = [];
cropped( :, ~any(cropped,1) ) = [];  

% Feature 5: Vertical symmetry
Y = flipud(cropped);
y_similarity = cropped == Y;
y_similarity_val = length(find(y_similarity>0));
y_symmetry = y_similarity_val/numel(cropped);

% Feature 6: Horizontal symmetry
X = fliplr(cropped);
x_similarity = cropped == X;
x_similarity_val = length(find(x_similarity>0));
x_symmetry = x_similarity_val/numel(cropped);

features = [1 1 1 1 1 1]';
features(1,:) = total_sum;
features(2,:) = max_col;
features(3,:) = max_row;
features(4,:) = largest_square;
features(5,:) = y_symmetry;
features(6,:) = x_symmetry;
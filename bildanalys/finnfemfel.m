function finnfemfel
    
    % Load in the images
    load('femfel.mat')
    
    figure(3)
    image(femfel1)
    
     figure(4)
    image(femfel2)
    
    % Set parameters
    rad = 6;
    threshold = 2200;
    
    % Pad the images with 3 pixels at each side
    image1 = double(padarray(femfel1, [rad rad], 0, 'both'));
    image2 = double(padarray(femfel2, [rad rad], 0, 'both'));
    
    orgSize = size(femfel1);
    
    res = zeros(orgSize(1), orgSize(2));
    res2 = zeros(orgSize(1), orgSize(2));
    
    % Compare images 
    for x = rad+1:orgSize(2)+rad
        for y = rad+1:orgSize(1)+rad
            window1 = image1(y-rad:y+rad, x-rad:x+rad, :);
            window2 = image2(y-rad:y+rad, x-rad:x+rad, :);
            diff = sum(sum(abs(mean(window1)-mean(window2))));
            res2(y, x) = diff;
            if diff > threshold
                res(y, x) = 255;
            end
        end
    end

    % Output result
    figure(1)
    imagesc(res)
    
    figure(2)
    imagesc(res2)
    
end
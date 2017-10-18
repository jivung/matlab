function graph_cuts

    load heart_data.mat
    
    mean_background = mean(background_values);
    std_background = std(background_values);
    
    mean_chamber = mean(chamber_values);
    std_chamber = std(chamber_values);

    lambda = 2;
    
    segmented_image = segment_image(im,lambda,mean_background,std_background,mean_chamber,std_chamber);
    
    imshow(segmented_image);

end

function Theta = segment_image(im,lambda,mean_background,std_background,mean_chamber,std_chamber)
    % Calculate A
    [M,N] = size(im);
    numPixels = M*N;
    neighbors = edges8connected(M,N);
    i = neighbors(:,1);
    j = neighbors(:,2);
    A = sparse(i,j,lambda,numPixels,numPixels);
    % Calculate T
    T = [((im(:)-mean_chamber)/std_chamber).^2 ((im(:)-mean_background)/std_background).^2];
    T = sparse(T);
    % Solve minimum cut
    [E, Theta] = maxflow(A,T);
    Theta = reshape(Theta,M,N);
    Theta = double(Theta);
end
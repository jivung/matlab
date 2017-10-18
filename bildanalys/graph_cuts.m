function graph_cuts

    load heart_data.mat
    
    mean_background = mean(background_values);
    std_background = std(background_values);
    
    mean_chamber = mean(chamber_values);
    std_chamber = std(chamber_values);
    
    segment_image(im,mean_background/std_background,mean_chamber/std_chamber,1.7);

end

function segment_image(im,mu0,mu1,lambda)
    [M,N] = size(im);
    numPixels = M*N;
    neighbors = edges4connected(M,N);
    i = neighbors(:,1);
    j = neighbors(:,2);
    A = sparse(i,j,lambda,numPixels,numPixels);
    T = [(im(:)-mu1).^2 (im(:)-mu0).^2];
    T = sparse(T);
    % solve minimum cut
    [E, Theta] = maxflow(A,T);
    Theta = reshape(Theta,M,N);
    Theta = double(Theta);
    Theta

end
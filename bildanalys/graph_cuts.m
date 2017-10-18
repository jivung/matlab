function graph_cuts

    load heart_data.mat
    
    mean_background = mean(background_values);
    std_background = std(background_values);
    
    mean_chamber = mean(chamber_values);
    std_chamber = std(chamber_values);

end


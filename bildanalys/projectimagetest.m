

disp('start')
for s = 1:2
    for b = 1:3 
        mean = 0.0;
        for i = 1:400
            [up, err] = projectimage(stacks{s}(:,:,i), bases{b});
            mean = mean + err;
        end
        mean = mean/400;
        fprintf('Error mean for test set %d and basis %d = %d\n',s,b,mean);
    end
end


G = [1 0 1 0 1 0 1 0; 0 1 0 1 0 1 0 1; 0 0 1 1 0 0 1 1; 0 0 0 0 1 1 1 1];
S = [0 0 0 0; 1 0 0 0; 0 1 0 0; 1 0 1 0; 0 1 1 0; 1 0 0 1; 0 1 0 1; 1 0 1 1; 0 1 1 1];

for  i = 1:8
    for j = 1:8
        r = zeros(1, 8);
        r(i) = 1;
        if(i ~= j)
            r(j) = 1;
            e = mod(r*G', 2);
            [~,index] = ismember(e,S,'rows');
            if(index ~= 0)
                disp('Same syndrome!')
            end
        end
    end
end
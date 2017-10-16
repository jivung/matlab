fid = fopen('LifeOnMars.txt');
Txt = fscanf(fid, '%c');
fclose(fid);

Keys = unique(Txt);
Probs = zeros(numel(Keys), 1);

i = 1;
for c = Keys
   fprintf('%s (%d): %d\n', c, cast(c, 'uint8'), sum(Txt == c));
   Probs(i) = sum(Txt == c)/numel(Txt);
   i = i+1;
end

Entropy(Probs) % My entropy function created in Hand in 1


clc
clear vars
CT = zeros(512,512,122,100);
mask = CT;

for subject = 1:100

    [tmp,~] = readmha(['S0' num2tr(subject) '.mha']);
    [tmpMask,~] = readmha(['MS0' num2tr(subject) '.mha']);
    CT(:,:,:,subject) = tmp;
    mask(:,:,:,subject) = tmpMask;

end

[label,TXT,RAW]=xlsread('label.xlsx');
save('Data','CT','mask','label')
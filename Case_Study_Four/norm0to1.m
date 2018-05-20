function norm_out = norm0to1(cdata1)   
cdata1 = cdata1 - min(cdata1(:));
    norm_out = cdata1 ./ max(cdata1(:));
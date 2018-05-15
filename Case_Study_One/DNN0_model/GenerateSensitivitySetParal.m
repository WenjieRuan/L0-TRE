function [sens_set] = GenerateSensitivitySetParal(test_image,convnet,layer,...
    f0,index_f0,delta,t,subspace_set,size_row,size_col)

[new_pixel_list, ~] = permn(linspace(0,1,delta), t);
size_new_pixel_list = size(new_pixel_list,1);
size_subspace_set = size(subspace_set,1);
test_image_4d = repmat(test_image,[1,1,1,size_new_pixel_list,size_subspace_set]);

for i = 1: size_subspace_set
    subspace_linIndex = subspace_set(i,:);
    [I1,I2] = ind2sub([size_row size_col],subspace_linIndex);
    for j = 1 : t
        test_image_4d(I1(j), I2(j),:,:,i)=new_pixel_list(:,j);
    end
end

fsub_all = activations(convnet,reshape(test_image_4d,...
    [size(test_image_4d,1),size(test_image_4d,2),size(test_image_4d,3),...
    size_subspace_set*size_new_pixel_list]),layer,'OutputAs','rows');
[~,f_label] = max(fsub_all,[],2);
fsub_label = reshape(f_label,[size_new_pixel_list,size_subspace_set]);
fsub0 = fsub_all(:,index_f0);
fsub = reshape(fsub0,[size_new_pixel_list,size_subspace_set]);
[min_fsub,ind_fsub] = min(fsub);
fsub_label_sub = zeros(size_subspace_set,1);
for i = 1 : size_subspace_set
    fsub_label_sub(i,1) = fsub_label(ind_fsub(i),i);
end

sens_subspace = f0 - min_fsub;
sens_set = [subspace_set,sens_subspace',new_pixel_list(ind_fsub,:),fsub_label_sub==index_f0];
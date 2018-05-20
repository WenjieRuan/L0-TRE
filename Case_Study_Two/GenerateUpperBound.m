function [test_image_adv,pixel_modify,val_modify,f_label,adv_dis,succ_flag] = GenerateUpperBound(test_image,convnet,...
    layer, sens_set_sort,index_f0,t)
succ_flag = 0;
adv_dis = 0;
pixel_modify = sens_set_sort(1,1:t);
val_modify = sens_set_sort(1,t+2:end-1);
test_image_adv = test_image;
for i = 1: size(sens_set_sort)-1
    [I1,I2] = ind2sub(size(test_image),pixel_modify);
    for j = 1 : size(pixel_modify,2)
        test_image_adv(I1(j), I2(j))=val_modify(j);


    end
    fsub_all = activations(convnet,test_image_adv,layer,'OutputAs','rows');
    [~,f_label] = max(fsub_all);
    if f_label~=index_f0
        adv_dis = size(pixel_modify,2);
        succ_flag = 1;
        return;
    end
    A = sens_set_sort(i+1,1:t);
    [C,ia] = setdiff(A,pixel_modify);
    pixel_modify = [pixel_modify,C];
    D = sens_set_sort(i+1,t+2:end-1);
    val_modify = [val_modify,D(ia)];
end

disp('Fail to find upper bound of maximum diameter of safe L0-norm ball!');

end
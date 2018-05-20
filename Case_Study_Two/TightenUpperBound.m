function [test_image_adv,pixel_modify,f_label,adv_dis,succ_flag] = TightenUpperBound(test_image,test_image_adv,convnet,...
    layer, pixel_modify,val_modify,index_f0)

succ_flag = 0;
tighten_flag = 1;
while(tighten_flag == 1)
    tighten_flag = 0;
    k = 1;
    for i = 1:size(pixel_modify,2)
        pixel_recov = pixel_modify(k);
        [I1,I2] = ind2sub(size(test_image),pixel_recov);
        test_image_adv(I1,I2) = test_image(I1,I2);
        fsub_all = activations(convnet,test_image_adv,layer,'OutputAs','rows');
        [~,f_label] = max(fsub_all);
        if f_label~=index_f0
            pixel_modify(k) = [];
            k = k-1;
            tighten_flag = 1;
            succ_flag = 1;
        else
            test_image_adv(I1,I2) = val_modify(1);
        end
        k = k+1;
    end
end
adv_dis = size(pixel_modify,2);

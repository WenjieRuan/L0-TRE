%% iterative Search
function [saliencyMap,adv_img,adv_dis] = SaliencyMapAdversarialImageNetTimer(convnet,test_image,layer,...
    delta,maxDistance)
% clear
% clc
% load ImageNet_images_all
% XTest = imagenetall;
% %
% layer = 'fc8';
% test_image_index = 1;
% test_image = XTest(:,:,:,test_image_index);
% test_image = uint8(test_image);
% %  figure;imshow(test_image);
% convnet = alexnet();
% sz = convnet.Layers(1).InputSize;
% test_image = imresize(test_image,[sz(1),sz(2)]);
% figure;imshow(test_image);
%%
feature_test_image = activations(convnet,test_image,layer,'OutputAs','rows');

[maxVal,indmax] = max(feature_test_image);
%%
saliencyMap = zeros(size(test_image,1),size(test_image,2));
modifyMap = zeros(size(test_image));
% delta = 2;
[new_pixel_list, ~] = permn(linspace(0,255,delta), 3);
new_pixel_list = uint8(new_pixel_list');
%%
test_image_4d = repmat(test_image,[1,1,1,size(new_pixel_list,2)]);
for i = 1:size(test_image,1)
    tic
    for j = 1:size(test_image,2)
        test_image_modify = test_image_4d;
         test_image_modify(i,j,:,:) = new_pixel_list;
        feature_test_image = activations(convnet,test_image_modify,layer,'OutputAs','rows');
        [minVal,indmin] = min(feature_test_image(:,indmax));
        saliencyMap(i,j) = maxVal - minVal;
        modifyMap(i,j,:) = new_pixel_list(:,indmin);
    end
    toc
end
saliencyMap(saliencyMap<0)=0;
%% forward search
% maxDistance = 30000;
test_image_forward = test_image;
saliencyMap_forward = saliencyMap;
pixel_list_perturb = [];
for i = 1: maxDistance
    [~,I] = max(saliencyMap_forward(:));
    [I_row, I_col] = ind2sub(size(saliencyMap_forward),I);
    pixel_list_perturb = [pixel_list_perturb;I_row, I_col];
    test_image_forward(I_row,I_col,:) = modifyMap(I_row,I_col,:);
    saliencyMap_forward(I_row,I_col) = -100;
    y_test_image_forward = activations(convnet,test_image_forward,layer,'OutputAs','rows');
    [~,indmax_forward] = max(y_test_image_forward);
    if indmax_forward ~= indmax
         fprintf('\n Initial adversial L0 distance = d%\n', i);
        break;
    end
end
% i_forward = i;
% % disp(i)

%% tighten upper bound

tighten_flag = 1;
while(tighten_flag == 1)
    tighten_flag = 0;
    k = 1;
    for i = 1:size(pixel_list_perturb,1)
        I_row = pixel_list_perturb(k,1);
        I_col = pixel_list_perturb(k,2);
        test_image_forward(I_row,I_col,:) = test_image(I_row,I_col,:);
        y_test_image_tight = activations(convnet,test_image_forward,layer,'OutputAs','rows');
        [~,indmax_forward] = max(y_test_image_tight);
        if indmax_forward ~= indmax
            pixel_list_perturb(k,:) = [];
            k = k-1;
            tighten_flag = 1;
        else
            test_image_forward(I_row,I_col,:) = modifyMap(I_row,I_col,:);
        end
        k = k+1;
    end
end
adv_dis = size(pixel_list_perturb,1);
adv_img = test_image_forward;


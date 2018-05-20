% Matlab Implementation for Case Study Four on paper:
% W. Ruan, M. Wu, Y. Sun, X. Huang, D. Kroening and M. Kwiatkowska,
% Global Robustness Evaluation of Deep Neural Networks with Provable
% Guarantees for L0 Norm, arXiv:1804.05805. April 2018.
% -- Dr. Wenjie Ruan, 14 May 2018
%% This is for AlexNet

clear
clc
load ImageNet_images_all
XTest = imagenetall;
%
layer = 'fc8';
%layer = 'fc_2';
figName = 'AlexNet_';
maxDistance = 5000;
delta = 2;
convnet = alexnet();
for test_image_index = 1
    fprintf('\n Now calculate the saliency map for image index = %d\n', test_image_index);
    test_image = XTest(:,:,:,test_image_index);
    test_image = uint8(test_image);
    sz = convnet.Layers(1).InputSize;
    test_image = imresize(test_image,[sz(1),sz(2)]);
    imwrite(test_image,[figName num2str(test_image_index) '_0.png'])
    
    [saliencyMap,adv_img,adv_dis] = SaliencyMapAdversarialImageNetTimer(convnet,test_image,layer,...
        delta,maxDistance);
    
    createfigure2(saliencyMap, adv_img, ['L0 = ' num2str(adv_dis)])
    
%     saveas(gcf,[figName num2str(test_image_index) '.png']);
    saveas(gcf,[figName num2str(test_image_index) '.fig']);
    
%     imwrite(saliencyMap,[figName num2str(test_image_index) 'sal.png'])
%     imwrite(adv_img,[figName num2str(test_image_index) 'adv.png'])
    
    fprintf('\n Saliency map of Image-%d is done, final adversarial L0 distance is %d\n', test_image_index,adv_dis);
    fprintf('\n The anytime local Robustness on Image-%d is: (%4.1f , %4.1f) \n',test_image_index,(1+adv_dis)/2,(adv_dis-1)/2);
    if (adv_dis-1)/2<1
            fprintf('\n The Maximum Safe L0 norm ball on Image-%d is found: dm = %d \n',test_image_index,adv_dis-1);
    end
end


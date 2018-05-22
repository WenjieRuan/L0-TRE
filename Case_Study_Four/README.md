# L0-TRE: Case Study Four - Saliency Map and Local Robustness Evaluation for Lager-scale ImageNet DNN models

This is the Matlab implementation for Case Study Four in

Global Robustness Evaluation of Deep Neural Networks with Provable Guarantees for L0 Norm

Wenjie Ruan, Min Wu, Youcheng Sun, Xiaowei Huang, Daniel Kroening, Marta Kwiatkowska.

arXiv:1804.05805 https://arxiv.org/abs/1804.05805

# Software

Matlab 2018a

Neural Network Toolbox

Image Processing Toolbox

Parallel Computing Toolbox

install ImageNet DNN models from https://uk.mathworks.com/help/nnet/ug/pretrained-convolutional-neural-networks.html

# Sample Results
![alt text](https://github.com/L0-TRE/L0-TRE/blob/master/Documents/Capture6.PNG)
![alt text](https://github.com/L0-TRE/L0-TRE/blob/master/Documents/Capture7.PNG)

# Run

Load "ImageNet_images_all" (ImageNet images for testing), set up testing image index "index_test_image = 1", set up "convnet = alexnet()", directly run "main_AlexNet.m". 

You will get the saliency for AlexNet and adversarial L0 distance. Similarly, you can calculate for other ImageNet models by setting up different networks name on "convnet", such as "resnet50", "resnet101", etc.

Folder "ExperimentResults" contains the experimental results on Image-1 to image-13.
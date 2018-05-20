# L0-TRE: Case Study Two - Guidance for the Design of Robust DNN Architecture

This is the Matlab implementation for Case Study Two in

Global Robustness Evaluation of Deep Neural Networks with Provable Guarantees for L0 Norm

Wenjie Ruan, Min Wu, Youcheng Sun, Xiaowei Huang, Daniel Kroening, Marta Kwiatkowska.

arXiv:1804.05805 https://arxiv.org/abs/1804.05805

# Software

Matlab 2018a

Neural Network Toolbox

Image Processing Toolbox

Parallel Computing Toolbox

# Run

Set up maximum iteration "maxIter = 2", load "DNN6", set up testing image index range "index_test_image = 1:20", directly run "main.m". 

You will get the global anytime-robustness of DNN6. Similarly, you can calculate the global anytime-robustness for DNN1, DNN2, ..., DNN7, and choose the a model balancing the robustness and generalization accuracy.
# L0-TRE (L0 Norm Tensor-based Robustness Evaluation)

Global Robustness Evaluation of Deep Neural Networks with Provable Guarantees for L0 Norm

Wenjie Ruan, Min Wu, Youcheng Sun, Xiaowei Huang, Daniel Kroening, Marta Kwiatkowska.

arXiv:1804.05805 https://arxiv.org/abs/1804.05805

# Abstract
Deployment of deep neural networks (DNNs) in safety or security-critical systems demands provable guarantees on their correct behaviour. One example is the robustness of image classification decisions, defined as the invariance of the classification for a given input over a small neighbourhood of images around the input. Here we focus on the L_0 norm, and study the problem of quantifying the global robustness of a trained DNN, where global robustness is defined as the expectation of the maximum safe radius over a testing dataset. We first show that the problem is NP-hard, and then propose an approach to iteratively generate lower and upper bounds on the network's robustness. The approach is anytime, i.e., it returns intermediate bounds and robustness estimates that are gradually, but strictly, improved as the computation proceeds; tensor-based, i.e., the computation is conducted over a set of inputs simultaneously, instead of one by one, to enable efficient GPU computation; and has provable guarantees, i.e., both the bounds and the robustness estimates can converge to their optimal values. Finally, we demonstrate the utility of the proposed approach in practice to compute tight bounds by applying and adapting the anytime algorithm to a set of challenging problems, including global robustness evaluation, guidance for the design of robust DNNs, competitive L0 attacks, generation of saliency maps for model interpretability, and test generation for DNNs. We release the code of all case studies via Github.

# Sample Results
![alt text](results/ImageNet_Sample_Saliency_Map.png)
![alt text](results/CIFAR10_Sample_Adversary.png)

# Developer's Platform
python 3.6.5

keras 2.1.5

tensorflow 1.7.0

numpy 1.14.2

matplotlib 2.2.2

scipy 1.0.1

# Run
```
python main.py
```

In main.py, set ``` dataset = 'MNIST' ``` or ``` dataset = 'CIFAR10' ```

# Citation
```
@ARTICLE{2018arXiv180405805R,
   author = {{Ruan}, Wenjie and {Wu}, Min and {Sun}, Youcheng and {Huang}, Xiaowei and {Kroening}, Daniel and 
	{Kwiatkowska}, Marta},
    title = "{Global Robustness Evaluation of Deep Neural Networks with Provable Guarantees for L0 Norm}",
  journal = {ArXiv e-prints},
archivePrefix = "arXiv",
   eprint = {1804.05805},
     year = 2018,
    month = apr,
   adsurl = {http://adsabs.harvard.edu/abs/2018arXiv180405805R}
}
```

# Remark
This tool is under active development and maintenance, please feel free to contact us about any problem encountered.

Best wishes,

min.wu@cs.ox.ac.uk


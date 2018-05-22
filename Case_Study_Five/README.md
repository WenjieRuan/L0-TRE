# L0-TRE: Case Study Five - DNNs Test Case Generation

This is the Python implementation for Case Study Five in

Global Robustness Evaluation of Deep Neural Networks with Provable Guarantees for L0 Norm

Wenjie Ruan, Min Wu, Youcheng Sun, Xiaowei Huang, Daniel Kroening, Marta Kwiatkowska.

arXiv:1804.05805 https://arxiv.org/abs/1804.05805


# Sample Results
![alt text](https://github.com/L0-TRE/L0-TRE/blob/master/Documents/Capture5.PNG)


# Run

Two examples:

L-infinity norm/MNIST:
```
python MNIST_nc.py ../../saved_models/mnist_complicated.h5
```

L0 norm/CIFAR10:
```
python CIFAR10_nc.py ../../saved_models/cifar10_complicated.h5
```

This code also contains Neuron Boundary Cover coverage metric, please refer the paper "Concolic Testing for Deep Neural Networks" on https://arxiv.org/abs/1805.00089 for details.
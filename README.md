# Coursera-Machine-Learning
Example HTML:
h<sub>&theta;</sub>(x) = &theta;<sub>o</sub> x + &theta;<sub>1</sub>x
## Week 2 Notes
* Feature normalisation
  * Subtract mean = mean normalisation
  * Divide by range = feature scaling


* Learning rate
  * if cost function increases with iterations, learning rate may be too large
  * for a sufficiently small learning rate, the cost function should always decrease, but may take long to converge
  * Change range of magnitudes, eg 0.001, 0.01, 0.1, 1, 10

* Polynomial regression
  * Creates new features by combining features through multiplication, taking roots, or other mathematical functions
  * Feature normalization is important

* Gradient descent
  * O(kn<sup>2</sup>)

* Normal equation
  * &theta; = (X<sup>T</sup> X)<sup>-1</sup> X<sup>T</sup> y 
  *  Attempts to solve for derivative of cost function equal to zero
  * No need to select learning rate
  * No need to iterate
  * Need to compute (X<sup>T</sup> X)<sup>-1</sup> which can expensive to calculate, O(n<sup>3</sup>)
  * Not always invertible
    * Reasons often: Redundant features and too many features
  * Octave pinv is pseudo inverse
  * 

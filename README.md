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

## Week 3 Notes

Classification
* Linear regression with a threshold falls over when data points are not grouped nicely
  
Logistic Regression
* uses sigmoid
* h<sub>&theta;</sub>(x) = g(&theta;<sup>T</sup> x)
* g(z) = 1/(1 + e<sup>-z</sup>)
* Use polynomial for non linear decision boundaries
* The decision boundary is the line that separates the area where y = 0 and where y = 1. It is created by our hypothesis function.

Cost Function
* Non convex has many local minima,
* Convex has only one minimum
* cost function = -log(h<sub>&theta;</sub>(x)) if y = 1
* cost function = -log(1 - h<sub>&theta;</sub>(x)) if y = 0

Simplified Cost Function and Gradient Descent
* cost function = -y log(h<sub>&theta;</sub>(x)) - (1-y) log(1 - h<sub>&theta;</sub>(x))
* Update rule is exactly the same but h<sub>&theta;</sub>(x) has changed to sigmoid
* Vectorised implementation of update function:
  * &theta; := &theta; - (&alpha;&frasl;m) X<sup>T</sup> (g(X&theta;) - y)

Advanced Optimization
* Algorithms
  * Conjugate gradient
  * BFGS
  * L-BFGS
* Advantages
  * no need to pick &alpha;
  * often faster than GD
* Can use fminunc in Octave
  * needs cost function, which returns J(&theta;) and gradient for each &theta;

Multiclass Classification
* One vs all
  * Treat each class as the positive class and rest as negative class
  * Train a logistic regression classifier for each class

Regularization: the problem of overfitting
* Underfit or high bias
* Overfit or high variance: too many features, therefore fits training set too well and will fail to generalise to new data.

Reduce overfitting
* Reduce number of features: manually or model selection algorithm
* Regularization: reduces magnitude of parameters &theta;<sub>j</sub>

Regularization: Cost function
* J(&theta;) + &lambda;/m sum of &theta;<sup>2</sup>
* if &lambda; is too large, underfitting occurs, leaves h(&theta;) = &theta;<sub>0</sub>
  
Regularization: Gradient Descent
* &theta;<sub>j</sub> = &theta;<sub>j</sub>(1-&alpha;&lambda;/m)- &alpha;/m sum((h<sub>&theta;</sub>(x<sup>i</sup>) - y<sup>i</sup>)x<sup>i</sup><sub>j</sub>)

Regularization: Normal Equation
* &theta; = (X<sup>T</sup> X + &lambda;I(with I<sub>00</sub> = 0))<sup>-1</sup> X<sup>T</sup> y 

Regularization: Logistic regression
cost function = sum(-y log(h<sub>&theta;</sub>(x)) - (1-y) log(1 - h<sub>&theta;</sub>(x))) + &lambda;/m sum(&theta;<sub>j</sub><sup>2</sup>)

## Week 4 Notes
Neural Networks
* Work better for non-linear hypotheses with large feature spaces


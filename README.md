# Coursera-Machine-Learning

<style TYPE="text/css">
code.has-jax {font: inherit; font-size: 100%; background: inherit; border: inherit;}
</style>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
    tex2jax: {
        inlineMath: [['$','$'], ['\\(','\\)']],
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'] // removed 'code' entry
    }
});
MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
    for(i = 0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
    }
});
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML-full"></script>


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
  * no need to pick $\alpha$;
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
* $J(\theta) = - \frac{1}{m} \sum^{m}_{i=1}{[\log(h_{\theta}(x^{(i)})) + (1-y^{(i)})\log(1-h_{\theta}(x^{(i)}))]} + \frac{\lambda}{2m}\sum^{n}_{j=1}{\theta_{j}^{2}}$
* if $\lambda$ is too large, underfitting occurs, leaves $h(\theta) = \theta_{0}$
  
Regularization: Gradient Descent
* &theta;<sub>j</sub> = &theta;<sub>j</sub>(1-&alpha;&lambda;/m)- &alpha;/m sum((h<sub>&theta;</sub>(x<sup>i</sup>) - y<sup>i</sup>)x<sup>i</sup><sub>j</sub>)

Regularization: Normal Equation
* &theta; = (X<sup>T</sup> X + &lambda;I(with I<sub>00</sub> = 0))<sup>-1</sup> X<sup>T</sup> y 

Regularization: Logistic regression
cost function = sum(-y log(h<sub>&theta;</sub>(x)) - (1-y) log(1 - h<sub>&theta;</sub>(x))) + &lambda;/m sum(&theta;<sub>j</sub><sup>2</sup>)

## Week 4 Notes
Neural Networks
* Work better for non-linear hypotheses with large feature spaces

Model Representation
* a<sub>i</sub><sup>(j)</sup> = "Activation" of unit i in layer j
* &Theta;<sup>(j)</sup> = matrix of weights controlling function mapping from layer j to layer j + 1
* Size of &Theta;<sup>(j)</sup> = s<sub>j+1</sub> x (s<sub>j</sub> + 1)

Forward Propagation
* a<sup>(1)</sup> = x;
* z<sup>(j + 1)</sup> = &Theta;<sup>(j)</sup> a<sup>(j)</sup>
* a<sup>(j + 1)</sup> = g(z<sup>(j + 1)</sup>)
* a<sub>0</sub><sup>(j + 1)</sup> = 1

Examples and Intuitations
* AND, NOT, OR can be created using Neural Nets 

Multiclass:
* y is now a vector of binary where one row is 1 and rest are 0

## Week 5 Notes
Cost Function:
* $J(\Theta) = - \frac{1}{m} \sum_{i=1}^m \sum_{k=1}^K \left[y^{(i)}_k \log ((h_\Theta (x^{(i)}))_k) + (1 - y^{(i)}_k)\log (1 - (h_\Theta(x^{(i)}))_k)\right] + \frac{\lambda}{2m}\sum_{l=1}^{L-1} \sum_{i=1}^{s_l} \sum_{j=1}^{s_{l+1}} ( \Theta_{j,i}^{(l)})^2$

Theta Initialization
* &Theta; should not be initialised to the same value for all entries,
* Rather use random initialisation

Example:
If the dimensions of Theta1 is 10x11, Theta2 is 10x11 and Theta3 is 1x11.
```matlab
Theta1 = rand(10,11) * (2 * INIT_EPSILON) - INIT_EPSILON;
Theta2 = rand(10,11) * (2 * INIT_EPSILON) - INIT_EPSILON;
Theta3 = rand(1,11) * (2 * INIT_EPSILON) - INIT_EPSILON;
```

Putting it together:
* Features define number of inputs
* Classes define number of outputs
* More units in hidden layer is better, but more computatively expensive
* One hidden layer, if more are needed keep number of units the same

Training a Neural Network:
1. Randomly initialize the weights
2. Implement forward propagation to get hΘ(x(i)) for any x^{(i)}
3. Implement the cost function
4. Implement backpropagation to compute partial derivatives
5. Use gradient checking to confirm that your backpropagation works. Then disable gradient checking.
6. Use gradient descent or a built-in optimization function to minimize the cost function with the weights in theta.

```matlab
for i = 1:m,
   Perform forward propagation and backpropagation using example (x(i),y(i))
   (Get activations a(l) and delta terms d(l) for l = 2,...,L
```


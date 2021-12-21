           --------------------------------
           C interfaces to GALAHAD packages
           --------------------------------

GALAHAD is a freely-available library of Fortran modules that can be 
used to solve a variety of linear and nonlinear optimization problems.

As we fully appreciate that Fortran may not be the language of choice
for many practitioners, we have started to provide C interfaces 
to GALAHAD's fortran packages, using the standard Fortran ISO C bindings.
In the longer term, we hope to use these as a bridge to other 
languages such as python and Julia.

Currently there are C interfaces to the following core packages:

  uls  - common interface to a variety of popular unsymmetric linear solvers
  sls  - common interface to a variety of popular symmetric linear solvers
  sbls - precondition/solve symmetric block linear systems
  cqp  - solve convex quadratic programs using interior-point methods
  trs  - solve the trust-region subproblem using matrix factorization
  gltr - solve the trust-region subproblem using matrix-vector products
  rqs  - solve the reqgularized quadratic subproblem using matrix factorization
  glrt - solve the reqgularized quadratic subproblem using matrix vector prods
  lstr - solve the least-squares trust-region subproblem using mat-vect prods
  lsrt - solve the regularized least-squares subproblem using mat-vect prods
  l2rt - solve the regularized l_2 norm subproblem using matrix-vector prods
  tru  - solve unconstrained optimization problems using trust-region methods
  arc  - solve unconstrained optimization problems using regularization methods
  nls  - find the smallest Euclidean norm of a vector-valued function  
  trb  - solve bound constrained optimization problems by a trust-region method

as well as the forthcoming

  ugo  - univariate global optimization
  bgo  - bound-constrained multivariate global optimization using multistart
  dgo  - bound-constrained multivariate global optimization using boundings

Documentation is available (via Doxygen) as package-specific PDF files,
html web documents and man pages. For a package named ${pack}, look at

  $GALAHAD/doc/${pack}_c.pdf
  $GALAHAD/html/C/${pack}.html
  $GALAHAD/man/man3/${pack}.3

respectively.

To use the packages, users should first build GALAHAD as usual.
The interface routine to the package named ${pack} is in

  $GALAHAD/src/${pack}/C/${pack}_iface.f90

and the associated C header file is in 

  $GALAHAD/include/${pack}.h

Examples of use (in which both C or Fortran indexing are allowed) are 
provided in

  $GALAHAD/src/${pack}/C/${pack}t.c
  $GALAHAD/src/${pack}/C/${pack}tf.c

To compile, link and run these examples, issue the commands

  make -f $GALAHAD/makefiles/# ${pack}dt

(C 0-based indexing) or 

  make -f $GALAHAD/makefiles/# ${pack}dt

(Fortran 1-based indexing), where # is the name of the required 
"architecture" as described in the main GALAHAD README. With luck,
this should provide a template for users' actual problems.

The list of packages supported will extend as time goes on,
but if you have a particular need, please let us know and
we will do our best to prioritise it ... some interfaces
are trickier than others!

Nick Gould  (nick.gould@stfc.ac.uk)
Jari Fowkes (jaroslav.fowkes@stfc.ac.uk)

For GALAHAD productions
7 December 2021
This version: 16 December 2021
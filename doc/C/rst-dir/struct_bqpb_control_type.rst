.. index:: pair: struct; bqpb_control_type
.. _doxid-structbqpb__control__type:

bqpb_control_type structure
---------------------------

.. toctree::
	:hidden:


.. ref-code-block:: cpp
	:class: doxyrest-overview-code-block

	#include <galahad_bqpb.h>
	
	struct bqpb_control_type {
		// components
	
		bool :ref:`f_indexing<doxid-structbqpb__control__type_1a6e8421b34d6b85dcb33c1dd0179efbb3>`;
		int :ref:`error<doxid-structbqpb__control__type_1a11614f44ef4d939bdd984953346a7572>`;
		int :ref:`out<doxid-structbqpb__control__type_1aa8000eda101cade7c6c4b913fce0cc9c>`;
		int :ref:`print_level<doxid-structbqpb__control__type_1a12dae630bd8f5d2d00f6a86d652f5c81>`;
		int :ref:`start_print<doxid-structbqpb__control__type_1ae0eb21dc79b53664e45ce07c9109b3aa>`;
		int :ref:`stop_print<doxid-structbqpb__control__type_1a9a3d9960a04602d2a18009c82ae2124e>`;
		int :ref:`maxit<doxid-structbqpb__control__type_1ab717630b215f0362699acac11fb3652c>`;
		int :ref:`infeas_max<doxid-structbqpb__control__type_1af7d33b88b67b2366d7e2df31d42083a9>`;
		int :ref:`muzero_fixed<doxid-structbqpb__control__type_1ab62ab11b934e2380467d5bafe2aaacfb>`;
		int :ref:`restore_problem<doxid-structbqpb__control__type_1a19f10912888ac7ebd153fb21baaeaefa>`;
		int :ref:`indicator_type<doxid-structbqpb__control__type_1a5abba51271587463f528b0cbdb478141>`;
		int :ref:`arc<doxid-structbqpb__control__type_1a30b5726116ac85ea64777e5d6e333894>`;
		int :ref:`series_order<doxid-structbqpb__control__type_1a67cdd80087746b1190369ae6ed303b25>`;
		int :ref:`sif_file_device<doxid-structbqpb__control__type_1a65c6f8382f1e75cd0b8abd5d148188d0>`;
		int :ref:`qplib_file_device<doxid-structbqpb__control__type_1a580c343e54a25a2d687782410c9b6917>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`infinity<doxid-structbqpb__control__type_1a11a46bd456ea63bac8bdffb056fe98c9>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`stop_abs_p<doxid-structbqpb__control__type_1a3749f9dcb2eeb60815a18c85a7d7d440>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`stop_rel_p<doxid-structbqpb__control__type_1a068065b9d50d5b222fbc8710d530bd9e>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`stop_abs_d<doxid-structbqpb__control__type_1a67b6a7be5dbfa34e9db4c960943fe31f>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`stop_rel_d<doxid-structbqpb__control__type_1ab479c27e2044c310e8d0c86869ea2307>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`stop_abs_c<doxid-structbqpb__control__type_1a1ed92b5ffb35957c5a8a0e657e312820>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`stop_rel_c<doxid-structbqpb__control__type_1a5c131e3b6061c09670e9c1959b6585a3>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`perturb_h<doxid-structbqpb__control__type_1a6006c0e78071581da195ca8dd6d1d6e1>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`prfeas<doxid-structbqpb__control__type_1a09a0a5771a0300078ebe5f344ef4e492>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`dufeas<doxid-structbqpb__control__type_1a2ac34c5838499ed4992037655f52134a>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`muzero<doxid-structbqpb__control__type_1a8f4661dd5869e1555ba329b4bd535b4d>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`tau<doxid-structbqpb__control__type_1aa6fb9757f95c75d1a32c5132e939d238>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`gamma_c<doxid-structbqpb__control__type_1a80165efc96729e34ab1ae75223dac718>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`gamma_f<doxid-structbqpb__control__type_1a9ce8b2b646d97d4f0c1485bd8842f198>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`reduce_infeas<doxid-structbqpb__control__type_1aaac67273a340e9f96523583bfdce4c59>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`obj_unbounded<doxid-structbqpb__control__type_1a7eed67e26bc4e17ca334031b7fd608a6>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`potential_unbounded<doxid-structbqpb__control__type_1a0c5882a8efc33627a50dce09db1ba40a>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`identical_bounds_tol<doxid-structbqpb__control__type_1abc74ac9bbf6375075f8943aac6ee09e4>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`mu_lunge<doxid-structbqpb__control__type_1a32eb4d353d409b46521eb28008a74c36>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`indicator_tol_p<doxid-structbqpb__control__type_1a9f245bb23cea009fc7a95d86ebe57ddd>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`indicator_tol_pd<doxid-structbqpb__control__type_1aa131ce5e639e5601d1b61fb540ac7187>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`indicator_tol_tapia<doxid-structbqpb__control__type_1abf4fb7dcdbaa9f729af1f063d357000a>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`cpu_time_limit<doxid-structbqpb__control__type_1a52f14ff3f85e6805f2373eef5d0f3dfd>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`clock_time_limit<doxid-structbqpb__control__type_1ab05d7c2b06d3a9fb085fa3739501d1c8>`;
		bool :ref:`remove_dependencies<doxid-structbqpb__control__type_1ae17a6b550239434c639239ddf45bc1ad>`;
		bool :ref:`treat_zero_bounds_as_general<doxid-structbqpb__control__type_1a59b23877e9c8cb49f1f6261e24660295>`;
		bool :ref:`treat_separable_as_general<doxid-structbqpb__control__type_1af120d649c006553a2388ef56acc9099a>`;
		bool :ref:`just_feasible<doxid-structbqpb__control__type_1a1337f1d22b070690c78f25f7ecaf1e96>`;
		bool :ref:`getdua<doxid-structbqpb__control__type_1ae31443582be206db6b858b35e1fff00b>`;
		bool :ref:`puiseux<doxid-structbqpb__control__type_1a444d111a9f28a15760d75b6ff7eb0131>`;
		bool :ref:`every_order<doxid-structbqpb__control__type_1a64cb389e65df8d4add9bc97debd32c69>`;
		bool :ref:`feasol<doxid-structbqpb__control__type_1a2d28372a45268cac881a4586c4e875d6>`;
		bool :ref:`balance_initial_complentarity<doxid-structbqpb__control__type_1a88bfd9dc0be7872a0bc1ae611d4d1173>`;
		bool :ref:`crossover<doxid-structbqpb__control__type_1a479e35eaf4aeb8b4d0c2d5fe2e4196c4>`;
		bool :ref:`space_critical<doxid-structbqpb__control__type_1a957fc1f4f26eeef3b0951791ff972e8d>`;
		bool :ref:`deallocate_error_fatal<doxid-structbqpb__control__type_1a58a2c67fad6e808e8365eff67700cba5>`;
		bool :ref:`generate_sif_file<doxid-structbqpb__control__type_1aa75b3a16d146c0d7ad57bf9817033843>`;
		bool :ref:`generate_qplib_file<doxid-structbqpb__control__type_1ad226b26090e539cf47228ba5ec7dc08d>`;
		char :ref:`sif_file_name<doxid-structbqpb__control__type_1aaa95e830b709da79d9790471bab54193>`[31];
		char :ref:`qplib_file_name<doxid-structbqpb__control__type_1a3d36354e9f30d642f8b081ba85d777d3>`[31];
		char :ref:`prefix<doxid-structbqpb__control__type_1a1dc05936393ba705f516a0c275df4ffc>`[31];
		struct fdc_control_type :ref:`fdc_control<doxid-structbqpb__control__type_1a7bef6e4f678e16a4dcdc40677efddd80>`;
		struct sbls_control_type :ref:`sbls_control<doxid-structbqpb__control__type_1a04ba974b3c8d21137deb070d0e8dfc3a>`;
		struct fit_control_type :ref:`fit_control<doxid-structbqpb__control__type_1a4b2e99077c510333b6b2a6f0b59114b9>`;
		struct roots_control_type :ref:`roots_control<doxid-structbqpb__control__type_1a08df6708e7b5364ff3e8fbde29f29014>`;
		struct cro_control_type :ref:`cro_control<doxid-structbqpb__control__type_1a7fbe482405119bceefb8480356d6bd43>`;
	};
.. _details-structbqpb__control__type:

detailed documentation
----------------------

control derived type as a C struct

components
~~~~~~~~~~

.. index:: pair: variable; f_indexing
.. _doxid-structbqpb__control__type_1a6e8421b34d6b85dcb33c1dd0179efbb3:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool f_indexing

use C or Fortran sparse matrix indexing

.. index:: pair: variable; error
.. _doxid-structbqpb__control__type_1a11614f44ef4d939bdd984953346a7572:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int error

error and warning diagnostics occur on stream error

.. index:: pair: variable; out
.. _doxid-structbqpb__control__type_1aa8000eda101cade7c6c4b913fce0cc9c:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int out

general output occurs on stream out

.. index:: pair: variable; print_level
.. _doxid-structbqpb__control__type_1a12dae630bd8f5d2d00f6a86d652f5c81:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int print_level

the level of output required is specified by print_level

* :math:`\leq` 0 gives no output,

* = 1 gives a one-line summary for every iteration,

* = 2 gives a summary of the inner iteration for each iteration,

* :math:`\geq` 3 gives increasingly verbose (debugging) output

.. index:: pair: variable; start_print
.. _doxid-structbqpb__control__type_1ae0eb21dc79b53664e45ce07c9109b3aa:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int start_print

any printing will start on this iteration

.. index:: pair: variable; stop_print
.. _doxid-structbqpb__control__type_1a9a3d9960a04602d2a18009c82ae2124e:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int stop_print

any printing will stop on this iteration

.. index:: pair: variable; maxit
.. _doxid-structbqpb__control__type_1ab717630b215f0362699acac11fb3652c:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int maxit

at most maxit inner iterations are allowed

.. index:: pair: variable; infeas_max
.. _doxid-structbqpb__control__type_1af7d33b88b67b2366d7e2df31d42083a9:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int infeas_max

the number of iterations for which the overall infeasibility of the problem is not reduced by at least a factor .reduce_infeas before the problem is flagged as infeasible (see reduce_infeas)

.. index:: pair: variable; muzero_fixed
.. _doxid-structbqpb__control__type_1ab62ab11b934e2380467d5bafe2aaacfb:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int muzero_fixed

the initial value of the barrier parameter will not be changed for the first muzero_fixed iterations

.. index:: pair: variable; restore_problem
.. _doxid-structbqpb__control__type_1a19f10912888ac7ebd153fb21baaeaefa:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int restore_problem

indicate whether and how much of the input problem should be restored on output. Possible values are

* 0 nothing restored

* 1 scalar and vector parameters

* 2 all parameters

.. index:: pair: variable; indicator_type
.. _doxid-structbqpb__control__type_1a5abba51271587463f528b0cbdb478141:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int indicator_type

specifies the type of indicator function used. Pssible values are

* 1 primal indicator: a constraint is active if and only if the distance to its nearest bound :math:`\leq`.indicator_p_tol

* 2 primal-dual indicator: a constraint is active if and only if the distance to its nearest bound :math:`\leq`.indicator_tol_pd \* size of corresponding multiplier

* 3 primal-dual indicator: a constraint is active if and only if the distance to its nearest bound :math:`\leq`.indicator_tol_tapia \* distance to same bound at previous iteration

.. index:: pair: variable; arc
.. _doxid-structbqpb__control__type_1a30b5726116ac85ea64777e5d6e333894:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int arc

which residual trajectory should be used to aim from the current iterate to the solution. Possible values are

* 1 the Zhang linear residual trajectory

* 2 the Zhao-Sun quadratic residual trajectory

* 3 the Zhang arc ultimately switching to the Zhao-Sun residual trajectory

* 4 the mixed linear-quadratic residual trajectory

* 5 the Zhang arc ultimately switching to the mixed linear-quadratic residual trajectory

.. index:: pair: variable; series_order
.. _doxid-structbqpb__control__type_1a67cdd80087746b1190369ae6ed303b25:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int series_order

the order of (Taylor/Puiseux) series to fit to the path data

.. index:: pair: variable; sif_file_device
.. _doxid-structbqpb__control__type_1a65c6f8382f1e75cd0b8abd5d148188d0:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int sif_file_device

specifies the unit number to write generated SIF file describing the current problem

.. index:: pair: variable; qplib_file_device
.. _doxid-structbqpb__control__type_1a580c343e54a25a2d687782410c9b6917:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int qplib_file_device

specifies the unit number to write generated QPLIB file describing the current problem

.. index:: pair: variable; infinity
.. _doxid-structbqpb__control__type_1a11a46bd456ea63bac8bdffb056fe98c9:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` infinity

any bound larger than infinity in modulus will be regarded as infinite

.. index:: pair: variable; stop_abs_p
.. _doxid-structbqpb__control__type_1a3749f9dcb2eeb60815a18c85a7d7d440:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` stop_abs_p

the required absolute and relative accuracies for the primal infeasibility

.. index:: pair: variable; stop_rel_p
.. _doxid-structbqpb__control__type_1a068065b9d50d5b222fbc8710d530bd9e:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` stop_rel_p

see stop_abs_p

.. index:: pair: variable; stop_abs_d
.. _doxid-structbqpb__control__type_1a67b6a7be5dbfa34e9db4c960943fe31f:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` stop_abs_d

the required absolute and relative accuracies for the dual infeasibility

.. index:: pair: variable; stop_rel_d
.. _doxid-structbqpb__control__type_1ab479c27e2044c310e8d0c86869ea2307:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` stop_rel_d

see stop_abs_d

.. index:: pair: variable; stop_abs_c
.. _doxid-structbqpb__control__type_1a1ed92b5ffb35957c5a8a0e657e312820:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` stop_abs_c

the required absolute and relative accuracies for the complementarity

.. index:: pair: variable; stop_rel_c
.. _doxid-structbqpb__control__type_1a5c131e3b6061c09670e9c1959b6585a3:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` stop_rel_c

see stop_abs_c

.. index:: pair: variable; perturb_h
.. _doxid-structbqpb__control__type_1a6006c0e78071581da195ca8dd6d1d6e1:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` perturb_h

.perturb_h will be added to the Hessian

.. index:: pair: variable; prfeas
.. _doxid-structbqpb__control__type_1a09a0a5771a0300078ebe5f344ef4e492:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` prfeas

initial primal variables will not be closer than .prfeas from their bounds

.. index:: pair: variable; dufeas
.. _doxid-structbqpb__control__type_1a2ac34c5838499ed4992037655f52134a:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` dufeas

initial dual variables will not be closer than .dufeas from their bounds

.. index:: pair: variable; muzero
.. _doxid-structbqpb__control__type_1a8f4661dd5869e1555ba329b4bd535b4d:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` muzero

the initial value of the barrier parameter. If muzero is not positive, it will be reset to an appropriate value

.. index:: pair: variable; tau
.. _doxid-structbqpb__control__type_1aa6fb9757f95c75d1a32c5132e939d238:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` tau

the weight attached to primal-dual infeasibility compared to complementa when assessing step acceptance

.. index:: pair: variable; gamma_c
.. _doxid-structbqpb__control__type_1a80165efc96729e34ab1ae75223dac718:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` gamma_c

individual complementarities will not be allowed to be smaller than gamma_c times the average value

.. index:: pair: variable; gamma_f
.. _doxid-structbqpb__control__type_1a9ce8b2b646d97d4f0c1485bd8842f198:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` gamma_f

the average complementarity will not be allowed to be smaller than gamma_f times the primal/dual infeasibility

.. index:: pair: variable; reduce_infeas
.. _doxid-structbqpb__control__type_1aaac67273a340e9f96523583bfdce4c59:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` reduce_infeas

if the overall infeasibility of the problem is not reduced by at least a factor .reduce_infeas over .infeas_max iterations, the problem is flagged as infeasible (see infeas_max)

.. index:: pair: variable; obj_unbounded
.. _doxid-structbqpb__control__type_1a7eed67e26bc4e17ca334031b7fd608a6:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` obj_unbounded

if the objective function value is smaller than obj_unbounded, it will be flagged as unbounded from below.

.. index:: pair: variable; potential_unbounded
.. _doxid-structbqpb__control__type_1a0c5882a8efc33627a50dce09db1ba40a:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` potential_unbounded

if W=0 and the potential function value is smaller than .potential_unbounded :math:`\ast` number of one-sided bounds, the analytic center will be flagged as unbounded

.. index:: pair: variable; identical_bounds_tol
.. _doxid-structbqpb__control__type_1abc74ac9bbf6375075f8943aac6ee09e4:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` identical_bounds_tol

any pair of constraint bounds :math:`(c_l,c_u)` or :math:`(x_l,x_u)` that are closer than .identical_bounds_tol will be reset to the average of their values

.. index:: pair: variable; mu_lunge
.. _doxid-structbqpb__control__type_1a32eb4d353d409b46521eb28008a74c36:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` mu_lunge

start terminal extrapolation when mu reaches mu_lunge

.. index:: pair: variable; indicator_tol_p
.. _doxid-structbqpb__control__type_1a9f245bb23cea009fc7a95d86ebe57ddd:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` indicator_tol_p

if .indicator_type = 1, a constraint/bound will be deemed to be active if and only if the distance to its nearest bound :math:`\leq`.indicator_p_tol

.. index:: pair: variable; indicator_tol_pd
.. _doxid-structbqpb__control__type_1aa131ce5e639e5601d1b61fb540ac7187:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` indicator_tol_pd

if .indicator_type = 2, a constraint/bound will be deemed to be active if and only if the distance to its nearest bound :math:`\leq`.indicator_tol_pd \* size of corresponding multiplier

.. index:: pair: variable; indicator_tol_tapia
.. _doxid-structbqpb__control__type_1abf4fb7dcdbaa9f729af1f063d357000a:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` indicator_tol_tapia

if .indicator_type = 3, a constraint/bound will be deemed to be active if and only if the distance to its nearest bound :math:`\leq`.indicator_tol_tapia \* distance to same bound at previous iteration

.. index:: pair: variable; cpu_time_limit
.. _doxid-structbqpb__control__type_1a52f14ff3f85e6805f2373eef5d0f3dfd:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` cpu_time_limit

the maximum CPU time allowed (-ve means infinite)

.. index:: pair: variable; clock_time_limit
.. _doxid-structbqpb__control__type_1ab05d7c2b06d3a9fb085fa3739501d1c8:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` clock_time_limit

the maximum elapsed clock time allowed (-ve means infinite)

.. index:: pair: variable; remove_dependencies
.. _doxid-structbqpb__control__type_1ae17a6b550239434c639239ddf45bc1ad:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool remove_dependencies

the equality constraints will be preprocessed to remove any linear dependencies if true

.. index:: pair: variable; treat_zero_bounds_as_general
.. _doxid-structbqpb__control__type_1a59b23877e9c8cb49f1f6261e24660295:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool treat_zero_bounds_as_general

any problem bound with the value zero will be treated as if it were a general value if true

.. index:: pair: variable; treat_separable_as_general
.. _doxid-structbqpb__control__type_1af120d649c006553a2388ef56acc9099a:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool treat_separable_as_general

if .just_feasible is true, the algorithm will stop as soon as a feasible point is found. Otherwise, the optimal solution to the problem will be found

.. index:: pair: variable; just_feasible
.. _doxid-structbqpb__control__type_1a1337f1d22b070690c78f25f7ecaf1e96:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool just_feasible

if .treat_separable_as_general, is true, any separability in the problem structure will be ignored

.. index:: pair: variable; getdua
.. _doxid-structbqpb__control__type_1ae31443582be206db6b858b35e1fff00b:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool getdua

if .getdua, is true, advanced initial values are obtained for the dual variables

.. index:: pair: variable; puiseux
.. _doxid-structbqpb__control__type_1a444d111a9f28a15760d75b6ff7eb0131:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool puiseux

decide between Puiseux and Taylor series approximations to the arc

.. index:: pair: variable; every_order
.. _doxid-structbqpb__control__type_1a64cb389e65df8d4add9bc97debd32c69:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool every_order

try every order of series up to series_order?

.. index:: pair: variable; feasol
.. _doxid-structbqpb__control__type_1a2d28372a45268cac881a4586c4e875d6:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool feasol

if .feasol is true, the final solution obtained will be perturbed so that variables close to their bounds are moved onto these bounds

.. index:: pair: variable; balance_initial_complentarity
.. _doxid-structbqpb__control__type_1a88bfd9dc0be7872a0bc1ae611d4d1173:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool balance_initial_complentarity

if .balance_initial_complentarity is true, the initial complemetarity is required to be balanced

.. index:: pair: variable; crossover
.. _doxid-structbqpb__control__type_1a479e35eaf4aeb8b4d0c2d5fe2e4196c4:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool crossover

if .crossover is true, cross over the solution to one defined by linearly-independent constraints if possible

.. index:: pair: variable; space_critical
.. _doxid-structbqpb__control__type_1a957fc1f4f26eeef3b0951791ff972e8d:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool space_critical

if .space_critical true, every effort will be made to use as little space as possible. This may result in longer computation time

.. index:: pair: variable; deallocate_error_fatal
.. _doxid-structbqpb__control__type_1a58a2c67fad6e808e8365eff67700cba5:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool deallocate_error_fatal

if .deallocate_error_fatal is true, any array/pointer deallocation error will terminate execution. Otherwise, computation will continue

.. index:: pair: variable; generate_sif_file
.. _doxid-structbqpb__control__type_1aa75b3a16d146c0d7ad57bf9817033843:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool generate_sif_file

if .generate_sif_file is .true. if a SIF file describing the current problem is to be generated

.. index:: pair: variable; generate_qplib_file
.. _doxid-structbqpb__control__type_1ad226b26090e539cf47228ba5ec7dc08d:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool generate_qplib_file

if .generate_qplib_file is .true. if a QPLIB file describing the current problem is to be generated

.. index:: pair: variable; sif_file_name
.. _doxid-structbqpb__control__type_1aaa95e830b709da79d9790471bab54193:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	char sif_file_name[31]

name of generated SIF file containing input problem

.. index:: pair: variable; qplib_file_name
.. _doxid-structbqpb__control__type_1a3d36354e9f30d642f8b081ba85d777d3:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	char qplib_file_name[31]

name of generated QPLIB file containing input problem

.. index:: pair: variable; prefix
.. _doxid-structbqpb__control__type_1a1dc05936393ba705f516a0c275df4ffc:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	char prefix[31]

all output lines will be prefixed by .prefix(2:LEN(TRIM(.prefix))-1) where .prefix contains the required string enclosed in quotes, e.g. "string" or 'string'

.. index:: pair: variable; fdc_control
.. _doxid-structbqpb__control__type_1a7bef6e4f678e16a4dcdc40677efddd80:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct fdc_control_type fdc_control

control parameters for FDC

.. index:: pair: variable; sbls_control
.. _doxid-structbqpb__control__type_1a04ba974b3c8d21137deb070d0e8dfc3a:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct sbls_control_type sbls_control

control parameters for SBLS

.. index:: pair: variable; fit_control
.. _doxid-structbqpb__control__type_1a4b2e99077c510333b6b2a6f0b59114b9:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct fit_control_type fit_control

control parameters for FIT

.. index:: pair: variable; roots_control
.. _doxid-structbqpb__control__type_1a08df6708e7b5364ff3e8fbde29f29014:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct roots_control_type roots_control

control parameters for ROOTS

.. index:: pair: variable; cro_control
.. _doxid-structbqpb__control__type_1a7fbe482405119bceefb8480356d6bd43:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct cro_control_type cro_control

control parameters for CRO

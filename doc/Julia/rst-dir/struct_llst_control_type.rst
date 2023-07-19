.. index:: pair: table; llst_control_type
.. _doxid-structllst__control__type:

llst_control_type structure
---------------------------

.. toctree::
	:hidden:

.. ref-code-block:: cpp
	:class: doxyrest-overview-code-block

	#include <galahad_llst.h>
	
	struct llst_control_type {
		// fields
	
		bool :ref:`f_indexing<doxid-structllst__control__type_1a6e8421b34d6b85dcb33c1dd0179efbb3>`;
		int :ref:`error<doxid-structllst__control__type_1a11614f44ef4d939bdd984953346a7572>`;
		int :ref:`out<doxid-structllst__control__type_1aa8000eda101cade7c6c4b913fce0cc9c>`;
		int :ref:`print_level<doxid-structllst__control__type_1a12dae630bd8f5d2d00f6a86d652f5c81>`;
		int :ref:`new_a<doxid-structllst__control__type_1a7bea45d51fd9384037bbbf82f7750ce6>`;
		int :ref:`new_s<doxid-structllst__control__type_1a2b6594b40a418a477a825143c48da0e9>`;
		int :ref:`max_factorizations<doxid-structllst__control__type_1a49cdbb7627ab58da229da6ccb3034bb7>`;
		int :ref:`taylor_max_degree<doxid-structllst__control__type_1a338fa3956816be173e13bfd4198c4078>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`initial_multiplier<doxid-structllst__control__type_1ae8d08df3ba4988681cb5f7c33a20f287>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`lower<doxid-structllst__control__type_1a965ee2cfb38687d6f158d35586595eed>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`upper<doxid-structllst__control__type_1ab8b6572a40141ada6d5f0455eb806d41>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`stop_normal<doxid-structllst__control__type_1a3573530258a38cc836b106b9f7a54565>`;
		bool :ref:`equality_problem<doxid-structllst__control__type_1a86fd5b4cf421b63f8d908f27cf2c60bb>`;
		bool :ref:`use_initial_multiplier<doxid-structllst__control__type_1a4d2667d00744ca0f4cc3a2e19bfaae17>`;
		bool :ref:`space_critical<doxid-structllst__control__type_1a957fc1f4f26eeef3b0951791ff972e8d>`;
		bool :ref:`deallocate_error_fatal<doxid-structllst__control__type_1a58a2c67fad6e808e8365eff67700cba5>`;
		char :ref:`definite_linear_solver<doxid-structllst__control__type_1a9b46b7a8e0af020499e645bef711f634>`[31];
		char :ref:`prefix<doxid-structllst__control__type_1a1dc05936393ba705f516a0c275df4ffc>`[31];
		struct :ref:`sbls_control_type<doxid-structsbls__control__type>` :ref:`sbls_control<doxid-structllst__control__type_1a04ba974b3c8d21137deb070d0e8dfc3a>`;
		struct :ref:`sls_control_type<doxid-structsls__control__type>` :ref:`sls_control<doxid-structllst__control__type_1a31b308b91955ee385daacc3de00f161b>`;
		struct :ref:`ir_control_type<doxid-structir__control__type>` :ref:`ir_control<doxid-structllst__control__type_1ab87f601227d3bf99916ff3caa3413404>`;
	};
.. _details-structllst__control__type:

detailed documentation
----------------------

control derived type as a C struct

components
~~~~~~~~~~

.. index:: pair: variable; f_indexing
.. _doxid-structllst__control__type_1a6e8421b34d6b85dcb33c1dd0179efbb3:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool f_indexing

use C or Fortran sparse matrix indexing

.. index:: pair: variable; error
.. _doxid-structllst__control__type_1a11614f44ef4d939bdd984953346a7572:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int error

unit for error messages

.. index:: pair: variable; out
.. _doxid-structllst__control__type_1aa8000eda101cade7c6c4b913fce0cc9c:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int out

unit for monitor output

.. index:: pair: variable; print_level
.. _doxid-structllst__control__type_1a12dae630bd8f5d2d00f6a86d652f5c81:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int print_level

controls level of diagnostic output

.. index:: pair: variable; new_a
.. _doxid-structllst__control__type_1a7bea45d51fd9384037bbbf82f7750ce6:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int new_a

how much of :math:`A` has changed since the previous call. Possible values are

* 0 unchanged

* 1 values but not indices have changed

* 2 values and indices have changed

.. index:: pair: variable; new_s
.. _doxid-structllst__control__type_1a2b6594b40a418a477a825143c48da0e9:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int new_s

how much of :math:`S` has changed since the previous call. Possible values are

* 0 unchanged

* 1 values but not indices have changed

* 2 values and indices have changed

.. index:: pair: variable; max_factorizations
.. _doxid-structllst__control__type_1a49cdbb7627ab58da229da6ccb3034bb7:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int max_factorizations

the maximum number of factorizations (=iterations) allowed. -ve implies no limit

.. index:: pair: variable; taylor_max_degree
.. _doxid-structllst__control__type_1a338fa3956816be173e13bfd4198c4078:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int taylor_max_degree

maximum degree of Taylor approximant allowed (<= 3)

.. index:: pair: variable; initial_multiplier
.. _doxid-structllst__control__type_1ae8d08df3ba4988681cb5f7c33a20f287:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` initial_multiplier

initial estimate of the Lagrange multipler

.. index:: pair: variable; lower
.. _doxid-structllst__control__type_1a965ee2cfb38687d6f158d35586595eed:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` lower

lower and upper bounds on the multiplier, if known

.. index:: pair: variable; upper
.. _doxid-structllst__control__type_1ab8b6572a40141ada6d5f0455eb806d41:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` upper

see lower

.. index:: pair: variable; stop_normal
.. _doxid-structllst__control__type_1a3573530258a38cc836b106b9f7a54565:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` stop_normal

stop when :math:`| \|x\| -` radius :math:`| \leq` max( stop_normal \* max( 1, radius )

.. index:: pair: variable; equality_problem
.. _doxid-structllst__control__type_1a86fd5b4cf421b63f8d908f27cf2c60bb:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool equality_problem

is the solution is <b<required to lie on the boundary (i.e., is the constraint an equality)?

.. index:: pair: variable; use_initial_multiplier
.. _doxid-structllst__control__type_1a4d2667d00744ca0f4cc3a2e19bfaae17:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool use_initial_multiplier

ignore initial_multiplier?

.. index:: pair: variable; space_critical
.. _doxid-structllst__control__type_1a957fc1f4f26eeef3b0951791ff972e8d:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool space_critical

if space is critical, ensure allocated arrays are no bigger than needed

.. index:: pair: variable; deallocate_error_fatal
.. _doxid-structllst__control__type_1a58a2c67fad6e808e8365eff67700cba5:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool deallocate_error_fatal

exit if any deallocation fails

.. index:: pair: variable; definite_linear_solver
.. _doxid-structllst__control__type_1a9b46b7a8e0af020499e645bef711f634:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	char definite_linear_solver[31]

definite linear equation solver

.. index:: pair: variable; prefix
.. _doxid-structllst__control__type_1a1dc05936393ba705f516a0c275df4ffc:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	char prefix[31]

all output lines will be prefixed by prefix(2:LEN(TRIM(.prefix))-1) where prefix contains the required string enclosed in quotes, e.g. "string" or 'string'

.. index:: pair: variable; sbls_control
.. _doxid-structllst__control__type_1a04ba974b3c8d21137deb070d0e8dfc3a:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct :ref:`sbls_control_type<doxid-structsbls__control__type>` sbls_control

control parameters for the symmetric factorization and related linear solves (see sbls_c documentation)

.. index:: pair: variable; sls_control
.. _doxid-structllst__control__type_1a31b308b91955ee385daacc3de00f161b:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct :ref:`sls_control_type<doxid-structsls__control__type>` sls_control

control parameters for the factorization of S and related linear solves (see sls_c documentation)

.. index:: pair: variable; ir_control
.. _doxid-structllst__control__type_1ab87f601227d3bf99916ff3caa3413404:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct :ref:`ir_control_type<doxid-structir__control__type>` ir_control

control parameters for iterative refinement for definite system solves (see ir_c documentation)

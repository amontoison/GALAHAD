.. index:: pair: table; llst_inform_type
.. _doxid-structllst__inform__type:

llst_inform_type structure
--------------------------

.. toctree::
	:hidden:

.. ref-code-block:: cpp
	:class: doxyrest-overview-code-block

	#include <galahad_llst.h>
	
	struct llst_inform_type {
		// fields
	
		int :ref:`status<doxid-structllst__inform__type_1a6e27f49150e9a14580fb313cc2777e00>`;
		int :ref:`alloc_status<doxid-structllst__inform__type_1a4335d5f44067aca76d5fff71eeb7d381>`;
		int :ref:`factorizations<doxid-structllst__inform__type_1a9a6a5a0de7d7a6048b4170a768c0c86f>`;
		int :ref:`len_history<doxid-structllst__inform__type_1a2087c1ee7c5859aa738d2f07ba91b4a6>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`r_norm<doxid-structllst__inform__type_1ae908410fabf891cfd89626c3605c38ca>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`x_norm<doxid-structllst__inform__type_1a32b3ba51ed1b0d7941f34e736da26ae3>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`multiplier<doxid-structllst__inform__type_1ac8bfb1ed777319ef92b7039c66f9a9b0>`;
		char :ref:`bad_alloc<doxid-structllst__inform__type_1a19ba64e8444ca3672abd157e4f1303a3>`[81];
		struct :ref:`llst_time_type<doxid-structllst__time__type>` :ref:`time<doxid-structllst__inform__type_1a10b8942e28c4ade61bd53f705e70b05f>`;
		struct :ref:`llst_history_type<doxid-structllst__history__type>` :ref:`history<doxid-structllst__inform__type_1a486763b587db55dd7984ae315c4a6513>`[100];
		struct sbls_inform_type :ref:`sbls_inform<doxid-structllst__inform__type_1a7e7617645ca9908f4f75e5216bb7cf68>`;
		struct sls_inform_type :ref:`sls_inform<doxid-structllst__inform__type_1a0a9d7a6860aca6894830ccaabe3ceac0>`;
		struct ir_inform_type :ref:`ir_inform<doxid-structllst__inform__type_1ae3db15e2ecf7454c4db293d5b30bc7f5>`;
	};
.. _details-structllst__inform__type:

detailed documentation
----------------------

inform derived type as a C struct

components
~~~~~~~~~~

.. index:: pair: variable; status
.. _doxid-structllst__inform__type_1a6e27f49150e9a14580fb313cc2777e00:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int status

reported return status:

* 0 the solution has been found

* -1 an array allocation has failed

* -2 an array deallocation has failed

* -3 n and/or Delta is not positive

* -10 the factorization of :math:`K(\lambda)` failed

* -15 :math:`S` does not appear to be strictly diagonally dominant

* -16 ill-conditioning has prevented furthr progress

.. index:: pair: variable; alloc_status
.. _doxid-structllst__inform__type_1a4335d5f44067aca76d5fff71eeb7d381:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int alloc_status

STAT value after allocate failure.

.. index:: pair: variable; factorizations
.. _doxid-structllst__inform__type_1a9a6a5a0de7d7a6048b4170a768c0c86f:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int factorizations

the number of factorizations performed

.. index:: pair: variable; len_history
.. _doxid-structllst__inform__type_1a2087c1ee7c5859aa738d2f07ba91b4a6:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int len_history

the number of (:math:`\|x\|_S`, :math:`\lambda`) pairs in the history

.. index:: pair: variable; r_norm
.. _doxid-structllst__inform__type_1ae908410fabf891cfd89626c3605c38ca:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` r_norm

corresponding value of the two-norm of the residual, :math:`\|A x(\lambda) - b\|`

.. index:: pair: variable; x_norm
.. _doxid-structllst__inform__type_1a32b3ba51ed1b0d7941f34e736da26ae3:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` x_norm

the S-norm of x, :math:`\|x\|_S`

.. index:: pair: variable; multiplier
.. _doxid-structllst__inform__type_1ac8bfb1ed777319ef92b7039c66f9a9b0:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` multiplier

the Lagrange multiplier corresponding to the trust-region constraint

.. index:: pair: variable; bad_alloc
.. _doxid-structllst__inform__type_1a19ba64e8444ca3672abd157e4f1303a3:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	char bad_alloc[81]

name of array which provoked an allocate failure

.. index:: pair: variable; time
.. _doxid-structllst__inform__type_1a10b8942e28c4ade61bd53f705e70b05f:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct :ref:`llst_time_type<doxid-structllst__time__type>` time

time information

.. index:: pair: variable; history
.. _doxid-structllst__inform__type_1a486763b587db55dd7984ae315c4a6513:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct :ref:`llst_history_type<doxid-structllst__history__type>` history[100]

history information

.. index:: pair: variable; sbls_inform
.. _doxid-structllst__inform__type_1a7e7617645ca9908f4f75e5216bb7cf68:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct sbls_inform_type sbls_inform

information from the symmetric factorization and related linear solves (see sbls_c documentation)

.. index:: pair: variable; sls_inform
.. _doxid-structllst__inform__type_1a0a9d7a6860aca6894830ccaabe3ceac0:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct sls_inform_type sls_inform

information from the factorization of S and related linear solves (see sls_c documentation)

.. index:: pair: variable; ir_inform
.. _doxid-structllst__inform__type_1ae3db15e2ecf7454c4db293d5b30bc7f5:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct ir_inform_type ir_inform

information from the iterative refinement for definite system solves (see ir_c documentation)

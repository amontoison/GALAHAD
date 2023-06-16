.. index:: pair: struct; tru_inform_type
.. _doxid-structtru__inform__type:

tru_inform_type structure
-------------------------

.. toctree::
	:hidden:


.. ref-code-block:: cpp
	:class: doxyrest-overview-code-block

	#include <galahad_tru.h>
	
	struct tru_inform_type {
		// components
	
		int :ref:`status<doxid-structtru__inform__type_1a6e27f49150e9a14580fb313cc2777e00>`;
		int :ref:`alloc_status<doxid-structtru__inform__type_1a4335d5f44067aca76d5fff71eeb7d381>`;
		char :ref:`bad_alloc<doxid-structtru__inform__type_1a19ba64e8444ca3672abd157e4f1303a3>`[81];
		int :ref:`iter<doxid-structtru__inform__type_1aab6f168571c2073e01e240524b8a3da0>`;
		int :ref:`cg_iter<doxid-structtru__inform__type_1ad37cf7ad93af3413bc01b6515aad692a>`;
		int :ref:`f_eval<doxid-structtru__inform__type_1aa9c29d7119d66d8540900c7531b2dcfa>`;
		int :ref:`g_eval<doxid-structtru__inform__type_1acd459eb95ff0f2d74e9cc3931d8e5469>`;
		int :ref:`h_eval<doxid-structtru__inform__type_1af1410cb1718f2a083dd8a7dee9ab643a>`;
		int :ref:`factorization_max<doxid-structtru__inform__type_1a97dadabf3b7bdf921c4dcd1f43129f05>`;
		int :ref:`factorization_status<doxid-structtru__inform__type_1aa448fed9eb03e70d5a03300b4fbbf210>`;
		int64_t :ref:`max_entries_factors<doxid-structtru__inform__type_1a177e429e737cfa2cd3df051a65fcfb68>`;
		int64_t :ref:`factorization_integer<doxid-structtru__inform__type_1a29cd3a5b0f30227170f825116d9ade9e>`;
		int64_t :ref:`factorization_real<doxid-structtru__inform__type_1ad73643c24d3cd34c356c3ccd2ebfb1cc>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`factorization_average<doxid-structtru__inform__type_1a42d0c89df887685f68327d07c6e92f05>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`obj<doxid-structtru__inform__type_1a0cbcb28977ac1f47ab67d27e4216626d>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`norm_g<doxid-structtru__inform__type_1ae1bc0a751c6ede62421bbc49fbe7d9fe>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`radius<doxid-structtru__inform__type_1a72757b6410f755f008e2fb6d711b61be>`;
		struct :ref:`tru_time_type<doxid-structtru__time__type>` :ref:`time<doxid-structtru__inform__type_1a5df9a5b97fb9ee0f6e9c620ffa1719e7>`;
		struct trs_inform_type :ref:`trs_inform<doxid-structtru__inform__type_1aa7996c925462c655f2b3dd5a5da22c21>`;
		struct gltr_inform_type :ref:`gltr_inform<doxid-structtru__inform__type_1a27a98844f05f18669d3dd60d3e6a8e46>`;
		struct dps_inform_type :ref:`dps_inform<doxid-structtru__inform__type_1aec61ddb290b679c265693de171a6394f>`;
		struct psls_inform_type :ref:`psls_inform<doxid-structtru__inform__type_1a57ca5ed37882eb917736f845d3cdb8ee>`;
		struct lms_inform_type :ref:`lms_inform<doxid-structtru__inform__type_1a6428cf213f8c899aa1bfb1fc3d24f37d>`;
		struct lms_inform_type :target:`lms_inform_prec<doxid-structtru__inform__type_1a2040147e726e4ad18ef6d81d8339644e>`;
		struct sec_inform_type :ref:`sec_inform<doxid-structtru__inform__type_1a1f95673cb76837c5eb47d773aedefb94>`;
		struct sha_inform_type :ref:`sha_inform<doxid-structtru__inform__type_1a196d9da91c7ed4a67aa6e009e336e101>`;
	};
.. _details-structtru__inform__type:

detailed documentation
----------------------

inform derived type as a C struct

components
~~~~~~~~~~

.. index:: pair: variable; status
.. _doxid-structtru__inform__type_1a6e27f49150e9a14580fb313cc2777e00:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int status

return status. See TRU_solve for details

.. index:: pair: variable; alloc_status
.. _doxid-structtru__inform__type_1a4335d5f44067aca76d5fff71eeb7d381:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int alloc_status

the status of the last attempted allocation/deallocation

.. index:: pair: variable; bad_alloc
.. _doxid-structtru__inform__type_1a19ba64e8444ca3672abd157e4f1303a3:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	char bad_alloc[81]

the name of the array for which an allocation/deallocation error occurred

.. index:: pair: variable; iter
.. _doxid-structtru__inform__type_1aab6f168571c2073e01e240524b8a3da0:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int iter

the total number of iterations performed

.. index:: pair: variable; cg_iter
.. _doxid-structtru__inform__type_1ad37cf7ad93af3413bc01b6515aad692a:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int cg_iter

the total number of CG iterations performed

.. index:: pair: variable; f_eval
.. _doxid-structtru__inform__type_1aa9c29d7119d66d8540900c7531b2dcfa:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int f_eval

the total number of evaluations of the objective function

.. index:: pair: variable; g_eval
.. _doxid-structtru__inform__type_1acd459eb95ff0f2d74e9cc3931d8e5469:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int g_eval

the total number of evaluations of the gradient of the objective function

.. index:: pair: variable; h_eval
.. _doxid-structtru__inform__type_1af1410cb1718f2a083dd8a7dee9ab643a:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int h_eval

the total number of evaluations of the Hessian of the objective function

.. index:: pair: variable; factorization_max
.. _doxid-structtru__inform__type_1a97dadabf3b7bdf921c4dcd1f43129f05:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int factorization_max

the maximum number of factorizations in a sub-problem solve

.. index:: pair: variable; factorization_status
.. _doxid-structtru__inform__type_1aa448fed9eb03e70d5a03300b4fbbf210:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int factorization_status

the return status from the factorization

.. index:: pair: variable; max_entries_factors
.. _doxid-structtru__inform__type_1a177e429e737cfa2cd3df051a65fcfb68:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int64_t max_entries_factors

the maximum number of entries in the factors

.. index:: pair: variable; factorization_integer
.. _doxid-structtru__inform__type_1a29cd3a5b0f30227170f825116d9ade9e:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int64_t factorization_integer

the total integer workspace required for the factorization

.. index:: pair: variable; factorization_real
.. _doxid-structtru__inform__type_1ad73643c24d3cd34c356c3ccd2ebfb1cc:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int64_t factorization_real

the total real workspace required for the factorization

.. index:: pair: variable; factorization_average
.. _doxid-structtru__inform__type_1a42d0c89df887685f68327d07c6e92f05:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` factorization_average

the average number of factorizations per sub-problem solve

.. index:: pair: variable; obj
.. _doxid-structtru__inform__type_1a0cbcb28977ac1f47ab67d27e4216626d:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` obj

the value of the objective function at the best estimate of the solution determined by the package.

.. index:: pair: variable; norm_g
.. _doxid-structtru__inform__type_1ae1bc0a751c6ede62421bbc49fbe7d9fe:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` norm_g

the norm of the gradient of the objective function at the best estimate of the solution determined by the package.

.. index:: pair: variable; radius
.. _doxid-structtru__inform__type_1a72757b6410f755f008e2fb6d711b61be:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` radius

the current value of the trust-region radius

.. index:: pair: variable; time
.. _doxid-structtru__inform__type_1a5df9a5b97fb9ee0f6e9c620ffa1719e7:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct :ref:`tru_time_type<doxid-structtru__time__type>` time

timings (see above)

.. index:: pair: variable; trs_inform
.. _doxid-structtru__inform__type_1aa7996c925462c655f2b3dd5a5da22c21:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct trs_inform_type trs_inform

inform parameters for TRS

.. index:: pair: variable; gltr_inform
.. _doxid-structtru__inform__type_1a27a98844f05f18669d3dd60d3e6a8e46:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct gltr_inform_type gltr_inform

inform parameters for GLTR

.. index:: pair: variable; dps_inform
.. _doxid-structtru__inform__type_1aec61ddb290b679c265693de171a6394f:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct dps_inform_type dps_inform

inform parameters for DPS

.. index:: pair: variable; psls_inform
.. _doxid-structtru__inform__type_1a57ca5ed37882eb917736f845d3cdb8ee:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct psls_inform_type psls_inform

inform parameters for PSLS

.. index:: pair: variable; lms_inform
.. _doxid-structtru__inform__type_1a6428cf213f8c899aa1bfb1fc3d24f37d:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct lms_inform_type lms_inform

inform parameters for LMS

.. index:: pair: variable; sec_inform
.. _doxid-structtru__inform__type_1a1f95673cb76837c5eb47d773aedefb94:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct sec_inform_type sec_inform

inform parameters for SEC

.. index:: pair: variable; sha_inform
.. _doxid-structtru__inform__type_1a196d9da91c7ed4a67aa6e009e336e101:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	struct sha_inform_type sha_inform

inform parameters for SHA

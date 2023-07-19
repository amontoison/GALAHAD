.. index:: pair: table; gltr_inform_type
.. _doxid-structgltr__inform__type:

gltr_inform_type structure
--------------------------

.. toctree::
	:hidden:

.. ref-code-block:: cpp
	:class: doxyrest-overview-code-block

	#include <galahad_gltr.h>
	
	struct gltr_inform_type {
		// fields
	
		int :ref:`status<doxid-structgltr__inform__type_1a6e27f49150e9a14580fb313cc2777e00>`;
		int :ref:`alloc_status<doxid-structgltr__inform__type_1a4335d5f44067aca76d5fff71eeb7d381>`;
		char :ref:`bad_alloc<doxid-structgltr__inform__type_1a19ba64e8444ca3672abd157e4f1303a3>`[81];
		int :ref:`iter<doxid-structgltr__inform__type_1aab6f168571c2073e01e240524b8a3da0>`;
		int :ref:`iter_pass2<doxid-structgltr__inform__type_1aa69f8ea5f07782fd8ad0318f87202ac4>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`obj<doxid-structgltr__inform__type_1a0cbcb28977ac1f47ab67d27e4216626d>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`multiplier<doxid-structgltr__inform__type_1ac8bfb1ed777319ef92b7039c66f9a9b0>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`mnormx<doxid-structgltr__inform__type_1aa5b12f6f4e64db98b3b3124843bd2300>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`piv<doxid-structgltr__inform__type_1ae510f054ecee0c67f8ce7f27aacba706>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`curv<doxid-structgltr__inform__type_1a806444f848eb77d1e9949ed514236679>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`rayleigh<doxid-structgltr__inform__type_1a080c2a87dc956afa2fb3eb5bde7b21f0>`;
		:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` :ref:`leftmost<doxid-structgltr__inform__type_1ab90b7ed1b1bfb32aeba7ad89a9a706d0>`;
		bool :ref:`negative_curvature<doxid-structgltr__inform__type_1aee928a2d12ccd5c99a5f3e65e9926021>`;
		bool :ref:`hard_case<doxid-structgltr__inform__type_1a22215075b7081ccac9f121daf07a0f7e>`;
	};
.. _details-structgltr__inform__type:

detailed documentation
----------------------

inform derived type as a C struct

components
~~~~~~~~~~

.. index:: pair: variable; status
.. _doxid-structgltr__inform__type_1a6e27f49150e9a14580fb313cc2777e00:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int status

return status. See :ref:`gltr_solve_problem <doxid-galahad__gltr_8h_1ad77040d245e6bc307d13ea0cec355f18>` for details

.. index:: pair: variable; alloc_status
.. _doxid-structgltr__inform__type_1a4335d5f44067aca76d5fff71eeb7d381:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int alloc_status

the status of the last attempted allocation/deallocation

.. index:: pair: variable; bad_alloc
.. _doxid-structgltr__inform__type_1a19ba64e8444ca3672abd157e4f1303a3:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	char bad_alloc[81]

the name of the array for which an allocation/deallocation error occurred

.. index:: pair: variable; iter
.. _doxid-structgltr__inform__type_1aab6f168571c2073e01e240524b8a3da0:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int iter

the total number of iterations required

.. index:: pair: variable; iter_pass2
.. _doxid-structgltr__inform__type_1aa69f8ea5f07782fd8ad0318f87202ac4:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	int iter_pass2

the total number of pass-2 iterations required if the solution lies on the trust-region boundary

.. index:: pair: variable; obj
.. _doxid-structgltr__inform__type_1a0cbcb28977ac1f47ab67d27e4216626d:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` obj

the value of the quadratic function

.. index:: pair: variable; multiplier
.. _doxid-structgltr__inform__type_1ac8bfb1ed777319ef92b7039c66f9a9b0:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` multiplier

the Lagrange multiplier corresponding to the trust-region constraint

.. index:: pair: variable; mnormx
.. _doxid-structgltr__inform__type_1aa5b12f6f4e64db98b3b3124843bd2300:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` mnormx

the :math:`M` -norm of :math:`x`

.. index:: pair: variable; piv
.. _doxid-structgltr__inform__type_1ae510f054ecee0c67f8ce7f27aacba706:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` piv

the latest pivot in the Cholesky factorization of the Lanczos tridiagona

.. index:: pair: variable; curv
.. _doxid-structgltr__inform__type_1a806444f848eb77d1e9949ed514236679:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` curv

the most negative cuurvature encountered

.. index:: pair: variable; rayleigh
.. _doxid-structgltr__inform__type_1a080c2a87dc956afa2fb3eb5bde7b21f0:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` rayleigh

the current Rayleigh quotient

.. index:: pair: variable; leftmost
.. _doxid-structgltr__inform__type_1ab90b7ed1b1bfb32aeba7ad89a9a706d0:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	:ref:`real_wp_<doxid-galahad__precision_8h_1ab82133d435678ff159433d2e50cf295e>` leftmost

an estimate of the leftmost generalized eigenvalue of the pencil :math:`(H,M)`

.. index:: pair: variable; negative_curvature
.. _doxid-structgltr__inform__type_1aee928a2d12ccd5c99a5f3e65e9926021:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool negative_curvature

was negative curvature encountered ?

.. index:: pair: variable; hard_case
.. _doxid-structgltr__inform__type_1a22215075b7081ccac9f121daf07a0f7e:

.. ref-code-block:: cpp
	:class: doxyrest-title-code-block

	bool hard_case

did the hard case occur ?

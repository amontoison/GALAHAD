RPD
===

.. module:: galahad.rpd

The ``rpd`` package **reads and writes** quadratic programming
(and related) problem data to and from a QPLIB-format data file.
Variables may be continuous, binary or integer.

**Currently only the options and inform dictionaries are exposed**; these are 
provided and used by other GALAHAD packages with Python interfaces.

See Section 4 of $GALAHAD/doc/rpd.pdf for a brief description of the
method employed and other details.

functions
---------

   .. function:: rpd.initialize()

      Set default option values and initialize private data.

      **Returns:**

      options : dict
        dictionary containing default control options:
          error : int
             error and warning diagnostics occur on stream error.
          out : int
             general output occurs on stream out.
          qplib : int
             QPLIB file input stream number.
          error : int
             error and warning diagnostics occur on stream error.
          out : int
             general output occurs on stream out.
          print_level : int
             the level of output required is specified by print_level.
             Possible values are

             * **<=0**

               gives no output,

             * **>=1**

               gives increasingly verbose (debugging) output.

          space_critical : bool
             if ``space_critical`` True, every effort will be made to
             use as little space as possible. This may result in longer
             computation time.
          deallocate_error_fatal : bool
             if ``deallocate_error_fatal`` is True, any array/pointer
             deallocation error will terminate execution. Otherwise,
             computation will continue.

   .. function:: [optional] rpd.information()

      Provide optional output information.

      **Returns:**

      inform : dict
         dictionary containing output information:
          status : int
             return status. Possible values are

             * **0**

               successful return.

             * **-1**

               allocation failure.

             * **-2**

               deallocation failure.

             * **-3**

               end of file reached prematurely.

             * **-4**

               other read error.

             * **-5**

               unrecognised type.

          alloc_status : int
             the status of the last attempted allocation/deallocation.
          bad_alloc : str
             the name of the array for which an allocation/deallocation
             error ocurred.
          io_status : int
             status from last read attempt.
          line : int
             number of last line read from i/o file.
          p_type : str
             problem type.

   .. function:: rpd.finalize()

     Deallocate all internal private storage.
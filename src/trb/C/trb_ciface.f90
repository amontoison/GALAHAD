! THIS VERSION: GALAHAD 3.3 - 01/08/2021 AT 15:40 GMT.

!-*-*-*-*-*-*-*-*-  G A L A H A D _ T R B   C   I N T E R F A C E  -*-*-*-*-*-*-

!  Copyright reserved, Gould/Orban/Toint, for GALAHAD productions
!  Principal authors: Jaroslav Fowkes & Nick Gould

!  History -
!    originally released GALAHAD Version 3.3. July 28th 2021

!  For full documentation, see
!   http://galahad.rl.ac.uk/galahad-www/specs.html

!  C interface module to GALAHAD_TRB types and interfaces

  MODULE GALAHAD_TRB_double_ciface
    USE iso_c_binding
    USE GALAHAD_common_ciface
    USE GALAHAD_TRB_double, only:                                              &
        f_trb_time_type                 => TRB_time_type,                      &
        f_trb_inform_type               => TRB_inform_type,                    &
        f_trb_control_type              => TRB_control_type,                   &
        f_trb_full_data_type            => TRB_full_data_type,                 &
        f_trb_initialize                => TRB_initialize,                     &
        f_trb_read_specfile             => TRB_read_specfile,                  &
        f_trb_import                    => TRB_import,                         &
        f_trb_reset_control             => TRB_reset_control,                  &
        f_trb_solve_with_mat            => TRB_solve_with_mat,                 &
        f_trb_solve_without_mat         => TRB_solve_without_mat,              &
        f_trb_solve_reverse_with_mat    => TRB_solve_reverse_with_mat,         &
        f_trb_solve_reverse_without_mat => TRB_solve_reverse_without_mat,      &
        f_trb_information               => TRB_information,                    &
        f_trb_terminate                 => TRB_terminate
    USE GALAHAD_NLPT_double, ONLY:                                             &
        f_nlpt_userdata_type            => NLPT_userdata_type

    IMPLICIT NONE

!--------------------
!   P r e c i s i o n
!--------------------

    INTEGER, PARAMETER :: wp = C_DOUBLE ! double precision
    INTEGER, PARAMETER :: sp = C_FLOAT  ! single precision

!-------------------------------------------------
!  D e r i v e d   t y p e   d e f i n i t i o n s
!-------------------------------------------------

    TYPE, BIND( C ) :: trb_control_type
      LOGICAL ( KIND = C_BOOL ) :: f_indexing
      INTEGER ( KIND = C_INT ) :: error
      INTEGER ( KIND = C_INT ) :: out
      INTEGER ( KIND = C_INT ) :: print_level
      INTEGER ( KIND = C_INT ) :: start_print
      INTEGER ( KIND = C_INT ) :: stop_print
      INTEGER ( KIND = C_INT ) :: print_gap
      INTEGER ( KIND = C_INT ) :: maxit
      INTEGER ( KIND = C_INT ) :: alive_unit 
      CHARACTER( KIND = C_CHAR ), DIMENSION( 31 ) :: alive_file
      INTEGER ( KIND = C_INT ) :: more_toraldo
      INTEGER ( KIND = C_INT ) :: non_monotone
      INTEGER ( KIND = C_INT ) :: model
      INTEGER ( KIND = C_INT ) :: norm
      INTEGER ( KIND = C_INT ) :: semi_bandwidth
      INTEGER ( KIND = C_INT ) :: lbfgs_vectors
      INTEGER ( KIND = C_INT ) :: max_dxg
      INTEGER ( KIND = C_INT ) :: icfs_vectors
      INTEGER ( KIND = C_INT ) :: mi28_lsize
      INTEGER ( KIND = C_INT ) :: mi28_rsize
      INTEGER ( KIND = C_INT ) :: advanced_start
      REAL ( KIND = wp ) :: stop_pg_absolute
      REAL ( KIND = wp ) :: stop_pg_relative
      REAL ( KIND = wp ) :: stop_s
      REAL ( KIND = wp ) :: infinity
      REAL ( KIND = wp ) :: initial_radius
      REAL ( KIND = wp ) :: maximum_radius
      REAL ( KIND = wp ) :: stop_rel_cg
      REAL ( KIND = wp ) :: eta_successful
      REAL ( KIND = wp ) :: eta_very_successful
      REAL ( KIND = wp ) :: eta_too_successful
      REAL ( KIND = wp ) :: radius_increase
      REAL ( KIND = wp ) :: radius_reduce
      REAL ( KIND = wp ) :: radius_reduce_max
      REAL ( KIND = wp ) :: obj_unbounded
      REAL ( KIND = wp ) :: cpu_time_limit 
      REAL ( KIND = wp ) :: clock_time_limit 
      LOGICAL ( KIND = C_BOOL ) :: hessian_available
      LOGICAL ( KIND = C_BOOL ) :: subproblem_direct
      LOGICAL ( KIND = C_BOOL ) :: retrospective_trust_region
      LOGICAL ( KIND = C_BOOL ) :: renormalize_radius
      LOGICAL ( KIND = C_BOOL ) :: two_norm_tr
      LOGICAL ( KIND = C_BOOL ) :: exact_gcp
      LOGICAL ( KIND = C_BOOL ) :: accurate_bqp
      LOGICAL ( KIND = C_BOOL ) :: space_critical
      LOGICAL ( KIND = C_BOOL ) :: deallocate_error_fatal
      CHARACTER ( KIND = C_CHAR ), DIMENSION( 31 ) :: prefix 
!     TYPE ( TRS_control_type ) :: trs_control
!     TYPE ( GLTR_control_type ) :: gltr_control
!     TYPE ( PSLS_control_type ) :: psls_control
!     TYPE ( LMS_control_type ) :: lms_control
!     TYPE ( LMS_control_type ) :: lms_control_prec
!     TYPE ( SHA_control_type ) :: sha_control
    END TYPE trb_control_type

    TYPE, BIND( C ) :: trb_time_type
      REAL ( KIND = sp ) :: total
      REAL ( KIND = sp ) :: preprocess
      REAL ( KIND = sp ) :: analyse
      REAL ( KIND = sp ) :: factorize
      REAL ( KIND = sp ) :: solve
      REAL ( KIND = wp ) :: clock_total
      REAL ( KIND = wp ) :: clock_preprocess
      REAL ( KIND = wp ) :: clock_analyse
      REAL ( KIND = wp ) :: clock_factorize
      REAL ( KIND = wp ) :: clock_solve
    END TYPE trb_time_type

    TYPE, BIND( C ) :: trb_inform_type
      INTEGER ( KIND = C_INT ) :: status
      INTEGER ( KIND = C_INT ) :: alloc_status
      CHARACTER ( KIND = C_CHAR ), DIMENSION( 81 ) :: bad_alloc
      INTEGER ( KIND = C_INT ) :: iter
      INTEGER ( KIND = C_INT ) :: cg_iter
      INTEGER ( KIND = C_INT ) :: cg_maxit
      INTEGER ( KIND = C_INT ) :: f_eval
      INTEGER ( KIND = C_INT ) :: g_eval
      INTEGER ( KIND = C_INT ) :: h_eval
      INTEGER ( KIND = C_INT ) :: n_free
      INTEGER ( KIND = C_INT ) :: factorization_max
      INTEGER ( KIND = C_INT ) :: factorization_status
      INTEGER ( KIND = C_LONG ) :: max_entries_factors
      INTEGER ( KIND = C_INT ) :: factorization_integer
      INTEGER ( KIND = C_INT ) :: factorization_real
      REAL ( KIND = wp ) :: obj
      REAL ( KIND = wp ) :: norm_pg
      REAL ( KIND = wp ) :: radius
      TYPE ( trb_time_type ) :: time
!     TYPE ( TRS_inform_type ) :: trs_inform
!     TYPE ( GLTR_inform_type ) :: gltr_inform
!     TYPE ( PSLS_inform_type ) :: psls_inform
!     TYPE ( LMS_inform_type ) :: lms_inform
!     TYPE ( LMS_inform_type ) :: lms_inform_prec
!     TYPE ( SHA_inform_type ) :: sha_inform
    END TYPE trb_inform_type

!----------------------
!   I n t e r f a c e s
!----------------------

    ABSTRACT INTERFACE
      FUNCTION eval_f( n, x, f, userdata ) RESULT( status ) BIND( C )
        USE iso_c_binding
        IMPORT :: wp
        INTEGER ( KIND = C_INT ), INTENT( IN ), value :: n
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: x
        REAL ( KIND = wp ), INTENT( OUT ) :: f
        TYPE ( C_PTR ), INTENT( IN ), VALUE :: userdata
        INTEGER ( KIND = C_INT ) :: status
      END FUNCTION eval_f
    END INTERFACE

    ABSTRACT INTERFACE
      FUNCTION eval_g( n, x, g, userdata ) RESULT( status ) BIND( C )
        USE iso_c_binding
        IMPORT :: wp
        INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: x
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( OUT ) :: g
        TYPE ( C_PTR ), INTENT( IN ), VALUE :: userdata
        INTEGER ( KIND = C_INT ) :: status
      END FUNCTION eval_g
    END INTERFACE

    ABSTRACT INTERFACE
      FUNCTION eval_h( n, ne, x, hval, userdata ) RESULT( status ) BIND( C )
        USE iso_c_binding
        IMPORT :: wp
        INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n
        INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: ne
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: x
        REAL ( KIND = wp ), DIMENSION( ne ), INTENT( OUT ) :: hval
        TYPE ( C_PTR ), INTENT( IN ), VALUE :: userdata
        INTEGER ( KIND = C_INT ) :: status
      END FUNCTION eval_h
    END INTERFACE

    ABSTRACT INTERFACE
      FUNCTION eval_hprod( n, x, u, v, got_h, userdata ) RESULT( status )      &
                                                         BIND( C )
        USE iso_c_binding
        IMPORT :: wp
        INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: x
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( INOUT ) :: u
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: v
        LOGICAL ( KIND = C_BOOL ), INTENT( IN ), VALUE :: got_h
        TYPE ( C_PTR ), INTENT( IN ), VALUE :: userdata
        INTEGER ( KIND = C_INT ) :: status
      END FUNCTION eval_hprod
    END INTERFACE

    ABSTRACT INTERFACE
      FUNCTION eval_shprod( n, x, nnz_v, index_nz_v, v, nnz_u, index_nz_u,     &
                            u, got_h, userdata ) RESULT( status ) BIND( C )
        USE iso_c_binding
        IMPORT :: wp
        INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: x
        INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: nnz_v
        INTEGER ( KIND = C_INT ), DIMENSION( n ), INTENT( IN ) :: index_nz_v
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: v
        INTEGER ( KIND = C_INT ), INTENT( OUT ) :: nnz_u 
        INTEGER ( KIND = C_INT ), DIMENSION( n ), INTENT( OUT ) :: index_nz_u
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( OUT ) :: u
        LOGICAL( KIND = C_BOOL ), INTENT( IN ), VALUE :: got_h
        TYPE (C_PTR), INTENT( IN ), VALUE :: userdata
        INTEGER ( KIND = C_INT ) :: status
      END FUNCTION eval_shprod
    END INTERFACE

    ABSTRACT INTERFACE
      FUNCTION eval_prec( n, x, u, v, userdata ) RESULT( status ) BIND( C )
        USE iso_c_binding
        IMPORT :: wp
        INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: x
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( OUT ) :: u
        REAL ( KIND = wp ), DIMENSION( n ), INTENT( IN ) :: v
        TYPE ( C_PTR ), INTENT( IN ), VALUE :: userdata
        INTEGER ( KIND = C_INT ) :: status
      END FUNCTION eval_prec
    END INTERFACE

!----------------------
!   P r o c e d u r e s
!----------------------

  CONTAINS

!  copy C control parameters to fortran

    SUBROUTINE copy_control_in( ccontrol, fcontrol, f_indexing ) 
    TYPE ( trb_control_type ), INTENT( IN ) :: ccontrol
    TYPE ( f_trb_control_type ), INTENT( OUT ) :: fcontrol
    LOGICAL, OPTIONAL, INTENT( OUT ) :: f_indexing
    INTEGER :: i
    
    ! C or Fortran sparse matrix indexing
    IF ( PRESENT( f_indexing ) ) f_indexing = ccontrol%f_indexing

    ! Integers
    fcontrol%error = ccontrol%error
    fcontrol%out = ccontrol%out
    fcontrol%print_level = ccontrol%print_level
    fcontrol%start_print = ccontrol%start_print
    fcontrol%stop_print = ccontrol%stop_print
    fcontrol%print_gap = ccontrol%print_gap
    fcontrol%maxit = ccontrol%maxit
    fcontrol%alive_unit = ccontrol%alive_unit
    fcontrol%more_toraldo = ccontrol%more_toraldo
    fcontrol%non_monotone = ccontrol%non_monotone
    fcontrol%model = ccontrol%model
    fcontrol%norm = ccontrol%norm
    fcontrol%semi_bandwidth = ccontrol%semi_bandwidth
    fcontrol%lbfgs_vectors = ccontrol%lbfgs_vectors
    fcontrol%max_dxg = ccontrol%max_dxg
    fcontrol%icfs_vectors = ccontrol%icfs_vectors
    fcontrol%mi28_lsize = ccontrol%mi28_lsize
    fcontrol%mi28_rsize = ccontrol%mi28_rsize
    fcontrol%advanced_start = ccontrol%advanced_start

    ! Reals
    fcontrol%stop_pg_absolute = ccontrol%stop_pg_absolute
    fcontrol%stop_pg_relative = ccontrol%stop_pg_relative
    fcontrol%stop_s = ccontrol%stop_s
    fcontrol%infinity = ccontrol%infinity
    fcontrol%initial_radius = ccontrol%initial_radius
    fcontrol%maximum_radius = ccontrol%maximum_radius
    fcontrol%stop_rel_cg = ccontrol%stop_rel_cg
    fcontrol%eta_successful = ccontrol%eta_successful
    fcontrol%eta_very_successful = ccontrol%eta_very_successful
    fcontrol%eta_too_successful = ccontrol%eta_too_successful
    fcontrol%radius_increase = ccontrol%radius_increase
    fcontrol%radius_reduce = ccontrol%radius_reduce
    fcontrol%radius_reduce_max = ccontrol%radius_reduce_max
    fcontrol%obj_unbounded = ccontrol%obj_unbounded
    fcontrol%cpu_time_limit = ccontrol%cpu_time_limit
    fcontrol%clock_time_limit = ccontrol%clock_time_limit 

    ! Logicals
    fcontrol%hessian_available = ccontrol%hessian_available
    fcontrol%subproblem_direct = ccontrol%subproblem_direct
    fcontrol%retrospective_trust_region = ccontrol%retrospective_trust_region
    fcontrol%renormalize_radius = ccontrol%renormalize_radius
    fcontrol%two_norm_tr = ccontrol%two_norm_tr
    fcontrol%exact_gcp = ccontrol%exact_gcp
    fcontrol%accurate_bqp = ccontrol%accurate_bqp
    fcontrol%space_critical = ccontrol%space_critical
    fcontrol%deallocate_error_fatal = ccontrol%deallocate_error_fatal

    ! Derived types
!   CALL copy_trs_control_in(ccontrol%trs_control,fcontrol%trs_control)
!   CALL copy_gltr_control_in(ccontrol%gltr_control,fcontrol%gltr_control)
!   CALL copy_psls_control_in(ccontrol%psls_control,fcontrol%psls_control)
!   CALL copy_lms_control_in(ccontrol%lms_control,fcontrol%lms_control)
!   CALL copy_lms_control_prec_in(ccontrol%lms_control_prec,                   &
!                                 fcontrol%lms_control_prec)
!   CALL copy_sha_control_in(ccontrol%sha_control,fcontrol%sha_control)

    ! Strings
    DO i = 1, LEN( fcontrol%alive_file )
        IF ( ccontrol%alive_file( i ) == C_NULL_CHAR ) EXIT
        fcontrol%alive_file( i : i ) = ccontrol%alive_file( i )
    END DO
    DO i = 1, LEN( fcontrol%prefix )
        IF ( ccontrol%prefix( i ) == C_NULL_CHAR ) EXIT
        fcontrol%prefix( i : i ) = ccontrol%prefix( i )
    END DO
    RETURN
    END SUBROUTINE copy_control_in

!  copy fortran control parameters to C

    SUBROUTINE copy_control_out( fcontrol, ccontrol, f_indexing )
    TYPE ( f_trb_control_type ), INTENT( IN ) :: fcontrol
    TYPE ( trb_control_type ), INTENT( OUT ) :: ccontrol
    logical, optional, INTENT( IN ) :: f_indexing
    integer :: i, l
    
    ! C or Fortran sparse matrix indexing
    IF ( PRESENT( f_indexing ) ) ccontrol%f_indexing = f_indexing

    ! Integers
    ccontrol%error = fcontrol%error
    ccontrol%out = fcontrol%out
    ccontrol%print_level = fcontrol%print_level
    ccontrol%start_print = fcontrol%start_print
    ccontrol%stop_print = fcontrol%stop_print
    ccontrol%print_gap = fcontrol%print_gap
    ccontrol%maxit = fcontrol%maxit
    ccontrol%alive_unit = fcontrol%alive_unit
    ccontrol%more_toraldo = fcontrol%more_toraldo
    ccontrol%non_monotone = fcontrol%non_monotone
    ccontrol%model = fcontrol%model
    ccontrol%norm = fcontrol%norm
    ccontrol%semi_bandwidth = fcontrol%semi_bandwidth
    ccontrol%lbfgs_vectors = fcontrol%lbfgs_vectors
    ccontrol%max_dxg = fcontrol%max_dxg
    ccontrol%icfs_vectors = fcontrol%icfs_vectors
    ccontrol%mi28_lsize = fcontrol%mi28_lsize
    ccontrol%mi28_rsize = fcontrol%mi28_rsize
    ccontrol%advanced_start = fcontrol%advanced_start

    ! Reals
    ccontrol%stop_pg_absolute = fcontrol%stop_pg_absolute
    ccontrol%stop_pg_relative = fcontrol%stop_pg_relative
    ccontrol%stop_s = fcontrol%stop_s
    ccontrol%infinity = fcontrol%infinity
    ccontrol%initial_radius = fcontrol%initial_radius
    ccontrol%maximum_radius = fcontrol%maximum_radius
    ccontrol%stop_rel_cg = fcontrol%stop_rel_cg
    ccontrol%eta_successful = fcontrol%eta_successful
    ccontrol%eta_very_successful = fcontrol%eta_very_successful
    ccontrol%eta_too_successful = fcontrol%eta_too_successful
    ccontrol%radius_increase = fcontrol%radius_increase
    ccontrol%radius_reduce = fcontrol%radius_reduce
    ccontrol%radius_reduce_max = fcontrol%radius_reduce_max
    ccontrol%obj_unbounded = fcontrol%obj_unbounded
    ccontrol%cpu_time_limit = fcontrol%cpu_time_limit
    ccontrol%clock_time_limit = fcontrol%clock_time_limit 

    ! Logicals
    ccontrol%hessian_available = fcontrol%hessian_available
    ccontrol%subproblem_direct = fcontrol%subproblem_direct
    ccontrol%retrospective_trust_region = fcontrol%retrospective_trust_region
    ccontrol%renormalize_radius = fcontrol%renormalize_radius
    ccontrol%two_norm_tr = fcontrol%two_norm_tr
    ccontrol%exact_gcp = fcontrol%exact_gcp
    ccontrol%accurate_bqp = fcontrol%accurate_bqp
    ccontrol%space_critical = fcontrol%space_critical
    ccontrol%deallocate_error_fatal = fcontrol%deallocate_error_fatal

    ! Derived types
!   CALL copy_trs_control_out(fcontrol%trs_control,ccontrol%trs_control)
!   CALL copy_gltr_control_out(fcontrol%gltr_control,ccontrol%gltr_control)
!   CALL copy_psls_control_out(fcontrol%psls_control,ccontrol%psls_control)
!   CALL copy_lms_control_out(fcontrol%lms_control,ccontrol%lms_control)
!   CALL copy_lms_control_prec_out(fcontrol%lms_control_prec,                  &
!                                  ccontrol%lms_control_prec)
!   CALL copy_sha_control_out(fcontrol%sha_control,ccontrol%sha_control)

    ! Strings
    l = LEN( fcontrol%alive_file )
    DO i = 1, l
      ccontrol%alive_file( i ) = fcontrol%alive_file( i : i )
    END DO
    ccontrol%alive_file( l + 1 ) = C_NULL_CHAR
    l = LEN( fcontrol%prefix )
    DO i = 1, l
      ccontrol%prefix( i ) = fcontrol%prefix( i : i )
    END DO
    ccontrol%prefix( l + 1 ) = C_NULL_CHAR
    RETURN

    END SUBROUTINE copy_control_out

!  copy C times to fortran

    SUBROUTINE copy_time_in( ctime, ftime ) 
    TYPE ( trb_time_type ), INTENT( IN ) :: ctime
    TYPE ( f_trb_time_type ), INTENT( OUT ) :: ftime

    ftime%total = ctime%total
    ftime%preprocess = ctime%preprocess
    ftime%analyse = ctime%analyse
    ftime%factorize = ctime%factorize
    ftime%solve = ctime%solve
    ftime%clock_total = ctime%clock_total
    ftime%clock_preprocess = ctime%clock_preprocess
    ftime%clock_analyse = ctime%clock_analyse
    ftime%clock_factorize = ctime%clock_factorize
    ftime%clock_solve = ctime%clock_solve
    RETURN

    END SUBROUTINE copy_time_in

!  copy fortran times to C

    SUBROUTINE copy_time_out( ftime,  ctime )
    TYPE ( f_trb_time_type ), INTENT( IN ) :: ftime
    TYPE ( trb_time_type ), INTENT( OUT ) :: ctime

    ctime%total = ftime%total
    ctime%preprocess = ftime%preprocess
    ctime%analyse = ftime%analyse
    ctime%factorize = ftime%factorize
    ctime%solve = ftime%solve
    ctime%clock_total = ftime%clock_total
    ctime%clock_preprocess = ftime%clock_preprocess
    ctime%clock_analyse = ftime%clock_analyse
    ctime%clock_factorize = ftime%clock_factorize
    ctime%clock_solve = ftime%clock_solve
    RETURN

    END SUBROUTINE copy_time_out

!  copy C information parameters to fortran

    SUBROUTINE copy_inform_in( cinform, finform ) 
    TYPE ( trb_inform_type ), INTENT( IN ) :: cinform
    TYPE ( f_trb_inform_type ), INTENT( OUT ) :: finform
    INTEGER :: i

    ! Integers
    finform%status = cinform%status
    finform%alloc_status = cinform%alloc_status
    finform%iter = cinform%iter
    finform%cg_iter = cinform%cg_iter
    finform%cg_maxit = cinform%cg_maxit
    finform%f_eval = cinform%f_eval
    finform%g_eval = cinform%g_eval
    finform%h_eval = cinform%h_eval
    finform%n_free = cinform%n_free
    finform%factorization_max = cinform%factorization_max
    finform%factorization_status = cinform%factorization_status
    finform%max_entries_factors = cinform%max_entries_factors
    finform%factorization_integer = cinform%factorization_integer
    finform%factorization_real = cinform%factorization_real

    ! Reals
    finform%obj = cinform%obj
    finform%norm_pg = cinform%norm_pg
    finform%radius = cinform%radius

    ! Derived types
    CALL copy_time_in( cinform%time, finform%time )
!   CALL copy_trs_inform_in( cinform%trs_inform, finform%trs_inform )
!   CALL copy_gltr_inform_in( cinform%gltr_inform, finform%gltr_inform )
!   CALL copy_psls_inform_in( cinform%psls_inform, finform%psls_inform )
!   CALL copy_lms_inform_in( cinform%lms_inform, finform%lms_inform )
!   CALL copy_lms_inform_prec_in( cinform%lms_inform_prec, &
!                                 finform%lms_inform_prec )
!   CALL copy_sha_inform_in( cinform%sha_inform, finform%sha_inform )

    ! Strings
    DO i = 1, LEN( finform%bad_alloc )
      IF ( cinform%bad_alloc( i ) == C_NULL_CHAR ) EXIT
      finform%bad_alloc( i : i ) = cinform%bad_alloc( i )
    END DO
    RETURN

    END SUBROUTINE copy_inform_in

!  copy fortran information parameters to C

    SUBROUTINE copy_inform_out( finform, cinform )
    TYPE ( f_trb_inform_type ), INTENT( IN ) :: finform 
    TYPE ( trb_inform_type ), INTENT( OUT ) :: cinform
    INTEGER :: i, l

    ! Integers
    cinform%status = finform%status
    cinform%alloc_status = finform%alloc_status
    cinform%iter = finform%iter
    cinform%cg_iter = finform%cg_iter
    cinform%cg_maxit = finform%cg_maxit
    cinform%f_eval = finform%f_eval
    cinform%g_eval = finform%g_eval
    cinform%h_eval = finform%h_eval
    cinform%n_free = finform%n_free
    cinform%factorization_max = finform%factorization_max
    cinform%factorization_status = finform%factorization_status
    cinform%max_entries_factors = finform%max_entries_factors
    cinform%factorization_integer = finform%factorization_integer
    cinform%factorization_real = finform%factorization_real

    ! Reals
    cinform%obj = finform%obj
    cinform%norm_pg = finform%norm_pg
    cinform%radius = finform%radius

    ! Derived types
    CALL copy_time_out( finform%time, cinform%time )
!   CALL copy_trs_inform_out( finform%trs_inform, cinform%trs_inform )
!   CALL copy_gltr_inform_out( finform%gltr_inform, cinform%gltr_inform )
!   CALL copy_psls_inform_out( finform%psls_inform, cinform%psls_inform )
!   CALL copy_lms_inform_out( finform%lms_inform, cinform%lms_inform )
!   CALL copy_lms_inform_prec_out( finform%lms_inform_prec,                    &
!                                  cinform%lms_inform_prec )
!   CALL copy_sha_inform_out( finform%sha_inform, cinform%sha_inform )

    ! Strings
    l = LEN( finform%bad_alloc )
    DO i = 1, l
      cinform%bad_alloc( i ) = finform%bad_alloc( i : i )
    end do
    cinform%bad_alloc( l + 1 ) = C_NULL_CHAR
    RETURN

    END SUBROUTINE copy_inform_out

  END MODULE GALAHAD_TRB_double_ciface

!  -------------------------------------
!  C interface to fortran trb_initialize
!  -------------------------------------

  SUBROUTINE trb_initialize( cdata, ccontrol, status ) BIND( C ) 
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
  TYPE ( C_PTR ), INTENT( OUT ) :: cdata ! data is a black-box
  TYPE ( trb_control_type ), INTENT( OUT ) :: ccontrol

!  local variables

  TYPE ( f_trb_full_data_type ), POINTER :: fdata
  TYPE ( f_trb_control_type ) :: fcontrol
  TYPE ( f_trb_inform_type ) :: finform
  LOGICAL :: f_indexing 

!  allocate fdata

  ALLOCATE( fdata ); cdata = C_LOC( fdata )

!  initialize required fortran types

  CALL f_trb_initialize( fdata, fcontrol, finform )
  status = finform%status

!  C sparse matrix indexing by default

  f_indexing = .FALSE.
  fdata%f_indexing = f_indexing

!  copy control out 

  CALL copy_control_out( fcontrol, ccontrol, f_indexing )
  RETURN

  END SUBROUTINE trb_initialize

!  ----------------------------------------
!  C interface to fortran trb_read_specfile
!  ----------------------------------------

  SUBROUTINE trb_read_specfile( ccontrol, cspecfile ) BIND( C )
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  TYPE ( trb_control_type ), INTENT( INOUT ) :: ccontrol
  TYPE ( C_PTR ), INTENT( IN ), VALUE :: cspecfile

!  local variables

  TYPE ( f_trb_control_type ) :: fcontrol
  CHARACTER ( KIND = C_CHAR, LEN = strlen( cspecfile ) ) :: fspecfile
  LOGICAL :: f_indexing

!  device unit number for specfile

  INTEGER ( KIND = C_INT ), PARAMETER :: device = 10

!  convert C string to Fortran string

  fspecfile = cstr_to_fchar( cspecfile )

!  copy control in

  CALL copy_control_in( ccontrol, fcontrol, f_indexing )
  
!  open specfile for reading

  open( UNIT = device, FILE = fspecfile )
  
!  read control parameters from the specfile

  CALL f_trb_read_specfile( fcontrol, device )

!  close specfile

  close( device )

!  copy control out

  CALL copy_control_out( fcontrol, ccontrol, f_indexing )
  RETURN

  END SUBROUTINE trb_read_specfile

!  ---------------------------------
!  C interface to fortran trb_inport
!  ---------------------------------

  SUBROUTINE trb_import( ccontrol, cdata, status, n, xl, xu, ctype,            &
                         ne, row, col, ptr ) BIND( C )
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n, ne
  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
  INTEGER ( KIND = C_INT ), INTENT( IN ), DIMENSION( ne ), OPTIONAL :: row, col
  INTEGER ( KIND = C_INT ), INTENT( IN ), DIMENSION( n + 1 ), OPTIONAL :: ptr
  REAL ( KIND = wp ), INTENT( IN ), DIMENSION( n ) :: xl, xu
  TYPE ( C_PTR ), INTENT( IN ), VALUE :: ctype
  TYPE ( trb_control_type ), INTENT( INOUT ) :: ccontrol
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata

!  local variables

  CHARACTER ( KIND = C_CHAR, LEN = opt_strlen( ctype ) ) :: ftype
  TYPE ( f_trb_control_type ) :: fcontrol
  TYPE ( f_trb_full_data_type ), POINTER :: fdata
  INTEGER, DIMENSION( : ), ALLOCATABLE :: row_find, col_find, ptr_find
  LOGICAL :: f_indexing

!  copy control in

  CALL copy_control_in( ccontrol, fcontrol, f_indexing )

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  convert C string to Fortran string

  ftype = cstr_to_fchar( ctype )

!  is fortran-style 1-based indexing used?

  fdata%f_indexing = f_indexing

!  handle C sparse matrix indexing

  IF ( .NOT. f_indexing ) THEN
    IF ( PRESENT( row ) ) THEN
      ALLOCATE( row_find( ne ) )
      row_find = row + 1
    END IF
    IF ( PRESENT( col ) ) THEN
      ALLOCATE( col_find( ne ) )
      col_find = col + 1
    END IF
    IF ( PRESENT( ptr ) ) THEN
      ALLOCATE( ptr_find( n + 1 ) )
      ptr_find = ptr + 1
    END IF

!  import the problem data into the required TRB structure

    CALL f_trb_import( fcontrol, fdata, status, n, xl, xu, ftype, ne,          &
                       row_find, col_find, ptr_find )
    IF ( ALLOCATED( row_find ) ) DEALLOCATE( row_find )
    IF ( ALLOCATED( col_find ) ) DEALLOCATE( col_find )
    IF ( ALLOCATED( ptr_find ) ) DEALLOCATE( ptr_find )
  ELSE
    CALL f_trb_import( fcontrol, fdata, status, n, xl, xu, ftype, ne,          &
                       row, col, ptr )
  END IF

!  copy control out

  CALL copy_control_out( fcontrol, ccontrol, f_indexing )
  RETURN

  END SUBROUTINE trb_import

!  ----------------------------------------
!  C interface to fortran trb_reset_control
!  ----------------------------------------

  SUBROUTINE trb_reset_control( ccontrol, cdata, status ) BIND( C )
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
  TYPE ( trb_control_type ), INTENT( INOUT ) :: ccontrol
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata

!  local variables

  TYPE ( f_trb_control_type ) :: fcontrol
  TYPE ( f_trb_full_data_type ), POINTER :: fdata
  LOGICAL :: f_indexing

!  copy control and inform in

  CALL copy_control_in( ccontrol, fcontrol, f_indexing )

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  is fortran-style 1-based indexing used?

  fdata%f_indexing = f_indexing

!  import the control parameters into the required structure

  CALL f_trb_reset_control( fcontrol, fdata, status )
  RETURN

  END SUBROUTINE trb_reset_control

!  -----------------------------------------
!  C interface to fortran trb_solve_with_mat
!  -----------------------------------------

  SUBROUTINE trb_solve_with_mat( cdata, cuserdata, status, n, x, g, ne,        &
                                 ceval_f, ceval_g, ceval_h,                    &
                                 ceval_prec ) BIND( C )
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( INOUT ) :: status
  INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n, ne
  REAL ( KIND = wp ), INTENT( INOUT ), DIMENSION( n ) :: x, g 
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata
  TYPE ( C_PTR ), INTENT( IN ), VALUE :: cuserdata
  TYPE ( C_FUNPTR ), INTENT( IN ), VALUE :: ceval_f, ceval_g
  TYPE ( C_FUNPTR ), INTENT( IN ), VALUE :: ceval_h, ceval_prec

!  local variables

  TYPE ( f_trb_full_data_type ), POINTER :: fdata
  PROCEDURE( eval_f ), POINTER :: feval_f
  PROCEDURE( eval_g ), POINTER :: feval_g
  PROCEDURE( eval_h ), POINTER :: feval_h
  PROCEDURE( eval_prec ), POINTER :: feval_prec

!  ignore Fortran userdata type (not interoperable)

! TYPE ( f_nlpt_userdata_type ), POINTER :: fuserdata => NULL( )
  TYPE ( f_nlpt_userdata_type ) :: fuserdata

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  associate procedure pointers

  CALL C_F_PROCPOINTER( ceval_f, feval_f )
  CALL C_F_PROCPOINTER( ceval_g, feval_g )
  CALL C_F_PROCPOINTER( ceval_h, feval_h )
  IF ( C_ASSOCIATED( ceval_prec ) ) THEN 
    CALL C_F_PROCPOINTER( ceval_prec, feval_prec )
  ELSE
    NULLIFY( feval_prec )
  END IF

!  solve the problem when the Hessian is explicitly available

  CALL f_trb_solve_with_mat( fdata, fuserdata, status, x, g, wrap_eval_f,      &
                              wrap_eval_g, wrap_eval_h, wrap_eval_prec )

  RETURN

!  wrappers

  CONTAINS

!  eval_F wrapper

    SUBROUTINE wrap_eval_f( status, x, userdata, f )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    REAL ( KIND = wp ), INTENT( OUT ) :: f

!  call C interoperable eval_f

    status = feval_f( n, x, f, cuserdata )
    RETURN

    END SUBROUTINE wrap_eval_f

!  eval_G wrapper

    SUBROUTINE wrap_eval_g( status, x, userdata, g )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( OUT ) :: g

!  Call C interoperable eval_g
    status = feval_g( n, x, g, cuserdata )
    RETURN

    END SUBROUTINE wrap_eval_g

!  eval_H wrapper

    SUBROUTINE wrap_eval_h( status, x, userdata, hval )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( OUT ) :: hval

!  Call C interoperable eval_h
    status = feval_h( n, ne, x, hval, cuserdata )
    RETURN

    END SUBROUTINE wrap_eval_h

!  eval_PREC wrapper

    SUBROUTINE wrap_eval_prec( status, x, userdata, u, v )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( OUT ) :: u
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: v

!  call C interoperable eval_prec

    status = feval_prec( n, x, u, v, cuserdata )
    RETURN

    END SUBROUTINE wrap_eval_prec

  END SUBROUTINE trb_solve_with_mat

!  --------------------------------------------
!  C interface to fortran trb_solve_without_mat
!  --------------------------------------------

  SUBROUTINE trb_solve_without_mat( cdata, cuserdata, status, n, x, g, ceval_f,&
                                    ceval_g, ceval_hprod, ceval_shprod,        &
                                    ceval_prec ) BIND( C )
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( INOUT ) :: status
  INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n
  REAL ( KIND = wp ), INTENT( INOUT ), DIMENSION( n ) :: x, g 
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata
  TYPE ( C_PTR ), INTENT( IN ), VALUE :: cuserdata
  TYPE ( C_FUNPTR ), INTENT( IN ), VALUE :: ceval_f, ceval_g
  TYPE ( C_FUNPTR ), INTENT( IN ), VALUE :: ceval_hprod, ceval_shprod
  TYPE ( C_FUNPTR ), INTENT( IN ), VALUE :: ceval_prec

!  local variables

  TYPE ( f_trb_full_data_type ), POINTER :: fdata
  PROCEDURE( eval_f ), POINTER :: feval_f
  PROCEDURE( eval_g ), POINTER :: feval_g
  PROCEDURE( eval_hprod ), POINTER :: feval_hprod
  PROCEDURE( eval_shprod ), POINTER :: feval_shprod
  PROCEDURE( eval_prec ), POINTER :: feval_prec
  LOGICAL :: f_indexing

!  ignore Fortran userdata type (not interoperable)

! TYPE ( f_nlpt_userdata_type ), POINTER :: fuserdata => NULL( )
  TYPE ( f_nlpt_userdata_type ) :: fuserdata

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  is fortran-style 1-based indexing used?

  f_indexing = fdata%f_indexing

!  associate procedure pointers

  CALL C_F_PROCPOINTER( ceval_f, feval_f ) 
  CALL C_F_PROCPOINTER( ceval_g, feval_g )
  CALL C_F_PROCPOINTER( ceval_hprod, feval_hprod )
  CALL C_F_PROCPOINTER( ceval_shprod, feval_shprod )
  IF ( C_ASSOCIATED( ceval_prec ) ) THEN 
    CALL C_F_PROCPOINTER( ceval_prec, feval_prec )
  ELSE
    NULLIFY( feval_prec )
  END IF

!  solve the problem when the Hessian is only available via products

  CALL f_trb_solve_without_mat( fdata, fuserdata, status, x, g, wrap_eval_f,   &
                                wrap_eval_g, wrap_eval_hprod,                  &
                                wrap_eval_shprod, wrap_eval_prec )

  RETURN

!  wrappers

  CONTAINS

!  eval_F wrapper

    SUBROUTINE wrap_eval_f( status, x, userdata, f )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    REAL ( KIND = wp ), INTENT( OUT ) :: f

!  call C interoperable eval_f
    status = feval_f( n, x, f, cuserdata )
    RETURN

    END SUBROUTINE wrap_eval_f

!  eval_G wrapper

    SUBROUTINE wrap_eval_g( status, x, userdata, g )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( OUT ) :: g

!  call C interoperable eval_g

    status = feval_g( n, x, g, cuserdata )
    RETURN

    END SUBROUTINE wrap_eval_g

!  eval_HPROD wrapper

    SUBROUTINE wrap_eval_hprod( status, x, userdata, u, v, fgot_h )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( INOUT ) :: u
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: v
    LOGICAL, OPTIONAL, INTENT( IN ) :: fgot_h
    LOGICAL ( KIND = C_BOOL ) :: cgot_h

!  call C interoperable eval_hprod

    IF ( PRESENT( fgot_h ) ) THEN
      cgot_h = fgot_h
    ELSE
      cgot_h = .false.
    END IF
    status = feval_hprod( n, x, u, v, cgot_h, cuserdata )
    RETURN

    END SUBROUTINE wrap_eval_hprod

!  eval_SHPROD wrapper

    SUBROUTINE wrap_eval_shprod( status, x, userdata, nnz_v, index_nz_v, v,    &
                                 nnz_u, index_nz_u, u, fgot_h )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    INTEGER ( KIND = C_INT ), INTENT( IN ) :: nnz_v
    INTEGER ( KIND = C_INT ), DIMENSION(:), INTENT( IN ) :: index_nz_v
    REAL ( KIND = wp ), dimension( : ), INTENT( IN ) :: v
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: nnz_u 
    INTEGER ( KIND = C_INT ), DIMENSION( : ), INTENT( OUT ) :: index_nz_u
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( OUT ) :: u
    LOGICAL, OPTIONAL, INTENT( IN ) :: fgot_h
    LOGICAL ( KIND = C_BOOL ) :: cgot_h

!  call C interoperable eval_shprod

    IF ( PRESENT( fgot_h ) ) THEN
      cgot_h = fgot_h 
    ELSE
      cgot_h = .false.
    END IF

    IF ( f_indexing ) then
      status = feval_shprod( n, x, nnz_v, index_nz_v, v, nnz_u, index_nz_u,    &
                             u, cgot_h, cuserdata )
    ELSE ! handle C sparse matrix indexing
      status = feval_shprod(n, x, nnz_v, index_nz_v - 1, v, nnz_u, index_nz_u, &
                             u, cgot_h, cuserdata )
      index_nz_u = index_nz_u + 1
    END IF
    RETURN

    END SUBROUTINE wrap_eval_shprod

!  eval_PREC wrapper

    SUBROUTINE wrap_eval_prec( status, x, userdata, u, v )
    INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: x
    TYPE ( f_nlpt_userdata_type ), INTENT( INOUT ) :: userdata
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( OUT ) :: u
    REAL ( KIND = wp ), DIMENSION( : ), INTENT( IN ) :: v

!  call C interoperable eval_prec

    status = feval_prec( n, x, u, v, cuserdata )
    RETURN

    END SUBROUTINE wrap_eval_prec

  END SUBROUTINE trb_solve_without_mat

!  -------------------------------------------------
!  C interface to fortran trb_solve_reverse_with_mat
!  -------------------------------------------------

  SUBROUTINE trb_solve_reverse_with_mat( cdata, status, eval_status,           &
                                         n, x, f, g, ne, val, u, v ) BIND( C )
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n, ne
  INTEGER ( KIND = C_INT ), INTENT( INOUT ) :: status, eval_status
  REAL ( KIND = wp ), INTENT( IN ), VALUE :: f
  REAL ( KIND = wp ), INTENT( INOUT ), DIMENSION( n ) :: x, g 
  REAL ( KIND = wp ), INTENT( INOUT ), DIMENSION( ne ) :: val
  REAL ( KIND = wp ), INTENT( IN ), DIMENSION( n ) :: u
  REAL ( KIND = wp ), INTENT( OUT ), DIMENSION( n ) :: v
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata

!  local variables

  TYPE ( f_trb_full_data_type ), POINTER :: fdata

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  solve the problem when the Hessian is available by reverse communication

  CALL f_trb_solve_reverse_with_mat( fdata, status, eval_status, x, f, g, val, &
                                      u, v )
  RETURN
    
  END SUBROUTINE trb_solve_reverse_with_mat

!  ----------------------------------------------------
!  C interface to fortran trb_solve_reverse_without_mat
!  ----------------------------------------------------

  SUBROUTINE trb_solve_reverse_without_mat( cdata, status, eval_status, n,     &
                                             x, f, g, u, v, index_nz_v, nnz_v, &
                                             index_nz_u, nnz_u ) BIND( C )
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: n, nnz_u
  INTEGER ( KIND = C_INT ), INTENT( INOUT ) :: status, eval_status
  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: nnz_v
  REAL ( KIND = wp ), INTENT( IN ), VALUE :: f
  REAL ( KIND = wp ), INTENT( INOUT ), DIMENSION( n ) :: x, g, u, v
  INTEGER ( KIND = C_INT ), INTENT( IN ), DIMENSION( n ) :: index_nz_u
  INTEGER ( KIND = C_INT ), INTENT( OUT ), DIMENSION( n ) :: index_nz_v
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata

!  local variables

  TYPE ( f_trb_full_data_type ), POINTER :: fdata
  LOGICAL :: f_indexing

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  is fortran-style 1-based indexing used?

  f_indexing = fdata%f_indexing

!  solve the problem when Hessian products are available by reverse 
!  communication

  IF ( f_indexing ) THEN
    CALL f_trb_solve_reverse_without_mat( fdata, status, eval_status, x, f, g, &
                                          u, v, index_nz_v, nnz_v,             &
                                          index_nz_u, nnz_u )
  ELSE
    CALL f_trb_solve_reverse_without_mat( fdata, status, eval_status, x, f, g, &
                                          u, v, index_nz_v, nnz_v,             &
                                          index_nz_u + 1, nnz_u )

!  convert to C indexing if required

     IF ( status == 7 ) index_nz_v( : nnz_v ) = index_nz_v( : nnz_v ) - 1
  END IF

  RETURN

  END SUBROUTINE trb_solve_reverse_without_mat

!  --------------------------------------
!  C interface to fortran trb_information
!  --------------------------------------

  SUBROUTINE trb_information( cdata, cinform, status ) BIND( C ) 
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata
  TYPE ( trb_inform_type ), INTENT( INOUT ) :: cinform
  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status

!  local variables

  TYPE ( f_trb_full_data_type ), pointer :: fdata
  TYPE ( f_trb_inform_type ) :: finform

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  obtain TRB solution information

  CALL f_trb_information( fdata, finform, status )

!  copy inform out

  CALL copy_inform_out( finform, cinform )
  RETURN

  END SUBROUTINE trb_information

!  ------------------------------------
!  C interface to fortran trb_terminate
!  ------------------------------------

  SUBROUTINE trb_terminate( cdata, ccontrol, cinform ) BIND( C ) 
  USE GALAHAD_TRB_double_ciface
  IMPLICIT NONE

!  dummy arguments

  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata
  TYPE ( trb_control_type ), INTENT( IN ) :: ccontrol
  TYPE ( trb_inform_type ), INTENT( INOUT ) :: cinform

!  local variables

  TYPE ( f_trb_full_data_type ), pointer :: fdata
  TYPE ( f_trb_control_type ) :: fcontrol
  TYPE ( f_trb_inform_type ) :: finform
  LOGICAL :: f_indexing

!  copy control in

  CALL copy_control_in( ccontrol, fcontrol, f_indexing )

!  copy inform in

  CALL copy_inform_in( cinform, finform )

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  deallocate workspace

  CALL f_trb_terminate( fdata, fcontrol, finform )

!  copy inform out

  CALL copy_inform_out( finform, cinform )

!  deallocate data

  DEALLOCATE( fdata ); cdata = C_NULL_PTR 
  RETURN

  END SUBROUTINE trb_terminate

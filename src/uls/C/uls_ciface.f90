! THIS VERSION: GALAHAD 3.3 - 30/11/2021 AT 08:48 GMT.

!-*-*-*-*-*-*-*-  G A L A H A D _  U L S    C   I N T E R F A C E  -*-*-*-*-*-

!  Copyright reserved, Gould/Orban/Toint, for GALAHAD productions
!  Principal authors: Jaroslav Fowkes & Nick Gould

!  History -
!    originally released GALAHAD Version 3.3. November 30th 2021

!  For full documentation, see
!   http://galahad.rl.ac.uk/galahad-www/specs.html

  MODULE GALAHAD_ULS_double_ciface
    USE iso_c_binding
    USE GALAHAD_common_ciface
    USE GALAHAD_ULS_double, ONLY:                                              &
        f_uls_control_type => ULS_control_type,                                &
        f_uls_inform_type => ULS_inform_type,                                  &
        f_uls_full_data_type => ULS_full_data_type,                            &
        f_uls_initialize => ULS_initialize,                                    &
        f_uls_read_specfile => ULS_read_specfile,                              &
        f_uls_factorize_matrix => ULS_factorize_matrix,                        &
        f_uls_solve_system => ULS_solve_system,                                &
        f_uls_reset_control => ULS_reset_control,                              &
        f_uls_information => ULS_information,                                  &
        f_uls_terminate => ULS_terminate

    USE GALAHAD_GLS_double_ciface, ONLY:                                       &
        gls_control,                                                           &
        gls_ainfo,                                                             &
        gls_finfo,                                                             &
        gls_sinfo,                                                             &
        copy_gls_ainfo_in => copy_ainfo_in,                                    &
        copy_gls_finfo_in => copy_finfo_in,                                    &
        copy_gls_sinfo_in => copy_sinfo_in,                                    &
        copy_gls_ainfo_out => copy_ainfo_out,                                  &
        copy_gls_finfo_out => copy_finfo_out,                                  &
        copy_gls_sinfo_out => copy_sinfo_out

!   USE GALAHAD_MA48_double_ciface, ONLY:                                      &
!       ma48_inform_type,                                                      &
!       ma48_control_type,                                                     &
!       copy_ma48_inform_in => copy_inform_in,                                 &
!       copy_ma48_inform_out => copy_inform_out,                               &
!       copy_ma48_control_in => copy_control_in,                               &
!       copy_ma48_control_out => copy_control_out

    IMPLICIT NONE

!--------------------
!   P r e c i s i o n
!--------------------

    INTEGER, PARAMETER :: wp = C_DOUBLE ! double precision
    INTEGER, PARAMETER :: sp = C_FLOAT  ! single precision

!-------------------------------------------------
!  D e r i v e d   t y p e   d e f i n i t i o n s
!-------------------------------------------------

    TYPE, BIND( C ) :: uls_control_type
      LOGICAL ( KIND = C_BOOL ) :: f_indexing
      INTEGER ( KIND = C_INT ) :: error
      INTEGER ( KIND = C_INT ) :: warning
      INTEGER ( KIND = C_INT ) :: out
      INTEGER ( KIND = C_INT ) :: print_level
      INTEGER ( KIND = C_INT ) :: print_level_solver
      INTEGER ( KIND = C_INT ) :: initial_fill_in_factor
      INTEGER ( KIND = C_INT ) :: min_real_factor_size
      INTEGER ( KIND = C_INT ) :: min_integer_factor_size
      INTEGER ( KIND = C_INT ) :: max_factor_size
      INTEGER ( KIND = C_INT ) :: blas_block_size_factorize
      INTEGER ( KIND = C_INT ) :: blas_block_size_solve
      INTEGER ( KIND = C_INT ) :: pivot_control
      INTEGER ( KIND = C_INT ) :: pivot_search_limit
      INTEGER ( KIND = C_INT ) :: minimum_size_for_btf
      INTEGER ( KIND = C_INT ) :: max_iterative_refinements
      LOGICAL ( KIND = C_BOOL ) :: stop_if_singular
      REAL ( KIND = wp ) :: array_increase_factor
      REAL ( KIND = wp ) :: switch_to_full_code_density
      REAL ( KIND = wp ) :: array_decrease_factor
      REAL ( KIND = wp ) :: relative_pivot_tolerance
      REAL ( KIND = wp ) :: absolute_pivot_tolerance
      REAL ( KIND = wp ) :: zero_tolerance
      REAL ( KIND = wp ) :: acceptable_residual_relative
      REAL ( KIND = wp ) :: acceptable_residual_absolute
      CHARACTER ( KIND = C_CHAR ), DIMENSION( 31 ) :: prefix
    END TYPE uls_control_type

    TYPE, BIND( C ) :: uls_inform_type
      INTEGER ( KIND = C_INT ) :: status
      INTEGER ( KIND = C_INT ) :: alloc_status
      CHARACTER ( KIND = C_CHAR ), DIMENSION( 81 ) :: bad_alloc
      INTEGER ( KIND = C_INT ) :: more_info
      INTEGER ( KIND = C_INT ) :: out_of_range
      INTEGER ( KIND = C_INT ) :: duplicates
      INTEGER ( KIND = C_INT ) :: entries_dropped
      INTEGER ( KIND = C_INT ) :: workspace_factors
      INTEGER ( KIND = C_INT ) :: compresses
      INTEGER ( KIND = C_INT ) :: entries_in_factors
      INTEGER ( KIND = C_INT ) :: rank
      INTEGER ( KIND = C_INT ) :: structural_rank
      INTEGER ( KIND = C_INT ) :: pivot_control
      INTEGER ( KIND = C_INT ) :: iterative_refinements
      LOGICAL ( KIND = C_BOOL ) :: alternative
      TYPE ( gls_ainfo ) :: gls_ainfo
      TYPE ( gls_finfo ) :: gls_finfo
      TYPE ( gls_sinfo ) :: gls_sinfo
!     TYPE ( ma48_ainfo ) :: ma48_ainfo
!     TYPE ( ma48_finfo ) :: ma48_finfo
!     TYPE ( ma48_sinfo ) :: ma48_sinfo
    END TYPE uls_inform_type

!----------------------
!   P r o c e d u r e s
!----------------------

  CONTAINS

!  copy C control parameters to fortran

    SUBROUTINE copy_control_in( ccontrol, fcontrol, f_indexing ) 
    TYPE ( uls_control_type ), INTENT( IN ) :: ccontrol
    TYPE ( f_uls_control_type ), INTENT( OUT ) :: fcontrol
    LOGICAL, optional, INTENT( OUT ) :: f_indexing
    INTEGER :: i
    
    ! C or Fortran sparse matrix indexing
    IF ( PRESENT( f_indexing ) ) f_indexing = ccontrol%f_indexing

    ! Integers
    fcontrol%error = ccontrol%error
    fcontrol%warning = ccontrol%warning
    fcontrol%out = ccontrol%out
    fcontrol%print_level = ccontrol%print_level
    fcontrol%print_level_solver = ccontrol%print_level_solver
    fcontrol%initial_fill_in_factor = ccontrol%initial_fill_in_factor
    fcontrol%min_real_factor_size = ccontrol%min_real_factor_size
    fcontrol%min_integer_factor_size = ccontrol%min_integer_factor_size
    fcontrol%max_factor_size = ccontrol%max_factor_size
    fcontrol%blas_block_size_factorize = ccontrol%blas_block_size_factorize
    fcontrol%blas_block_size_solve = ccontrol%blas_block_size_solve
    fcontrol%pivot_control = ccontrol%pivot_control
    fcontrol%pivot_search_limit = ccontrol%pivot_search_limit
    fcontrol%minimum_size_for_btf = ccontrol%minimum_size_for_btf
    fcontrol%max_iterative_refinements = ccontrol%max_iterative_refinements

    ! Reals
    fcontrol%array_increase_factor = ccontrol%array_increase_factor
    fcontrol%switch_to_full_code_density = ccontrol%switch_to_full_code_density
    fcontrol%array_decrease_factor = ccontrol%array_decrease_factor
    fcontrol%relative_pivot_tolerance = ccontrol%relative_pivot_tolerance
    fcontrol%absolute_pivot_tolerance = ccontrol%absolute_pivot_tolerance
    fcontrol%zero_tolerance = ccontrol%zero_tolerance
    fcontrol%acceptable_residual_relative                                      &
      = ccontrol%acceptable_residual_relative
    fcontrol%acceptable_residual_absolute                                      &
      = ccontrol%acceptable_residual_absolute

    ! Logicals
    fcontrol%stop_if_singular = ccontrol%stop_if_singular

    ! Strings
    DO i = 1, 31
      IF ( ccontrol%prefix( i ) == C_NULL_CHAR ) EXIT
      fcontrol%prefix( i : i ) = ccontrol%prefix( i )
    END DO
    RETURN

    END SUBROUTINE copy_control_in

!  copy fortran control parameters to C

    SUBROUTINE copy_control_out( fcontrol, ccontrol, f_indexing ) 
    TYPE ( f_uls_control_type ), INTENT( IN ) :: fcontrol
    TYPE ( uls_control_type ), INTENT( OUT ) :: ccontrol
    LOGICAL, OPTIONAL, INTENT( IN ) :: f_indexing
    INTEGER :: i
    
    ! C or Fortran sparse matrix indexing
    IF ( PRESENT( f_indexing ) ) ccontrol%f_indexing = f_indexing

    ! Integers
    ccontrol%error = fcontrol%error
    ccontrol%warning = fcontrol%warning
    ccontrol%out = fcontrol%out
    ccontrol%print_level = fcontrol%print_level
    ccontrol%print_level_solver = fcontrol%print_level_solver
    ccontrol%initial_fill_in_factor = fcontrol%initial_fill_in_factor
    ccontrol%min_real_factor_size = fcontrol%min_real_factor_size
    ccontrol%min_integer_factor_size = fcontrol%min_integer_factor_size
    ccontrol%max_factor_size = fcontrol%max_factor_size
    ccontrol%blas_block_size_factorize = fcontrol%blas_block_size_factorize
    ccontrol%blas_block_size_solve = fcontrol%blas_block_size_solve
    ccontrol%pivot_control = fcontrol%pivot_control
    ccontrol%pivot_search_limit = fcontrol%pivot_search_limit
    ccontrol%minimum_size_for_btf = fcontrol%minimum_size_for_btf
    ccontrol%max_iterative_refinements = fcontrol%max_iterative_refinements

    ! Reals
    ccontrol%array_increase_factor = fcontrol%array_increase_factor
    ccontrol%switch_to_full_code_density = fcontrol%switch_to_full_code_density
    ccontrol%array_decrease_factor = fcontrol%array_decrease_factor
    ccontrol%relative_pivot_tolerance = fcontrol%relative_pivot_tolerance
    ccontrol%absolute_pivot_tolerance = fcontrol%absolute_pivot_tolerance
    ccontrol%zero_tolerance = fcontrol%zero_tolerance
    ccontrol%acceptable_residual_relative                                      &
      = fcontrol%acceptable_residual_relative
    ccontrol%acceptable_residual_absolute                                      &
      = fcontrol%acceptable_residual_absolute

    ! Logicals
    ccontrol%stop_if_singular = fcontrol%stop_if_singular

    ! Strings
    DO i = 1, LEN( fcontrol%prefix )
      ccontrol%prefix( i ) = fcontrol%prefix( i : i )
    END DO
    ccontrol%prefix( LEN( fcontrol%prefix ) + 1 ) = C_NULL_CHAR
    RETURN

    END SUBROUTINE copy_control_out

!  copy C inform parameters to fortran

    SUBROUTINE copy_inform_in( cinform, finform ) 
    TYPE ( uls_inform_type ), INTENT( IN ) :: cinform
    TYPE ( f_uls_inform_type ), INTENT( OUT ) :: finform
    INTEGER :: i

    ! Integers
    finform%status = cinform%status
    finform%alloc_status = cinform%alloc_status
    finform%more_info = cinform%more_info
    finform%out_of_range = cinform%out_of_range
    finform%duplicates = cinform%duplicates
    finform%entries_dropped = cinform%entries_dropped
    finform%workspace_factors = cinform%workspace_factors
    finform%compresses = cinform%compresses
    finform%entries_in_factors = cinform%entries_in_factors
    finform%rank = cinform%rank
    finform%structural_rank = cinform%structural_rank
    finform%pivot_control = cinform%pivot_control
    finform%iterative_refinements = cinform%iterative_refinements

    ! Logicals
    finform%alternative = cinform%alternative

    ! Derived types
    CALL copy_gls_ainfo_in( cinform%gls_ainfo, finform%gls_ainfo )
    CALL copy_gls_finfo_in( cinform%gls_finfo, finform%gls_finfo )
    CALL copy_gls_sinfo_in( cinform%gls_sinfo, finform%gls_sinfo )
!   CALL copy_ma48_ainfo_in( cinform%ma48_ainfo, finform%ma48_ainfo )
!   CALL copy_ma48_finfo_in( cinform%ma48_finfo, finform%ma48_finfo )
!   CALL copy_ma48_sinfo_in( cinform%ma48_sinfo, finform%ma48_sinfo )

    ! Strings
    DO i = 1, 81
      IF ( cinform%bad_alloc( i ) == C_NULL_CHAR ) EXIT
      finform%bad_alloc( i : i ) = cinform%bad_alloc( i )
    END DO
    RETURN

    END SUBROUTINE copy_inform_in

!  copy fortran inform parameters to C

    SUBROUTINE copy_inform_out( finform, cinform ) 
    TYPE ( f_uls_inform_type ), INTENT( IN ) :: finform
    TYPE ( uls_inform_type ), INTENT( OUT ) :: cinform
    INTEGER :: i

    ! Integers
    cinform%status = finform%status
    cinform%alloc_status = finform%alloc_status
    cinform%more_info = finform%more_info
    cinform%out_of_range = finform%out_of_range
    cinform%duplicates = finform%duplicates
    cinform%entries_dropped = finform%entries_dropped
    cinform%workspace_factors = finform%workspace_factors
    cinform%compresses = finform%compresses
    cinform%entries_in_factors = finform%entries_in_factors
    cinform%rank = finform%rank
    cinform%structural_rank = finform%structural_rank
    cinform%pivot_control = finform%pivot_control
    cinform%iterative_refinements = finform%iterative_refinements

    ! Logicals
    cinform%alternative = finform%alternative

    ! Derived types
    CALL copy_gls_ainfo_out( finform%gls_ainfo, cinform%gls_ainfo )
    CALL copy_gls_finfo_out( finform%gls_finfo, cinform%gls_finfo )
    CALL copy_gls_sinfo_out( finform%gls_sinfo, cinform%gls_sinfo )
!   CALL copy_ma48_ainfo_out( finform%ma48_ainfo, cinform%ma48a_info )
!   CALL copy_ma48_finfo_out( finform%ma48_finfo, cinform%ma48f_info )
!   CALL copy_ma48_sinfo_out( finform%ma48_sinfo, cinform%ma48s_info )

    ! Strings
    DO i = 1, LEN( finform%bad_alloc )
      cinform%bad_alloc( i ) = finform%bad_alloc( i : i )
    END DO
    cinform%bad_alloc( LEN( finform%bad_alloc ) + 1 ) = C_NULL_CHAR
    RETURN

    END SUBROUTINE copy_inform_out

  END MODULE GALAHAD_ULS_double_ciface

!  -------------------------------------
!  C interface to fortran uls_initialize
!  -------------------------------------

  SUBROUTINE uls_initialize( csolver, cdata, ccontrol, status ) BIND( C ) 
  USE GALAHAD_ULS_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
  TYPE ( C_PTR ), INTENT( IN ), VALUE :: csolver
  TYPE ( C_PTR ), INTENT( OUT ) :: cdata ! data is a black-box
  TYPE ( uls_control_type ), INTENT( OUT ) :: ccontrol

!  local variables

  TYPE ( f_uls_full_data_type ), POINTER :: fdata
  TYPE ( f_uls_control_type ) :: fcontrol
  TYPE ( f_uls_inform_type ) :: finform
  LOGICAL :: f_indexing 
  CHARACTER ( KIND = C_CHAR, LEN = opt_strlen( csolver ) ) :: fsolver

!  allocate fdata

  ALLOCATE( fdata ); cdata = C_LOC( fdata )

!  convert C string to Fortran string

  fsolver = cstr_to_fchar( csolver )

!  initialize required fortran types

  CALL f_uls_initialize( fsolver, fdata, fcontrol, finform )
  status = finform%status

!  C sparse matrix indexing by default

  f_indexing = .FALSE.
  fdata%f_indexing = f_indexing

!  copy control out 

  CALL copy_control_out( fcontrol, ccontrol, f_indexing )
  RETURN

  END SUBROUTINE uls_initialize

!  ----------------------------------------
!  C interface to fortran uls_read_specfile
!  ----------------------------------------

  SUBROUTINE uls_read_specfile( ccontrol, cspecfile ) BIND( C )
  USE GALAHAD_ULS_double_ciface
  IMPLICIT NONE

!  dummy arguments

  TYPE ( uls_control_type ), INTENT( INOUT ) :: ccontrol
  TYPE ( C_PTR ), INTENT( IN ), VALUE :: cspecfile

!  local variables

  TYPE ( f_uls_control_type ) :: fcontrol
  CHARACTER ( KIND = C_CHAR, LEN = strlen( cspecfile ) ) :: fspecfile
  LOGICAL :: f_indexing

!  device unit number for specfile

  INTEGER ( KIND = C_INT ), PARAMETER :: device = 10

!  convert C string to Fortran string

  fspecfile = cstr_to_fchar( cspecfile )

!  copy control in

  CALL copy_control_in( ccontrol, fcontrol, f_indexing )
  
!  open specfile for reading

  OPEN( UNIT = device, FILE = fspecfile )
  
!  read control parameters from the specfile

  CALL f_uls_read_specfile( fcontrol, device )

!  close specfile

  CLOSE( device )

!  copy control out

  CALL copy_control_out( fcontrol, ccontrol, f_indexing )
  RETURN

  END SUBROUTINE uls_read_specfile

!  -----------------------------------------
!  C interface to fortran uls_factorize_matrix
!  -----------------------------------------

  SUBROUTINE uls_factorize_matrix( ccontrol, cdata, status, m, n, ctype, ne,   &
                                   val, row, col, ptr  ) BIND( C )
  USE GALAHAD_ULS_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
  TYPE ( uls_control_type ), INTENT( INOUT ) :: ccontrol
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata
  INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: m, n, ne
  TYPE ( C_PTR ), INTENT( IN ), VALUE :: ctype
  REAL ( KIND = wp ), INTENT( IN ), DIMENSION( ne ) :: val
  INTEGER ( KIND = C_INT ), INTENT( IN ), DIMENSION( ne ), OPTIONAL :: row
  INTEGER ( KIND = C_INT ), INTENT( IN ), DIMENSION( ne ), OPTIONAL :: col
  INTEGER ( KIND = C_INT ), INTENT( IN ), DIMENSION( n + 1 ), OPTIONAL :: ptr

!  local variables

  CHARACTER ( KIND = C_CHAR, LEN = opt_strlen( ctype ) ) :: ftype
  TYPE ( f_uls_control_type ) :: fcontrol
  TYPE ( f_uls_full_data_type ), POINTER :: fdata
  INTEGER, DIMENSION( : ), ALLOCATABLE :: row_find, col_find, ptr_find
  LOGICAL :: f_indexing

!  copy control and inform in

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

!  factorize_matrix the problem data into the required ULS structure

    CALL f_uls_factorize_matrix( fcontrol, fdata, status, m, n, ftype, ne,     &
                                 val, row_find, col_find, ptr_find )

    IF ( ALLOCATED( row_find ) ) DEALLOCATE( row_find )
    IF ( ALLOCATED( col_find ) ) DEALLOCATE( col_find )
    IF ( ALLOCATED( ptr_find ) ) DEALLOCATE( ptr_find )
  ELSE
    CALL f_uls_factorize_matrix( fcontrol, fdata, status, m, n, ftype, ne,     &
                                 val, row, col, ptr )
  END IF

!  copy control out

  CALL copy_control_out( fcontrol, ccontrol, f_indexing )
  RETURN

  END SUBROUTINE uls_factorize_matrix

!  ----------------------------------------
!  C interface to fortran uls_reset_control
!  -----------------------------------------

  SUBROUTINE uls_reset_control( ccontrol, cdata, status ) BIND( C )
  USE GALAHAD_ULS_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status
  TYPE ( uls_control_type ), INTENT( INOUT ) :: ccontrol
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata

!  local variables

  TYPE ( f_uls_control_type ) :: fcontrol
  TYPE ( f_uls_full_data_type ), POINTER :: fdata
  LOGICAL :: f_indexing

!  copy control in

  CALL copy_control_in( ccontrol, fcontrol, f_indexing )

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  is fortran-style 1-based indexing used?

  fdata%f_indexing = f_indexing

!  import the control parameters into the required structure

  CALL f_ULS_reset_control( fcontrol, fdata, status )
  RETURN

  END SUBROUTINE uls_reset_control

!  ----------------------------------------
!  C interface to fortran uls_solve_system
!  ----------------------------------------

  SUBROUTINE uls_solve_system( cdata, status, m, n, sol, ctrans ) BIND( C )
  USE GALAHAD_ULS_double_ciface
  IMPLICIT NONE

!  dummy arguments

  INTEGER ( KIND = C_INT ), INTENT( IN ), VALUE :: m, n
  LOGICAL ( KIND = C_BOOL ), INTENT( IN ), VALUE :: ctrans
  INTEGER ( KIND = C_INT ), INTENT( INOUT ) :: status
  REAL ( KIND = wp ), INTENT( INOUT ), DIMENSION( MAX( m, n ) ) :: sol
  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata

!  local variables

  TYPE ( f_uls_full_data_type ), POINTER :: fdata
  LOGICAL :: ftrans

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!   form and factorize the block matrix

  ftrans = ctrans
  CALL f_uls_solve_system( fdata, status, sol, ftrans )
  RETURN

  END SUBROUTINE uls_solve_system

!  --------------------------------------
!  C interface to fortran uls_information
!  --------------------------------------

  SUBROUTINE uls_information( cdata, cinform, status ) BIND( C ) 
  USE GALAHAD_ULS_double_ciface
  IMPLICIT NONE

!  dummy arguments

  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata
  TYPE ( uls_inform_type ), INTENT( INOUT ) :: cinform
  INTEGER ( KIND = C_INT ), INTENT( OUT ) :: status

!  local variables

  TYPE ( f_uls_full_data_type ), pointer :: fdata
  TYPE ( f_uls_inform_type ) :: finform

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  obtain ULS solution information

  CALL f_uls_information( fdata, finform, status )

!  copy inform out

  CALL copy_inform_out( finform, cinform )
  RETURN

  END SUBROUTINE uls_information

!  ------------------------------------
!  C interface to fortran uls_terminate
!  ------------------------------------

  SUBROUTINE uls_terminate( cdata, ccontrol, cinform ) BIND( C ) 
  USE GALAHAD_ULS_double_ciface
  IMPLICIT NONE

!  dummy arguments

  TYPE ( C_PTR ), INTENT( INOUT ) :: cdata
  TYPE ( uls_control_type ), INTENT( IN ) :: ccontrol
  TYPE ( uls_inform_type ), INTENT( INOUT ) :: cinform

!  local variables

  TYPE ( f_uls_full_data_type ), pointer :: fdata
  TYPE ( f_uls_control_type ) :: fcontrol
  TYPE ( f_uls_inform_type ) :: finform
  LOGICAL :: f_indexing

!  copy control in

  CALL copy_control_in( ccontrol, fcontrol, f_indexing )

!  copy inform in

  CALL copy_inform_in( cinform, finform )

!  associate data pointer

  CALL C_F_POINTER( cdata, fdata )

!  deallocate workspace

  CALL f_uls_terminate( fdata, fcontrol, finform )

!  copy inform out

  CALL copy_inform_out( finform, cinform )

!  deallocate data

  DEALLOCATE( fdata ); cdata = C_NULL_PTR 
  RETURN

  END SUBROUTINE uls_terminate
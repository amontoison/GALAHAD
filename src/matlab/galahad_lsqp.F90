#include <fintrf.h>

!  THIS VERSION: GALAHAD 3.1 - 20/08/2018 AT 16:50 GMT.

! *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
!
!                 MEX INTERFACE TO GALAHAD_LSQP
!
! *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
!
!  Given a symmetric n by n matrix H, an m by n matrix A, an n-vector g, a
!  constant f, n-vectors x_l <= x_u, w & x0 and m-vectors c_l <= c_u,
!  solve the SEPERABLE QUADRATIC PROGRAMMING problem
!    minimize 0.5 * sum w_i^2 ( x_i - x0_i )^2 + g' * x + f
!    subject to c_l <= A * x <= c_u and x_l <= x <= x_u
!  or LINEAR PROGRAMMING problem
!    minimize g' * x + f
!    subject to c_l <= A * x <= c_u and x_l <= x <= x_u
!  using an interior-point method. Advantage is taken of sparse A
!
!  Simple usage -
!
!  to solve the separable quadratic program
!   [ x, inform, aux ]
!     = galahad_lsqp( g, f, A, c_l, c_u, x_l, x_u, w, x0, control )
!
!  to solve the linear program
!   [ x, inform, aux ]
!     = galahad_lsqp( g, f, A, c_l, c_u, x_l, x_u, control )
!
!  Sophisticated usage -
!
!  to initialize data and control structures prior to solution
!   [ control ]
!     = galahad_lsqp( 'initial' )
!
!  to solve the separable quadratic program using existing data structures
!   [ x, inform, aux ]
!     = galahad_lsqp( 'existing', g, f, A, c_l, c_u, x_l, x_u, w, x0,
!                     control )
!
!  to solve the linear program using existing data structures
!   [ x, inform, aux ]
!     = galahad_lsqp( 'existing', g, f, A, c_l, c_u, x_l, x_u, control )
!
!  to remove data structures after solution
!   galahad_lsqp( 'final' )
!
!  Usual Input -
!    g: the n-vector g
!    f: the scalar f
!    A: the m by n matrix A
!    c_l: the m-vector c_l. The value -inf should be used for infinite bounds
!    c_u: the m-vector c_u. The value inf should be used for infinite bounds
!    x_l: the n-vector x_l. The value -inf should be used for infinite bounds
!    x_u: the n-vector x_u. The value inf should be used for infinite bounds
!
!  Optional Input -
!    w: the n-vector of weights w. If one of w and x0 is given, they must both
!    x0: the n-vector of shifts x0                                        be
!    control, a structure containing control parameters.
!      The components are of the form control.value, where
!      value is the name of the corresponding component of
!      the derived type LSQP_CONTROL as described in the
!      manual for the fortran 90 package GALAHAD_LSQP.
!      See: http://galahad.rl.ac.uk/galahad-www/doc/lsqp.pdf
!
!  Usual Output -
!   x: a local minimizer
!
!  Optional Output -
!   control: see above. Returned values are the defaults
!   inform: a structure containing information parameters
!      The components are of the form inform.value, where
!      value is the name of the corresponding component of
!      the derived type LSQP_INFORM as described in the manual for
!      the fortran 90 package GALAHAD_LSQP.
!      See: http://galahad.rl.ac.uk/galahad-www/doc/lsqp.pdf
!  aux: a structure containing Lagrange multipliers and constraint status
!   aux.c: values of the constraints A * x
!   aux.y: Lagrange multipliers corresponding to the general constraints
!        c_l <= A * x <= c_u
!   aux.z: dual variables corresponding to the bound constraints
!        x_l <= x <= x_u
!   aux.c_stat: vector indicating the status of the general constraints
!           c_stat(i) < 0 if (c_l)_i = (A * x)_i
!           c_stat(i) = 0 if (c_i)_i < (A * x)_i < (c_u)_i
!           c_stat(i) > 0 if (c_u)_i = (A * x)_i
!   aux.b_stat: vector indicating the status of the bound constraints
!           b_stat(i) < 0 if (x_l)_i = (x)_i
!           b_stat(i) = 0 if (x_i)_i < (x)_i < (x_u)_i
!           b_stat(i) > 0 if (x_u)_i = (x)_i
!
! *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

!  Copyright reserved, Gould/Orban/Toint, for GALAHAD productions
!  Principal author: Nick Gould

!  History -
!   originally released with GALAHAD Version 2.4. February 18th 2010

!  For full documentation, see
!   http://galahad.rl.ac.uk/galahad-www/specs.html

      SUBROUTINE mexFunction( nlhs, plhs, nrhs, prhs )
      USE GALAHAD_MATLAB
      USE GALAHAD_TRANSFER_MATLAB
      USE GALAHAD_LSQP_MATLAB_TYPES
      USE GALAHAD_LSQP_double
      IMPLICIT NONE
      INTEGER, PARAMETER :: wp = KIND( 1.0D+0 )

! ------------------------- Do not change -------------------------------

!  Keep the above subroutine, argument, and function declarations for use
!  in all your fortran mex files.
!
      INTEGER * 4 :: nlhs, nrhs
      mwPointer :: plhs( * ), prhs( * )

      INTEGER, PARAMETER :: slen = 30
      LOGICAL :: mxIsChar, mxIsStruct
      mwSize :: mxGetString, mxIsNumeric
      mwPointer :: mxCreateStructMatrix, mxGetPr

      INTEGER ::  mexPrintf
      CHARACTER ( LEN = 200 ) :: str

! -----------------------------------------------------------------------

!  local variables

      INTEGER :: i, info
      INTEGER * 4 :: i4
      mwSize :: g_arg, f_arg, a_arg, cl_arg, cu_arg, xl_arg, xu_arg
      mwSize :: w_arg, x0_arg, c_arg, x_arg, i_arg, aux_arg
      mwSize :: s_len
      mwPointer :: g_pr, f_pr, cl_pr, cu_pr, xl_pr, xu_pr, w_pr, x0_pr, c_in
      mwPointer :: g_in, f_in, a_in, cl_in, cu_in, xl_in, xu_in, w_in, x0_in
      mwPointer :: x_pr, y_pr, z_pr, b_stat_pr, c_stat_pr, c_pr
      mwPointer :: aux_c_pr, aux_y_pr, aux_z_pr, aux_c_stat_pr, aux_b_stat_pr

      CHARACTER ( len = 80 ) :: char_output_unit, filename
      LOGICAL :: opened, solve_lp, initial_set = .FALSE.
      INTEGER :: iores

      CHARACTER ( len = 8 ) :: mode
      TYPE ( LSQP_pointer_type ) :: LSQP_pointer
      INTEGER * 4, ALLOCATABLE, DIMENSION( : ) :: C_stat, B_stat

      INTEGER * 4, PARAMETER :: naux = 5
      CHARACTER ( LEN = 6 ), PARAMETER :: faux( naux ) = (/                    &
           'c     ', 'y     ', 'z     ', 'c_stat', 'b_stat' /)

!  arguments for LSQP

      TYPE ( QPT_problem_type ), SAVE :: p
      TYPE ( LSQP_control_type ), SAVE :: control
      TYPE ( LSQP_inform_type ), SAVE :: inform
      TYPE ( LSQP_data_type ), SAVE :: data

      mwPointer, ALLOCATABLE :: col_ptr( : )

!  Test input/output arguments

      IF ( nrhs < 1 )                                                          &
        CALL mexErrMsgTxt( ' galahad_lsqp requires at least 1 input argument' )

      IF ( mxIsChar( prhs( 1 ) ) ) THEN
        i = mxGetString( prhs( 1 ), mode, 8 )
        IF ( .NOT. ( TRIM( mode ) == 'initial' .OR.                            &
                     TRIM( mode ) == 'final' ) ) THEN
          IF ( nrhs < 2 )                                                      &
            CALL mexErrMsgTxt( ' Too few input arguments to galahad_lsqp' )
          g_arg = 2 ; f_arg = 3 ; a_arg = 4
          cl_arg = 5 ; cu_arg = 6 ; xl_arg = 7 ; xu_arg = 8
          IF ( nrhs > xu_arg ) THEN
            IF ( mxIsNumeric( prhs( xu_arg + 1 ) ) == 1 ) THEN
              w_arg = 9 ; x0_arg = 10 ; c_arg = 11
              solve_lp = .FALSE.
            ELSE
              c_arg = 9
              solve_lp = .TRUE.
            END IF
          ELSE
            c_arg = 9
            solve_lp = .TRUE.
          END IF
          IF ( nrhs > c_arg )                                                  &
            CALL mexErrMsgTxt( ' Too many input arguments to galahad_lsqp' )
          x_arg = 1 ; i_arg = 2 ; aux_arg = 3
        END IF
      ELSE
        mode = 'all'
        IF ( nrhs < 2 )                                                        &
          CALL mexErrMsgTxt( ' Too few input arguments to galahad_lsqp' )
        g_arg = 1 ; f_arg = 2 ; a_arg = 3 ;
        cl_arg = 4 ; cu_arg = 5 ; xl_arg = 6 ; xu_arg = 7
        IF ( nrhs > xu_arg ) THEN
          IF ( mxIsNumeric( prhs( xu_arg + 1 ) ) == 1 ) THEN
            w_arg = 8 ; x0_arg = 9 ; c_arg = 10
            solve_lp = .FALSE.
          ELSE
            c_arg = 8
            solve_lp = .TRUE.
          END IF
        ELSE
          c_arg = 8
          solve_lp = .TRUE.
        END IF
        IF ( nrhs > c_arg )                                                    &
          CALL mexErrMsgTxt( ' Too many input arguments to galahad_lsqp' )
        x_arg = 1 ; i_arg = 2 ; aux_arg = 3
      END IF

      IF ( nlhs > 3 )                                                          &
        CALL mexErrMsgTxt( ' galahad_lsqp provides at most 3 output arguments' )

!  Initialize the internal structures for lsqp

      IF ( TRIM( mode ) == 'initial' .OR. TRIM( mode ) == 'all' ) THEN
        initial_set = .TRUE.
        CALL LSQP_initialize( data, control, inform )
        IF ( TRIM( mode ) == 'initial' ) THEN
          c_arg = 1
          IF ( nlhs > c_arg )                                                  &
            CALL mexErrMsgTxt( ' too many output arguments required' )

!  If required, return the default control parameters

          IF ( nlhs > 0 )                                                      &
            CALL LSQP_matlab_control_get( plhs( c_arg ), control )
          RETURN
        END IF
      END IF

      IF ( .NOT. TRIM( mode ) == 'final' ) THEN

!  Check that LSQP_initialize has been called

        IF ( .NOT. initial_set )                                               &
          CALL mexErrMsgTxt( ' "initial" must be called first' )

!  If the third argument is present, extract the input control data

        s_len = slen
        IF ( nrhs == c_arg ) THEN
          c_in = prhs( c_arg )
          IF ( .NOT. mxIsStruct( c_in ) )                                      &
            CALL mexErrMsgTxt( ' last input argument must be a structure' )
          CALL LSQP_matlab_control_set( c_in, control, s_len )
        END IF

!  Open i/o units

        IF ( control%error > 0 ) THEN
          WRITE( char_output_unit, "( I0 )" ) control%error
          filename = "output_lsqp." // TRIM( char_output_unit )
          OPEN( control%error, FILE = filename, FORM = 'FORMATTED',            &
                STATUS = 'REPLACE', IOSTAT = iores )
        END IF

        IF ( control%out > 0 ) THEN
          INQUIRE( control%out, OPENED = opened )
          IF ( .NOT. opened ) THEN
            WRITE( char_output_unit, "( I0 )" ) control%out
            filename = "output_lsqp." // TRIM( char_output_unit )
            OPEN( control%out, FILE = filename, FORM = 'FORMATTED',            &
                  STATUS = 'REPLACE', IOSTAT = iores )
          END IF
        END IF

!  Create inform output structure

        CALL LSQP_matlab_inform_create( plhs( i_arg ), LSQP_pointer )

!  Import the problem data

         p%new_problem_structure = .TRUE.
         p%gradient_kind = 2

!  Check to ensure the input for A is a number

        a_in = prhs( a_arg )
        IF ( mxIsNumeric( a_in ) == 0 )                                        &
          CALL mexErrMsgTxt( ' There must be a matrix A ' )
        CALL MATLAB_transfer_matrix( a_in, p%A, col_ptr, .FALSE. )
        p%m = p%A%m ; p%n = p%A%n

        IF ( ALLOCATED( col_ptr ) ) DEALLOCATE( col_ptr, STAT = info )

!  Allocate space for input vectors

        ALLOCATE( p%G( p%n ), p%X_l( p%n ), p%X_u( p%n ),                      &
                  p%C( p%m ), p%C_l( p%m ), p%C_u( p%m ), STAT = info )

!  Input g

        g_in = prhs( g_arg )
        IF ( mxIsNumeric( g_in ) == 0 )                                        &
           CALL mexErrMsgTxt( ' There must be a vector g ' )
        g_pr = mxGetPr( g_in )
        CALL MATLAB_copy_from_ptr( g_pr, p%G, p%n )

!  Input f

        f_in = prhs( f_arg )
        IF ( mxIsNumeric( f_in ) == 0 )                                        &
           CALL mexErrMsgTxt( ' There must a scalar f ' )
        f_pr = mxGetPr( f_in )
        CALL MATLAB_copy_from_ptr( f_pr, p%f )

!  Input x_l

        xl_in = prhs( xl_arg )
        IF ( mxIsNumeric( xl_in ) == 0 )                                       &
           CALL mexErrMsgTxt( ' There must be a vector x_l ' )
        xl_pr = mxGetPr( xl_in )
        CALL MATLAB_copy_from_ptr( xl_pr, p%X_l, p%n )
        p%X_l = MAX( p%X_l, - 10.0_wp * CONTROL%infinity )

!  Input x_u

        xu_in = prhs( xu_arg )
        IF ( mxIsNumeric( xu_in ) == 0 )                                       &
           CALL mexErrMsgTxt( ' There must be a vector x_u ' )
        xu_pr = mxGetPr( xu_in )
        CALL MATLAB_copy_from_ptr( xu_pr, p%X_u, p%n )
        p%X_u = MIN( p%X_u, 10.0_wp * CONTROL%infinity )

!  Input c_l

        cl_in = prhs( cl_arg )
        IF ( mxIsNumeric( cl_in ) == 0 )                                       &
           CALL mexErrMsgTxt( ' There must be a vector c_l ' )
        cl_pr = mxGetPr( cl_in )
        CALL MATLAB_copy_from_ptr( cl_pr, p%C_l, p%m )
        p%C_l = MAX( p%C_l, - 10.0_wp * CONTROL%infinity )

!  Input c_u

        cu_in = prhs( cu_arg )
        IF ( mxIsNumeric( cu_in ) == 0 )                                       &
           CALL mexErrMsgTxt( ' There must be a vector c_u ' )
        cu_pr = mxGetPr( cu_in )
        CALL MATLAB_copy_from_ptr( cu_pr, p%C_u, p%m )
        p%C_u = MIN( p%C_u, 10.0_wp * CONTROL%infinity )

!  Optionally input QP parameters

        IF ( solve_lp ) THEN
          p%Hessian_kind = 0
        ELSE
          p%Hessian_kind = 2

          ALLOCATE( p%WEIGHT( p%n ), p%X0( p%n ), STAT = info )

!  Input w

          w_in = prhs( w_arg )
          IF ( mxIsNumeric( w_in ) == 0 )                                     &
            CALL mexErrMsgTxt( ' There must a vector w ' )
          w_pr = mxGetPr( w_in )
          CALL MATLAB_copy_from_ptr( w_pr, p%WEIGHT, p%n )

!  Input x0

          x0_in = prhs( x0_arg )
          IF ( mxIsNumeric( x0_in ) == 0 )                                     &
            CALL mexErrMsgTxt( ' There must a vector x0 ' )
          x0_pr = mxGetPr( x0_in )
          CALL MATLAB_copy_from_ptr( x0_pr, p%X0, p%n )
        END IF

!  Allocate space for the solution

        ALLOCATE( p%X( p%n ), p%Z( p%n ), p%Y( p%m ), STAT = info )

        p%X = 0.0_wp
        p%Y = 0.0_wp
        p%Z = 0.0_wp

        ALLOCATE( B_stat( p%n ), C_stat( p%m ), STAT = info )

!  Solve the QP

        CALL LSQP_solve( p, data, control, inform, C_stat, B_stat )

!  Print details to Matlab window

         IF ( control%out > 0 ) THEN
           REWIND( control%out, err = 500 )
            DO
              READ( control%out, "( A )", end = 500 ) str
              i = mexPrintf( TRIM( str ) // ACHAR( 10 ) )
            END DO
          END IF
   500   CONTINUE

!  Output solution

        i4 = 1
        plhs( x_arg ) = MATLAB_create_real( p%n, i4 )
        x_pr = mxGetPr( plhs( x_arg ) )
        CALL MATLAB_copy_to_ptr( p%X, x_pr, p%n )

!  Record output information

        CALL LSQP_matlab_inform_get( inform, LSQP_pointer )

!  if required, set auxiliary output containing Lagrange multipliesr and
!  constraint bound status

        IF ( nlhs == aux_arg ) THEN

!  set up space for the auxiliary arrays

          plhs( aux_arg ) = mxCreateStructMatrix( 1_mws_, 1_mws_, naux, faux )

          CALL MATLAB_create_real_component( plhs( aux_arg ),                  &
            'c', p%m, aux_c_pr )
          CALL MATLAB_create_real_component( plhs( aux_arg ),                  &
            'y', p%m, aux_y_pr )
          CALL MATLAB_create_real_component( plhs( aux_arg ),                  &
            'z', p%n, aux_z_pr )
          CALL MATLAB_create_integer_component( plhs( aux_arg ),               &
            'c_stat', p%m, aux_c_stat_pr )
          CALL MATLAB_create_integer_component( plhs( aux_arg ),               &
            'b_stat', p%n, aux_b_stat_pr )

!  copy the values

          c_pr = mxGetPr( aux_c_pr )
          CALL MATLAB_copy_to_ptr( p%C, c_pr, p%m )
          y_pr = mxGetPr( aux_y_pr )
          CALL MATLAB_copy_to_ptr( p%Y, y_pr, p%m )
          z_pr = mxGetPr( aux_z_pr )
          CALL MATLAB_copy_to_ptr( p%Z, z_pr, p%n )
          c_stat_pr = mxGetPr( aux_c_stat_pr )
          CALL MATLAB_copy_to_ptr( C_stat, c_stat_pr, p%m )
          b_stat_pr = mxGetPr( aux_b_stat_pr )
          CALL MATLAB_copy_to_ptr( B_stat, b_stat_pr, p%n )
        END IF
      END IF

!  all components now set

      IF ( TRIM( mode ) == 'final' .OR. TRIM( mode ) == 'all' ) THEN
        IF ( ALLOCATED( p%H%row ) ) DEALLOCATE( p%H%row, STAT = info )
        IF ( ALLOCATED( p%H%col ) ) DEALLOCATE( p%H%col, STAT = info )
        IF ( ALLOCATED( p%H%val ) ) DEALLOCATE( p%H%val, STAT = info )
        IF ( ALLOCATED( p%G ) ) DEALLOCATE( p%G, STAT = info )
        IF ( ALLOCATED( p%A%row ) ) DEALLOCATE( p%A%row, STAT = info )
        IF ( ALLOCATED( p%A%col ) ) DEALLOCATE( p%A%col, STAT = info )
        IF ( ALLOCATED( p%A%val ) ) DEALLOCATE( p%A%val, STAT = info )
        IF ( ALLOCATED( p%C_l ) ) DEALLOCATE( p%C_l, STAT = info )
        IF ( ALLOCATED( p%C_u ) ) DEALLOCATE( p%C_u, STAT = info )
        IF ( ALLOCATED( p%X_l ) ) DEALLOCATE( p%X_l, STAT = info )
        IF ( ALLOCATED( p%X_u ) ) DEALLOCATE( p%X_u, STAT = info )
        IF ( ALLOCATED( p%X ) ) DEALLOCATE( p%X, STAT = info )
        IF ( ALLOCATED( p%WEIGHT ) ) DEALLOCATE( p%WEIGHT, STAT = info )
        IF ( ALLOCATED( p%X0 ) ) DEALLOCATE( p%X0, STAT = info )
        IF ( ALLOCATED( p%Y ) ) DEALLOCATE( p%Y, STAT = info )
        IF ( ALLOCATED( p%Z ) ) DEALLOCATE( p%Z, STAT = info )
        IF ( ALLOCATED( p%C ) ) DEALLOCATE( p%C, STAT = info )
        IF ( ALLOCATED( C_stat ) ) DEALLOCATE( C_stat, STAT = info )
        IF ( ALLOCATED( B_stat ) ) DEALLOCATE( B_stat, STAT = info )
        CALL LSQP_terminate( data, control, inform )
      END IF

!  close any opened io units

      IF ( control%error > 0 ) THEN
         INQUIRE( control%error, OPENED = opened )
         IF ( opened ) CLOSE( control%error )
      END IF

      IF ( control%out > 0 ) THEN
         INQUIRE( control%out, OPENED = opened )
         IF ( opened ) CLOSE( control%out )
      END IF

      RETURN
      END SUBROUTINE mexFunction

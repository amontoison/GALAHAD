! THIS VERSION: GALAHAD 4.1 - 2023-01-24 AT 09:30 GMT.
#include "galahad_modules.h"
   PROGRAM GALAHAD_CRO_TEST   ! ** to be improved!
   USE GALAHAD_KINDS_precision
   USE GALAHAD_CRO_precision
   IMPLICIT NONE
   REAL ( KIND = rp_ ), PARAMETER :: infinity = 10.0_rp_ ** 20
   TYPE ( CRO_data_type ) :: data
   TYPE ( CRO_control_type ) :: control
   TYPE ( CRO_inform_type ) :: inform
   INTEGER ( KIND = ip_ ) :: i
   INTEGER ( KIND = ip_ ), PARAMETER :: n = 11, m = 3, m_equal = 1
   INTEGER ( KIND = ip_ ), PARAMETER :: a_ne = 30, h_ne = 21
   INTEGER ( KIND = ip_ ), DIMENSION( h_ne ) :: H_col
   INTEGER ( KIND = ip_ ), DIMENSION( n + 1 ) :: H_ptr
   REAL ( KIND = rp_ ), DIMENSION( h_ne ) :: H_val
   INTEGER ( KIND = ip_ ), DIMENSION( a_ne ) :: A_col
   INTEGER ( KIND = ip_ ), DIMENSION( m + 1 ) :: A_ptr
   REAL ( KIND = rp_ ), DIMENSION( a_ne ) :: A_val
   REAL ( KIND = rp_ ), DIMENSION( n ) :: G, X_l, X_u, X, Z
   REAL ( KIND = rp_ ), DIMENSION( m ) :: C_l, C_u, C, Y
   INTEGER ( KIND = ip_ ), DIMENSION( m ) :: C_stat
   INTEGER ( KIND = ip_ ), DIMENSION( n ) :: X_stat
! start problem data
   H_val = (/ 1.0_rp_, 0.5_rp_, 1.0_rp_, 0.5_rp_, 1.0_rp_, 0.5_rp_, 1.0_rp_,   &
              0.5_rp_, 1.0_rp_, 0.5_rp_, 1.0_rp_, 0.5_rp_, 1.0_rp_, 0.5_rp_,   &
              1.0_rp_, 0.5_rp_, 1.0_rp_, 0.5_rp_, 1.0_rp_, 0.5_rp_, 1.0_rp_    &
            /) ! H values
   H_col = (/ 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10,    &
              11 /)                              ! H columns
   H_ptr = (/ 1, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22 /) ! pointers to H col
   A_val  = (/ 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_,  &
               1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_,  &
               1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_,  &
               1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_,  &
               1.0_rp_, 1.0_rp_ /) ! A values
   A_col = (/ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 3, 4, 5, 6, 7, 8, 9, 10, 11,  &
              2, 3, 4, 5, 6, 7, 8, 9, 10, 11 /) ! A columns
   A_ptr = (/ 1, 12, 21, 31 /)                  ! pointers to A columns
   G   = (/ 0.5_rp_, -0.5_rp_, -1.0_rp_, -1.0_rp_, -1.0_rp_,  -1.0_rp_,        &
           -1.0_rp_, -1.0_rp_, -1.0_rp_, -1.0_rp_, -0.5_rp_ /) ! objective grad
   C_l = (/  10.0_rp_, 9.0_rp_, - infinity /)       ! constraint lower bound
   C_u = (/  10.0_rp_, infinity, 10.0_rp_ /)        ! constraint upper bound
   X_l = (/ 0.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_,     &
            1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_ /) ! variable lower bound
   X_u  = (/ infinity, infinity, infinity, infinity, infinity, infinity,       &
             infinity, infinity, infinity, infinity, infinity /) ! upper bound
   C = (/ 10.0_rp_, 9.0_rp_, 10.0_rp_ /)              ! optimal constraint value
   X = (/ 0.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_,       &
          1.0_rp_, 1.0_rp_, 1.0_rp_, 1.0_rp_ /)   ! optimal variables
   Y = (/  -1.0_rp_, 1.5_rp_, -2.0_rp_ /)         ! optimal Lagrange multipliers
   Z = (/ 2.0_rp_, 4.0_rp_, 2.5_rp_, 2.5_rp_, 2.5_rp_, 2.5_rp_,                &
          2.5_rp_, 2.5_rp_, 2.5_rp_, 2.5_rp_, 2.5_rp_ /) !optimal dual variables
   C_stat = (/ -1, -1, 1 /)                         ! constraint status
   X_stat = (/ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 /) ! variable status
! problem data complete
   CALL CRO_initialize( data, control, inform ) ! Initialize control parameters
   control%print_level = 3
   CALL CRO_crossover( n, m, m_equal, H_val, H_col, H_ptr, A_val, A_col,       &
                       A_ptr, G, C_l, C_u, X_l, X_u, C, X, Y, Z, C_stat,       &
                       X_stat , data, control, inform )  ! crossover
   IF ( inform%status == 0 ) THEN                   ! successful return
     WRITE( 6, "( '      x_l          x          x_u          z     stat', /,  &
   &               ( 4ES12.4, I5 ) )" )                                        &
       ( X_l( i ), X( i ), X_u( i ), Z( i ), X_stat( i ), i = 1, n )
     WRITE( 6, "( '      c_l          c          c_u          y     stat', /,  &
   &               ( 4ES12.4, I5 ) )" )                                        &
       ( C_l( i ), C( i ), C_u( i ), Y( i ), C_stat( i ), i = 1, m )
     WRITE( 6, "( ' CRO_solve exit status = ', I0 ) " ) inform%status
   ELSE                                            ! error returns
     WRITE( 6, "( ' CRO_solve exit status = ', I0 ) " ) inform%status
   END IF
   CALL CRO_terminate( data, control, inform )     ! delete internal workspace
   END PROGRAM GALAHAD_CRO_TEST


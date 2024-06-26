! THIS VERSION: GALAHAD 4.1 - 2023-01-24 AT 09:30 GMT.
#include "galahad_modules.h"
   PROGRAM GALAHAD_GLS_big_example
   USE GALAHAD_KINDS_precision
   USE GALAHAD_GLS_precision
   IMPLICIT NONE
   INTEGER ( KIND = ip_ ) :: i, j, l, info, m, n, ne, ns, rank, dependent
   TYPE ( SMT_TYPE ) :: MATRIX, SUBMATRIX
   TYPE ( GLS_CONTROL ) :: CONTROL
   TYPE ( GLS_AINFO ) :: AINFO
   TYPE ( GLS_FINFO ) :: FINFO
   TYPE ( GLS_SINFO ) :: SINFO
   TYPE ( GLS_FACTORS ) :: FACTORS
   INTEGER ( KIND = ip_ ), ALLOCATABLE, DIMENSION( : ) :: ROWS, COLS
   INTEGER ( KIND = ip_ ), ALLOCATABLE, DIMENSION( : ) :: ROWS_order, COLS_order
   REAL ( KIND = rp_ ), ALLOCATABLE, DIMENSION( : ) :: B, X

!  Read matrix order and number of entries

   READ( 5, * ) n, ne
   m = n
   MATRIX%m = m ; MATRIX%n = n ; MATRIX%ne = ne

!  Allocate arrays of appropriate sizes

   ALLOCATE( MATRIX%VAL( ne ),  MATRIX%ROW( ne ),  MATRIX%COL( ne ) )
   ALLOCATE( B( m ), X( n ), ROWS( m ), COLS( n ) )

!  Read matrix

   READ( 5, * ) ( MATRIX%ROW( i ), MATRIX%COL( i ), MATRIX%VAL( i ), i = 1, ne )

!  Construct right-hand side B for solution of ones

   B = 0.0_rp_
   DO i = 1, ne
     B(MATRIX%row(i)) = B(MATRIX%row(i)) + MATRIX%VAL(i)
   END DO

!  Initialize the structures

   CALL GLS_initialize( FACTORS, CONTROL )
   CONTROL%btf = n + 1

!  Analyse and factorize

   CALL GLS_analyse( MATRIX, FACTORS, CONTROL, AINFO, FINFO )
   IF ( AINFO%flag < 0 ) THEN
     WRITE( 6, '( A, I0 )' )                                                   &
       ' Failure of GLS_ANALYSE with AINFO%flag = ',  AINFO%flag
     STOP
   END IF
   WRITE( 6, "( ' dimension, rank ', I0, 1X, I0 )" ) n, AINFO%rank
!  STOP

!  Write row and column reorderings

   CALL GLS_special_rows_and_cols( FACTORS, rank, COLS, ROWS, info )
!  WRITE( 6, "( A, /, ( 10I5 ) )" ) ' row orderings:', ROWS( : rank )
!  WRITE( 6, "( A, /, ( 10I5 ) )" ) ' column orderings:', COLS( : rank )
!  WRITE( 28, "( A, /, ( 10I5 ) )" ) ' row orderings:', ROWS( : rank )
!  WRITE( 28, "( A, /, ( 10I5 ) )" ) ' column orderings:', COLS( : rank )

   WRITE( 6, "( ' dimension, rank ', I0, 1X, I0 )" ) n, rank

   CALL GLS_solve( MATRIX, FACTORS, B, X, CONTROL, SINFO )
   IF ( SINFO%flag == 0 ) WRITE( 6, '( A, /,( 6ES11.3 ) )' )                   &
     ' Solution of set of equations without refinement is', X( : 5 )

!  Flag the rows and columns that make up the nonsingular submatrix

   ALLOCATE( ROWS_order( m ), COLS_order( n ) )
   COLS_order = 0
   DO i = 1, rank
    COLS_order( COLS( i ) ) = i
   END DO
   ROWS_order = 0
   DO i = 1, rank
     ROWS_order( ROWS( i ) ) = i
   END DO

        l = 0
        dependent = m + 1
        DO i = 1, rank
          IF ( ROWS_order( i ) > 0 ) THEN
            l = l + 1
            ROWS_order( i ) = l
            ROWS( l ) = i
          ELSE
            dependent = dependent - 1
            ROWS_order( i ) = dependent
            ROWS( dependent ) = i
          END IF
        END DO


   ns = 0
   DO l = 1, ne
     i = ROWS_order( MATRIX%col( l ) )
     j = COLS_order( MATRIX%row( l ) )
     IF ( i <= rank .AND. j > 0 ) THEN
       ns = ns + 1
       MATRIX%row( ns ) = i
       MATRIX%col( ns ) = j
       MATRIX%val( ns ) = MATRIX%val( l )
     END IF
   END DO
   MATRIX%ne = ns

   B = 0.0_rp_
   DO i = 1, ne
     B(MATRIX%row(i)) = B(MATRIX%row(i)) + MATRIX%VAL(i)
   END DO


!  WRITE( 28, "( 3( 2I4, ES12.4 ) ) " ) ( MATRIX%row( i ),                     &
!     MATRIX%col( i ), MATRIX%val( i ), i = 1, MATRIX%ne )

   MATRIX%m = rank ; MATRIX%n = rank ; MATRIX%ne = ns
   WRITE( 6, "( ' dimension, nnz submatrix ', I0, 1X, I0 )" ) rank, ns

   CONTROL%btf = MATRIX%n
   CONTROL%u = 2.5_rp_
   CALL GLS_analyse( MATRIX, FACTORS, CONTROL, AINFO, FINFO )
        write(6,*) CONTROL
        write(6,*) AINFO
        write(6,*) FINFO
   WRITE( 6, "( ' dimension, rank ', I0, 1X, I0 )" ) n, AINFO%rank

   WRITE( 6, "( ' nnz(prec,factors)', 2( 1X, I0 ))") &
      MATRIX%ne, FINFO%size_factor

   CALL GLS_solve( MATRIX, FACTORS, B, X, CONTROL, SINFO )
!  IF ( SINFO%flag == 0 ) WRITE( 6, '( A, /,( 6ES11.3 ) )' )                   &
   WRITE( 6, '( A, /,( 6ES11.3 ) )' )                    &
     ' Solution of set of equations without refinement is', X( : 5 )

!  Clean up

   DEALLOCATE( MATRIX%VAL, MATRIX%ROW, MATRIX%COL )
   CALL GLS_FINALIZE( FACTORS, CONTROL, INFO )

   END PROGRAM GALAHAD_GLS_big_example

! THIS VERSION: GALAHAD 4.1 - 2023-01-24 AT 09:30 GMT.

#include "galahad_modules.h"

!-*-*-*-*-*-*-*-*-  G A L A H A D   R U N S Q P _ S I F  *-*-*-*-*-*-*-*-

!  Nick Gould, Dominique Orban and Philippe Toint, for GALAHAD productions
!  Copyright reserved
!  March 8th 2006

   PROGRAM RUNSQP_SIF_precision
   USE GALAHAD_KINDS_precision
   USE GALAHAD_USESQP_precision

!  Main program for the SIF interface to SQP, a primative SQP
!  algorithm for nonlinear programming

!  Problem insif characteristics

   INTEGER ( KIND = ip_ ), PARAMETER :: errout = 6
   INTEGER ( KIND = ip_ ), PARAMETER :: insif = 55
   CHARACTER ( LEN = 16 ) :: prbdat = 'OUTSDIF.d'
   INTEGER ( KIND = ip_ ) :: iostat

!  Open the data input file

   OPEN( insif, FILE = prbdat, FORM = 'FORMATTED', STATUS = 'OLD',             &
         IOSTAT = iostat )
   IF ( iostat > 0 ) THEN
     WRITE( errout,                                                            &
       "( ' ERROR: could not open file OUTSDIF.d on unit ', I2 )" ) insif
     STOP
   END IF
   REWIND insif

!  Call the SIF interface

!  CALL USE_SQP( insif )
   CALL USE_SQP_DPR( insif )

!  Close the data input file

   CLOSE( insif  )
   STOP

!  End of RUNSQP_SIF_precision

   END PROGRAM RUNSQP_SIF_precision

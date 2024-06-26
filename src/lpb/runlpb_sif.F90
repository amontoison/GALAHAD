! THIS VERSION: GALAHAD 4.1 - 2023-01-24 AT 09:30 GMT.

#include "galahad_modules.h"

!-*-*-*-*-*-*-*-*-  G A L A H A D   R U N L P B _ S I F  *-*-*-*-*-*-*-*-*-*-

!  Copyright reserved, Gould/Orban/Toint, for GALAHAD productions
!  Principal author: Nick Gould

!  History -
!   originally released with GALAHAD Version 3.1. August 7th 2018

!  For full documentation, see
!   http://galahad.rl.ac.uk/galahad-www/specs.html

   PROGRAM RUNLPB_SIF_precision

!    ---------------------------------------
!    | Main program for the SIF/CUTEr      |
!    | interface to LPB, an interior-point |
!    | algorithm for linear programming    |
!    ---------------------------------------

   USE GALAHAD_KINDS_precision
   USE GALAHAD_USELPB_precision

!  Problem input characteristics

   INTEGER ( KIND = ip_ ), PARAMETER :: input = 55
   CHARACTER ( LEN = 16 ) :: prbdat = 'OUTSDIF.d'

!  Open the data input file

   OPEN( input, FILE = prbdat, FORM = 'FORMATTED', STATUS = 'OLD'  )
   REWIND input

!  Call the CUTEst interface

   CALL USE_LPB( input, close_input = .TRUE. )
   STOP

!  End of RUNLPB_SIF_precision

   END PROGRAM RUNLPB_SIF_precision

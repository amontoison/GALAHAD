! THIS VERSION: GALAHAD 4.1 - 2022-12-28 AT 11:00 GMT.
#include "galahad_modules.h"
!! Implements an F90 wrapper around the solvers implemented in the
!!
!!            G  A  L  A  H  A  D
!!
!! optimization library, to make functions within Fortran 90 modules
!! visible to the linker when linking with a C object file.
!!
!! Grants access to
!!
!! [5] LANCELOT-B
!!     Augmented Lagrangian code for General Nonlinear Programs.
!!
!! D. Orban@ECE                                   Chicago, March 2003
!!
!! Thanks to the f2py project      http://cens.ioc.ee/projects/f2py2e
!!===================================================================

!! ===============================
!! Main wrapper around USE_LANCELOT( )
!! ===============================

Subroutine Wrap_Use_Lancelot( setup_use_lancelot )

  Use GALAHAD_USELANCELOT_precision  ! Main LANCELOT B driver module
  External setup_use_lancelot     ! Declared in galahad.c

  ! Pass pointer to subroutine USE_LANCELOT to calling function
  Call setup_use_lancelot( USE_LANCELOT )

  Return

End Subroutine Wrap_Use_Lancelot

!!=================================
!! End of wrapper
!! ================================

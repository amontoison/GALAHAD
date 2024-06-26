C  THIS VERSION: GALAHAD 5.0 - 2024-04-12 AT 09:00 GMT.

#include "hsl_subset.h"

      SUBROUTINE MC13DR(N,ICN,LICN,IP,LENR,IOR,IB,
     +                  NUM,IW)
      USE HSL_KINDS, ONLY: ip_
      INTEGER(ip_) LICN,N,NUM
      INTEGER(ip_) IB(N),ICN(LICN),IOR(N),IP(N),IW(N,3),LENR(N)
      END SUBROUTINE MC13DR

      SUBROUTINE MC13ER(N,ICN,LICN,IP,LENR,ARP,IB,NUM,
     +                  LOWL,NUMB,PREV)
      USE HSL_KINDS, ONLY: ip_
      INTEGER(ip_) LICN,N,NUM
      INTEGER(ip_) ARP(N),IB(N),ICN(LICN),IP(N),LENR(N),
     +             LOWL(N),NUMB(N),PREV(N)
      END SUBROUTINE MC13ER

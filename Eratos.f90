!@name      Eratos
!@author    Robert Streetman
!@date      2014-01-07 -Updated 2017-09-15
!@desc      Implements Sieve of Eratosthenes to generate all primes below given integer, then returns the largest prime.
!
PROGRAM ERATOS
IMPLICIT NONE

INTEGER :: lim                                 !Limit of prime generation
LOGICAL, ALLOCATABLE,DIMENSION(:) :: primes    !Array of booleans representing integers 0-limit
INTEGER :: mid,mult,i,j                        !Utility counters/placeholders

!Prompt user for limit
PRINT *, 'Enter an integer n to find all primes 0 - n and return the largest: '
READ *, lim

ALLOCATE(primes(lim))
primes(1:lim) = .TRUE.
mid = lim / 2

!Generate primes
DO i = 2,mid
    IF (primes(i)) THEN
        mult = lim / i
        !If true, this candidate will not produce a prime
        DO j = 2, mult
            primes(i * j) = .FALSE.
        END DO
    END IF
END DO

!Find first number still prime below lim
i = lim
DO WHILE (.NOT.primes(i))
    i = i - 1
ENDDO

DEALLOCATE(primes)

PRINT *, 'Prime Found: ', i

END PROGRAM ERATOS

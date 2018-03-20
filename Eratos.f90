!@name      Eratos
!@author    Robert Streetman
!@date      2014-01-07 -Updated 2017-09-15
!@desc      Implements Sieve of Eratosthenes to generate all primes below given integer, then returns the largest prime.

program eratos
implicit none

integer :: lim                                 !limit of prime generation
logical, allocatable,dimension(:) :: primes    !array of booleans representing integers 0-limit
integer :: mid,mult,i,j                        !utility counters/placeholders

!prompt user for limit
print *, 'enter an integer n to find all primes 0 - n and return the largest: '
read *, lim

allocate(primes(lim))
primes(1:lim) = .true.
mid = lim / 2

!generate primes
do i = 2,mid
    if (primes(i)) then
        mult = lim / i
        !if true, this candidate will not produce a prime
        do j = 2, mult
            primes(i * j) = .false.
        end do
    end if
end do

!find first number still prime below lim
i = lim
do while (.not.primes(i))
    i = i - 1
enddo

deallocate(primes)

print *, 'prime found: ', i

end program eratos

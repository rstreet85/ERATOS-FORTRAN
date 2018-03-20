!@name      Eratos
!@author    Robert Streetman
!@date      2014-01-07 -Updated 2017-09-15
!@desc      Implements Sieve of Eratosthenes to generate all primes below given integer, then returns the largest prime.

program eratos
  implicit none

  integer :: lim,argc
  integer,allocatable :: primes(:)   ! Fortran 2003 auto-allocation
  character(16) :: argv  ! make it bigger if you want...
  logical :: verbose=.false.

  argc = command_argument_count()
  if (argc > 0) then
    call get_command_argument(1,argv); read(argv,*) lim
  else
    print *, 'enter an integer n to find all primes 0 - n and print the largest: '
    read *, lim
  endif

  if (argc>1 .and. (argv=='-v')) verbose=.true.

  primes = eratos_primes(lim)

  if (verbose) print '(A,10000000I9)', 'all primes found: ',primes
  print *, 'largest prime found: ', maxval(primes)

contains

pure function eratos_primes(lim)

  integer, intent(in) :: lim
  integer,allocatable :: eratos_primes(:)

  integer :: mid,mult,i,j            !utility counters/placeholders
  ! logical(1) gives ~ 4x memory savings and 40% speedup (gfortran: -O0 and -O3)
  logical(1) :: primes(lim)    !array of booleans representing integers 0-limit

  primes(:) = .true.
  mid = lim / 2

  !generate primes
  do i = 2,mid
      if (primes(i)) then
          mult = lim / i
          !if true, this candidate will not produce a prime
          do concurrent (j = 2:mult)
            primes(i * j) = .false.
          end do
      end if
  end do

  ! collect output
  allocate(eratos_primes(count(primes)))

! iterable way saves memory over one-liner pack() for large prime cases
  j = 1
  do concurrent (i=1:lim)
    if (primes(i))  then
      eratos_primes(j) = i
      j = j+1
    endif
  enddo


end function eratos_primes


end program

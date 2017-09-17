#
FC = gfortran

#These flags are for development only
#Flags:
FCFLAGS = -g3 -fbounds-check -fbacktrace -Wall -Wextra -pedantic
#Optimization flags
#FCFLAGS += -O3

ERATOS: Eratos.o
	$(FC) $(FCFLAGS) -o ERATOS.exe Eratos.o
Eratos.o: Eratos.f90
	$(FC) $(FCFLAGS) -c Eratos.f90

#Cleanup
clean:
	rm -f *.o *.mod
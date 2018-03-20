#
# FC = gfortran

#These flags are for development only
#Flags:
FCFLAGS = -g3 -fcheck=all -fbacktrace -Wall -Wextra -Wpedantic -Warray-bounds
#Optimization flags
#FCFLAGS += -O3

eratos: Eratos.o
	$(FC) $(FCFLAGS) -o $@ $^
Eratos.o: Eratos.f90
	$(FC) $(FCFLAGS) -c $^

#Cleanup
clean:
	$(RM) *.o *.mod eratos

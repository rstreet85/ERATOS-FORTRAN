#
# FC = gfortran

#These flags are for development only
#Flags:
#FCFLAGS = -g3 -fcheck=all -fbacktrace -Wall -Wextra -Wpedantic -Warray-bounds
#Optimization flags
FCFLAGS += -O3

eratos: Eratos.f90
	$(FC) $(FCFLAGS) -o $@ $^


#Cleanup
clean:
	$(RM) *.o *.mod eratos

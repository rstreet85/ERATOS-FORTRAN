
# gfortran
FCFLAGS = -g3 -fcheck=all -fbacktrace -Wall -Wextra -Wpedantic -Warray-bounds
# ifort
#FCFLAGS = -g -traceback -check all -debug extended

#Optimization flags
FCFLAGS += -O3

eratos: Eratos.f90
	$(FC) $(FCFLAGS) -o $@ $^


#Cleanup
clean:
	$(RM) *.o *.mod eratos

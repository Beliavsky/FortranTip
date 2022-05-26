// GitHub FortranTip call_print_stats.c
// prototype generated by
// gfortran -c -fc-prototypes m.f90 print_stats.f90
void print_stats(const int *n, const float *x);

int main() {
   float x[] = {5.0,6.0,7.0,8.0};
   int n = sizeof(x)/sizeof(x[0]);
   print_stats(&n,x); // &n used since argument n of Fortran
   // subroutine print_stats does not have VALUE attribute
}
// compile with
//   gcc -o call_print_stats.o -c call_print_stats.c
//   gfortran call_print_stats.o print_stats.f90
// output:
//   min, max, mean = 5.0 8.0 6.5
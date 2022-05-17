// GitHub FortranTip squares.c
#include <stdlib.h>
const int nsq_max = 1000000;

int *squares_p(const int sq_max, int *nsq) {
	// return up to nsq_max squares, not exceeding sq_max
	// nsq = # of squares returned
	int* ptr;
	// allocate memory for nsq_max integers
	ptr = (int*)malloc(nsq_max*sizeof(int));
	*nsq = nsq_max;
	int j;
	for (int i = 0; i < nsq_max; ++i) {
		j = i+1;
		ptr[i] = j*j;
		if (ptr[i] > sq_max) {
			*nsq = i;
		        // reallocate if fewer than nsq_max integers are
		        // returned
			ptr = (int *) realloc(ptr,*nsq);
			break;
		}
	}
	return ptr;
}
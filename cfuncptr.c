// GitHub FortranTip cfuncptr.c
int cfunc_2i(int i, int j, int (*func_ptr) (int, int)) {
	// return the value of a function at (i, j)
	return ((*func_ptr) (i,j));
}
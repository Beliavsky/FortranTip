void scale_vec(const double xscale, const int n, double x[]) {
	for (int i=0; i<n; i++) {
		x[i] *= xscale;
	}
}
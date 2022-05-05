double sum_vec(double x[], const int n) {
	double xsum = 0.0;
	for (int i=0; i<n; i++)
		xsum += x[i];
	return xsum;
}
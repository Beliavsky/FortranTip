#include <stdio.h>

void sum_rows(const int nr, const int nc, const float x[nr][nc], float sums[nr])
{
	for (int ir=0; ir<nr; ir++) {
		sums[ir] = 0.0;
		for (int ic=0; ic<nc; ic++) {
			sums[ir] += x[ir][ic];
		}
	}
}
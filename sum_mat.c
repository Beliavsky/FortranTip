#include "sum_mat.h"
#include <stdio.h>

void print_mat(const int nr, const int nc, const float x[nr][nc])
{
	for (int ir=0; ir<nr; ir++) {
		for (int ic=0; ic<nc; ic++) {
			printf(" %f",x[ir][ic]);
		}
		printf("\n");
	}
}

void print_mat_transpose(const int nr, const int nc, const float x[nr][nc])
{
	for (int ic=0; ic<nc; ic++) {
		for (int ir=0; ir<nr; ir++) {
			printf(" %f",x[ir][ic]);
		}
		printf("\n");
	}
}

float sum_mat(const int nr, const int nc, const float x[nr][nc])
{
	float xsum = 0.0;
	for (int ir=0; ir<nr; ir++)
		for (int ic=0; ic<nc; ic++)
			xsum += x[ir][ic];
	return xsum;
}

void sum_rows(const int nr, const int nc, const float x[nr][nc], float sums[nr])
{
	for (int ir=0; ir<nr; ir++) {
		sums[ir] = 0.0;
		for (int ic=0; ic<nc; ic++) {
			sums[ir] += x[ir][ic];
		}
	}
}

void scale_mat(float xscale, const int nr, const int nc, float x[nr][nc])
{
	for (int ir=0; ir<nr; ir++) {
		for (int ic=0; ic<nc; ic++) {
			x[ir][ic] *= xscale;
		}
	}
}

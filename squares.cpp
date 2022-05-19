#include <stdlib.h>
#include <vector>
using namespace std;

extern "C" {
	int *squares_p(const int nsq_max, const int sq_max, int *nsq);
}

vector <int> squares_vec(const int nsq_max, const int sq_max) {
	vector <int> v;
	for (int i=1; i<=nsq_max; i++) {
		const int j = i*i;
		if (j > sq_max) break;
		v.push_back(j);
	}
	return v;
}

int *vec_to_pointer(const vector <int> & w, int *n) {
	*n = w.size();
	int* ptr = new int[*n];
	std::copy(w.begin(), w.end(), ptr);
	return ptr;
}

int *squares_p(const int nsq_max, const int sq_max, int *nsq) {
	// return up to nsq_max squares, not exceeding sq_max
	// nsq = # of squares returned
	const vector <int> squares = squares_vec(nsq_max, sq_max);
	*nsq = squares.size();
	return vec_to_pointer(squares, nsq);
}
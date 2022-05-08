// https://people.duke.edu/~ccc14/sta-663-2018/notebooks/S12_CPP_Annotated.html

#include <random>
#include <functional> // needed for bind
extern "C" void normal_vec(int seed, int n, double x[]);

using std::default_random_engine,std::normal_distribution, std::bind;

void normal_vec(int seed, int n, double x[]) {
	// start random number engine with fixed seed
	unsigned int uiseed = seed;
	default_random_engine re{uiseed};
	normal_distribution<double> norm(0,1); // mean and standard deviation
	auto rnorm = bind(norm, re);
	for (int i = 0; i<n; ++i) x[i] = rnorm();
}

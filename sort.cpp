// GitHub FortranTip sort.cpp
#include <algorithm>
#include <span> // requires GCC 10 or higher
extern "C" {
void sort_f(int n, float x[]) {
        // create view for x in xspan
	std::span xspan{x, static_cast<size_t>(n)};
        // sort xspan and therefore x
	std::sort(xspan.begin(),xspan.end());
}
}
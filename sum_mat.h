void print_mat(const int nr, const int nc, const float x[nr][nc]);
void print_mat_transpose(const int nr, const int nc, const float x[nr][nc]);
float sum_mat(const int nr, const int nc, const float x[nr][nc]);
void sum_rows(const int nr, const int nc, const float x[nr][nc], float sums[nr]);
void scale_mat(float xscale, const int nr, const int nc, float x[nr][nc]);

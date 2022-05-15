extern const double pi; // GitHub FortranTip circle.c
double circumference;

double area_circle(double radius) {
	return pi*radius*radius;
}

void set_circumference(double radius) {
// global variables should generally be avoided
	circumference = 2*pi*radius;
}
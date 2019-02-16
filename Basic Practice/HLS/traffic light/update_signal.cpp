#include "update_signal.h"

void update_signal(data_t t, data_rgb *light1, data_rgb *light2) {
	if ((t >= 0) && (t < 8)) {
		*light1 = data_rgb("100", 2); // 4, RED
		*light2 = data_rgb("010", 2); // 2, GREEN
	} else if ((t >= 8) && (t < 10)) {
		*light1 = data_rgb("100", 2); // 4, RED
		*light2 = data_rgb("110", 2); // 6, YELLOW
	} else if ((t >= 10) && (t < 18)) {
		*light1 = data_rgb("010", 2); // 2, GREEN
		*light2 = data_rgb("100", 2); // 4, RED
	} else if ((t >= 18) && (t < 20)) {
		*light1 = data_rgb("110", 2); // 6, YELLOW
		*light2 = data_rgb("100", 2); // 4, RED
	} else {
		*light1 = data_rgb("110", 2); // 6, YELLOW
		*light2 = data_rgb("110", 2); // 6, YELLOW
	}
}
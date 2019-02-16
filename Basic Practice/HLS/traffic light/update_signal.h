#include "ap_int.h"

typedef ap_uint<8> data_t;
typedef ap_uint<3> data_rgb;

void update_signal(data_t t, data_rgb *light1, data_rgb *light2);
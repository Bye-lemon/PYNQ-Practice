#include "iostream"
#include "iomanip"
#include "update_signal.h"

using namespace std;

int main(void) {
	data_t T[21] = { 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
					10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 
					20};
	
	data_rgb R1[21] = { 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
						2, 2, 2, 2, 2, 2, 2, 2, 6, 6,
						6};
	data_rgb R2[21] = { 2, 2, 2, 2, 2, 2, 2, 2, 6, 6,
						4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
						6};
	
	data_rgb P1;
	data_rgb P2;
	unsigned int i;
	unsigned int ErrCnt = 0;
	
	cout<<left<<setw(30)<<setfill('-')<<'-'<<endl;
	cout<<left<<setw(10)<<setfill(' ')<<'T';
	cout<<left<<setw(10)<<setfill(' ')<<"R1";
	cout<<left<<setw(10)<<setfill(' ')<<"R2"<<endl;
	cout<<left<<setw(30)<<setfill('-')<<'-'<<endl;
	
	for (i = 0; i < 20; i ++) {
		update_signal(T[i], &P1, &P2);
		
		cout<<left<<setw(10)<<setfill(' ')<<T[i];
		cout<<left<<setw(10)<<setfill(' ')<<P1;
		cout<<left<<setw(10)<<setfill(' ')<<P2;
		
		if ((P1 == R1[i]) && (P2 == R2[i])) {
			cout<<'\n';
		} else {
			cout<<'('<<R1[i]<<", "<<R2[i]<<')'<<endl;
			ErrCnt ++;
		}
	}
	
	cout<<left<<setw(30)<<setfill('-')<<'-'<<endl;
	
	if (ErrCnt > 0) {
		cout<<"Test Failed!"<<endl;
		cout<<left<<setw(30)<<setfill('-')<<'-'<<endl;
		
		return 1;
	} else {
		cout<<"Test Pass!"<<endl;
		cout<<left<<setw(30)<<setfill('-')<<'-'<<endl;
		
		return 0;
	}
}
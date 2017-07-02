#include<iostream>
#include<iomanip>
using namespace std;

int main() {
	int t;
	float b;
	cin>>t;
	cin>>b;
	if((t+0.5)<=b && t%5==0){
		cout<<fixed<<setprecision(2)<<(float)(b-t-0.50);
	} else {
		cout<<fixed<<setprecision(2)<<b;
	}
	return 0;
}
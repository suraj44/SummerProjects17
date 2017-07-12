#include <iostream>
#include <algorithm>
using namespace std;
int main() {
	int n,i=-1;
	int a[1000001];
	cin >> n;
	while(i++<n)
	    cin >> a[i];
	    sort(a,a+n);
	    for(i=0;i<n;i++)
	        cout << a[i] <<endl;
	return 0;
} 

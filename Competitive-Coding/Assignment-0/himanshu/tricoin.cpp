#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
 
int main() {
	long long int t,x,i;
	vector<int> v(44800); 
	v[1]=1;
	for(i=2;i<44800;i++)
	    v[i]=v[i-1]+i;
	cin >> t ;
	while(t--)
	{
	    cin >> x;
	    cout << upper_bound (v.begin(), v.end(), x) - v.begin() - 1 << endl;
	}
	return 0;
} 

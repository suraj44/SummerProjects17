#include <iostream>
#include<algorithm>
using namespace std;
 
int main() {
	int t,n,i,a[100001];
	cin >> t;
	while(t--)
	{
	    cin >> n;
	    i=0;
	    while(i<n)
	    {
	        cin >> a[i];
	        i++;
	    }
	    sort(a,a+n);
	    cout << a[0] + a[1] << endl;
	}
	return 0;
} 

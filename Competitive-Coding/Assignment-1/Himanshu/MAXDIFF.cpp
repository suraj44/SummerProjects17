#include <iostream>
#include<algorithm>
using namespace std;
 
int main() {
    
	int t,n,i,k,sum,sum1;
	long int a[101];
	cin >> t;
	while(t--)
	{
	    cin >> n;
	    cin >> k;
	    i=0;
	    while(i<n)
	    {
	        cin >> a[i];
	        i++;
	    }
	    sort(a,a+n);
	    i=0;
	    sum=0;sum1=0;
	    if(k>n/2)
	        k=n-k;
	    while(i<k)
	    {
	        sum+=a[i];
	        i++;
	    }while(i<n)
	    {
	        sum1+=a[i];
	        i++;
	    }
	    
	    
	    
	    if(sum1-sum <0)
	    swap(sum1,sum);
	    cout << sum1-sum << endl;
	}
	return 0;
} 

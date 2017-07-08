#include <bits/stdc++.h>
using namespace std;
int main()
{
	int n,t,count=0,five,temp;
	cin >> t;
	while(t--)
	{
	    cin >> n;
	    count=0;
	    temp=1;
	    five=5;
	    while(temp)
	    {
	        temp=n/five;
	        five*=5;
	        count+=temp;
	    }
	cout << count << endl;
	}
	return 0;
}

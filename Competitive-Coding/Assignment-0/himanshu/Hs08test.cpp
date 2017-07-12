#include <bits/stdc++.h>
using namespace std;
int main()
{
	int x;
	float y;
	cin >> x;
	cin >> y;
	if(x%5==0&&(x+0.5)<y)
	    {
	    cout  << (float) y-x-0.5;
	    }
	else 
	    cout  << (float) y ;
	return 0;
}  

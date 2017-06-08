#include <bits/stdc++.h>
#define f(i, num) for(int i=0; i<num; i++)
#define M 1000000007

using namespace std;

int a[2][2], b[2][2];

void copy(int x[2][2], int y[2][2])
{
	f(i, 2)
		f(j, 2)
			x[i][j]=y[i][j];
}

void multiply(int x[2][2], int y[2][2])
{
	f(i, 2)
		f(j, 2)
			b[i][j]=(x[i][0]*1ll*y[0][j]+x[i][1]*1ll*y[1][j])%M;
}

void pow(int a[2][2], int n)
{
	int c[2][2];
	if(n==1)
		return;
	else if(n%2==0)
	{
		multiply(a, a);
		copy(a, b);
		pow(a, n/2);
	}
	else
	{
		copy(c, a);
		multiply(a, a);
		copy(a, b);
		pow(a, (n-1)/2);
		multiply(a, c);
		copy(a, b);
	}
}

int main()
{
	ios::sync_with_stdio(false);
	int t, n;
	cin>>t;

	f(i, t)
	{
		cin>>n;
		a[0][0]=0;
		a[0][1]=1;
		a[1][0]=2;
		a[1][1]=1;

		if(n==1)
		{
			cout<<1<<endl;
			continue;
		}
		if(n==2)
		{
			cout<<6<<endl;
			continue;
		}
		pow(a, n-2);
		cout<<(a[1][0]+6*1ll* a[1][1])%M<<endl;
	}
}

#include <bits/stdc++.h>
using namespace std;

int a[2][2], b[2][2];
void mul(int a1[2][2], int b1[2][2])
{
	for(int i=0;i<2;i++)
		for(int j=0;j<2;j++)
			b[i][j]=((a1[i][0]*1ll*b1[0][j]+a1[i][1]*1ll*b1[1][j]))%1000000007;
}
void pow(int a[2][2], int n)
{
	int c[2][2];
	if(n==1)
		return;
	else if(n%2==0)
	{
		mul(a,a);
		for(int i=0;i<2;i++)
		   for(int j=0;j<2;j++)
			   a[i][j]=b[i][j];
		pow(a,n/2);
	}
	else
	{
		for(int i=0;i<2;i++)
		  for(int j=0;j<2;j++)
		      	c[i][j]=a[i][j];
		mul(a,a);
		for(int i=0;i<2;i++)
		   for(int j=0;j<2;j++)
			   a[i][j]=b[i][j];
		pow(a,(n-1)/2);
		mul(a,c);
		for(int i=0;i<2;i++)
		   for(int j=0;j<2;j++)
			   a[i][j]=b[i][j];
	}
}
int main()
{
	int t, n;
	cin>>t;
	for(int i=0;i<t;i++)
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
		pow(a,n-2);
		cout<<(a[1][0]+6*1ll*a[1][1])%1000000007<<endl;
	}
}
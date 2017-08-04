#include <stdio.h>
#define M 1000000007

long long int modulo(int a,int b,int n)
{
    long long x=1,y=a;
    
    while(b > 0)
    {
        if(b%2 == 1)
        {
            x=(x*y)%n;
        }
        y = (y*y)%n;
        
        b /= 2;
    }
    return x%n;
}
int main()
{	
	long t;int i;
	scanf("%ld",&t);
	for(i=1;i<=t;i++)
	{
		long int n;
		long long int ans;

		scanf("%ld",&n);
        
        long long int inv=modulo(6,M-2,M);

		if(n%2)
			ans=(7*modulo(2,n,M)-8)*inv;

		else
			ans=(7*modulo(2,n,M)+8)*inv;

		printf("%lld\n",ans%M);
	}
	return 0;
}

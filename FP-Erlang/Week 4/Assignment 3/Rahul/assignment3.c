#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

long long int fun(long long int);
long long int power(long long int,long long int,long long int);

int main() {

    long long int T, N, temp=0, ans;
    scanf("%lld", &T);
    while(temp<T)
        {
<<<<<<< HEAD
         scanf("%lld", &N);
=======
         scanf("%lld", &N); 
>>>>>>> 486be481020280c1a3e2d5897d3e6d988fe9b918
         printf("%lld\n", fun(N));
         temp++;
        }
    return 0;
}

long long int fun (long long int N)
<<<<<<< HEAD
    {
=======
    { 
>>>>>>> 486be481020280c1a3e2d5897d3e6d988fe9b918
     long long int ans;
     ans = (-4*power(-1,N-1,1000000007)+7*power(2,N-1,1000000007))*power(3,1000000007-2,1000000007);
     return ans%1000000007;
}

<<<<<<< HEAD
long long int power (long long int a, long long int N, long long int p)
    {
    long long int result = 1;
    while (N > 0)
    {
        if (N % 2 == 1)
            result = (result * a) % p;
        N = N>>1;
        a = (a * a) % p;
    }
    return result;
}
=======
long long int power (long long int base, long long int expo, long long int modulo)
    {
    long long int ans = 1;
    while (expo > 0)
    {
        if (expo % 2 == 1)
            ans = (ans * base) % modulo;
        expo = expo>>1;
        base = (base * base) % modulo;
    }
    return ans;
}

>>>>>>> 486be481020280c1a3e2d5897d3e6d988fe9b918

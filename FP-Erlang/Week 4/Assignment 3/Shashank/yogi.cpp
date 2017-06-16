#include<bits/stdc++.h>
using namespace std;

typedef long long int ll;
typedef vector< vector<ll> > matrix;
#define MOD 1000000007;

matrix T(2, vector<ll>(2));
ll fun(int n);
matrix power(int n);
matrix mul(matrix A, matrix B);

int main()
{
  int t;
  scanf("%d", &t);
  T[0][0] = 1;
  T[0][1] = 1;
  T[1][0] = 2;
  T[1][1] = 0;
  while(t--)
  {
    ll n;
    scanf("%lld", &n);
    printf("%lld\n", fun(n));
  }
  return 0;
}

ll fun(int n)
{
  if(n == 1)
    return 1;
  if(n == 2)
    return 6;
  matrix U(2, vector<ll>(2));
  U = power(n - 2);
  ll ans;
  ans = (6 * U[0][0] + 1 * U[1][0]) % MOD;
  return ans;
}

matrix power(int n)
{
  if(n == 1)
    return T;
  matrix S(2, vector<ll>(2));
  S = power(n / 2);
  if(n % 2 == 0)
    return mul(S, S);
  else
    return mul(T, mul(S, S));
}

matrix mul(matrix A, matrix B)
{
  matrix C(2, vector<ll>(2));
  C[0][0] = (A[0][0] * B[0][0] + A[0][1] * B[1][0]) % MOD;
  C[0][1] = (A[0][0] * B[0][1] + A[0][1] * B[1][1]) % MOD;
  C[1][0] = (A[1][0] * B[0][0] + A[1][1] * B[1][0]) % MOD;
  C[1][1] = (A[1][0] * B[0][1] + A[1][1] * B[1][1]) % MOD;
  return C;
}


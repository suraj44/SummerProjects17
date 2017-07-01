#include<iostream.h>
void main()
{ int t;
long long int n,x,y,z,mmiofsix=166666668;
cin>>t;
for(int i=0;i<t;i++)
{ cin>>n;
  x=n;
  y=7;
  z=2;
 //Modular Exponentiation Code (O(logN))from GFG
 while(x>0)
{ 
  if(x & 1)
  { y=(z*y)%1000000007;}
  x=x>>1;
  z=(z*z)%1000000007;
  }
 //Adding the second part
 if(n%2==0)
  y=(y+8)%1000000007;
  else 
  y=(y-8)%1000000007;

cout<<(mmiofsix*y)%1000000007;
}
}
  
  
  
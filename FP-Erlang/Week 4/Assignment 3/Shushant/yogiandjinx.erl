-module(yogiandjinx).
-export([power/3,yogi/1,oddeven/1]).
 
yogi(N)->
 (166666668*((power(2,N,7)) +oddeven(N))rem 1000000007) rem 1000000007.

#To calculate 2^n modulo 1000000007
power(_,0,C)->C;
power(A,B,C) when (B band 1)==1 -> power((A*A)rem 1000000007, B bsr 1,(C*A) rem 1000000007);
power(A,B,C)->power((A*A) rem 1000000007, B bsr 1,C).

#to check wether N is odd or even
oddeven(N)->
if (N rem 2)==0->
   X=8;
true-> X=-8
 end,
X. 




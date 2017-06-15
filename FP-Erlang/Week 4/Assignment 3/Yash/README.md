******************************ASSIGNMENT 3 ERLANG*****************************

Question:
---------

Yogi is preparing for ACM-ICPC 2016. Each day he is learning a new topic. Today he has decided to learn recursion. After getting familiar with the basics he decided to solve some problems. He is enjoying as recursion seems very easy to him until he gets this problem. Given the following pseudo code and N, you need to tell the output modulo 1000000007.

fun(N) 
    ans = 0

    if (N == 1)
        return 1

    for i in [1,N]
        if (i == 1 or i == N)
            ans = ans + 3
        else
            ans = ans + fun(i - 1) + fun(N - i)

    return ans

After trying a lot and getting frustrated, he goes to Jinx and shows him the question. Jinx is very experienced with recursion and he would solve it in minutes. Can you solve it faster than Jinx?

Solution:
--------

The given problem can be simplified to a recursive relation given by:

f(N)= f(N-1) + 2*f(N-2)

Now this relation can be simplified to get:

f(N)= A*((X1)^N) + B*((X2)^N)
where X1 and X2 are roots of the equation (X^2)-X-2 = 0,
hence X1 = 2 and X2= -1.

f(1) = 1 and f(2) = 6 are the base cases using which A and B are found to be
7/6 and 4/3 respectively.

Therefore f(N) = (7/6)*(2^N) + (4/3)*((-1)^N) which is written as:

f(N) = [(7*(2^N)+8)/6] mod (10^9 + 7) when N is even and,
f(N) = [(7*(2^N)-8)/6] mod (10^9 + 7) when N is odd.

Now Pow = (2^N) mod (10^9 + 7) is found using modular exponentiation for larger N upto 10^9 with a time complexity O(logN).

The modular inverse of 6 with respect to 10^9+7 is found by Fermats little theorem as:
inv(6) = 6^(10^9 + 7 - 2) mod (10^9 + 7) which is again calculated by modular exponentiation.

So f(N) = (Pow + 8) * inv(6) when N is even,
		  (Pow - 8) * inv(6) when N is odd.

Timing the code:
---------------

The timer function times the code to run upto 60s or N = 2^50 whichever may come first.
The results obtained for some powers of 2 are:

17592186044416 elements took 0.0 seconds!
35184372088832 elements took 0.0 seconds!
70368744177664 elements took 0.0 seconds!
140737488355328 elements took 0.0 seconds!
281474976710656 elements took 0.0 seconds!
562949953421312 elements took 0.0 seconds!
2^50 reached!! Limit Exceeded!!

Modular exponentiation algorithm:
--------------------------------

To calculate a^b mod m,

ans=1

while b>0:
	
	if b%2:
		ans*=a
	a*=a
	a%=m
	ans%=m
	b=b/2

ans gives us the final result.
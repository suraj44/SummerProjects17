################################################################# QUESTION

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



################################################################# CONSTRAINTS

1<=T<=10^4	(Number of test cases)
1<=N<=10^9	(Given Number)



################################################################# SOLUTION

The recursive relation given for fun(N) reduces to - 
fun(N) = fun(N-1) + 2*fun(N-2).
The base cases being - fun(1)=1, fun(2)=6.

This can be solved using matrix exponentiation, where
|0 1| |fun(1)|  =  |fun(2)|
|2 1| |fun(2)|     |fun(3)|

Let A=|0 1|, B = |fun(1)|
      |2 1|      |fun(2)|

Then,
A^N * |fun(1)| = |fun(N+1)|
      |fun(2)|   |fun(N+2)|

Hence the anser for fun(N) would be the second element of matrix(A^(N-2) * B) where N>2.
A^N can be calculated in logN time.
Therefore the total time complexity would be O(TlogN)
which would run under the given constraints of T, N, and time limit.


################################################################# Erlang Assignment 3

The erlang code in assgn3.erl measures the time taken to compute fun(N) in the above logic for very large values of N:

tim(A) - Takes a paramater 'A' and calculates the time taken to compute the answer for N=2^A.
		Displayes the time taken and the answer.

pow(A, N) - Calculates the value of A^N in logN time.

mul(A, B) - Multiplies the 2 (2x2) matrices, and returns the new matrix(1D List).

power(A, N) - Raises the matrix A to the power N in logN time.

prn(N) - Returns the answer corresponding to the value of fun(N)%1000000007 (10^9+7).


################################################################# Results

N 			Time(in seconds)
2^50 		0.0
2^2000 		0.016
2^5000 		0.062
2^10000 	0.25
2^20000 	0.75
2^50000 	5.781
2^100000 	21.5
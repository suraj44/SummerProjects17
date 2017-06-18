-module(assgn3).
-export([power/2, mul/2, prn/1, tim/1, pow/2]).

tim(A)-> {B, C}=timer:tc(assgn3,prn,[pow(2, A)]), {B/1000000, C}.

pow(A, 1)->A;
pow(A, N)->	if N rem 2 =:= 0 -> pow(A*A, N div 2);
			true -> A*pow(A*A, (N-1) div 2)
			end.

mul(A, B)-> [(lists:nth(1, A)*lists:nth(1, B)+lists:nth(2, A)*lists:nth(3, B)) rem 1000000007,
			(lists:nth(1, A)*lists:nth(2, B)+lists:nth(2, A)*lists:nth(4, B)) rem 1000000007,
			(lists:nth(3, A)*lists:nth(1, B)+lists:nth(4, A)*lists:nth(3, B)) rem 1000000007,
			(lists:nth(3, A)*lists:nth(2, B)+lists:nth(4, A)*lists:nth(4, B)) rem 1000000007].

power(A, 1)->A;
power(A, N)-> if N rem 2 == 0 -> power(mul(A, A), N div 2);
			true -> mul(A, power(mul(A, A), (N-1) div 2))
			end.

prn(1)->1;
prn(2)->6;
prn(N)->A=[0, 1, 2, 1],
		B=power(A, N-2),
		(lists:nth(3, B) + 6*lists:nth(4, B)) rem 1000000007.
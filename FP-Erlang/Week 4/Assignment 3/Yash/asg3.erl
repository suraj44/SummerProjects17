-module(asg3).
-export([pow/3,pow/2,f/1,timer/1,power/3]).

% Function for finding 2^50(only used in timer function)
power(A,1,Ans)->Ans*A;

power(A,B,Ans)->power(A,B-1,Ans*A).

% Function to apply modular exponentiation to find a^b mod m
pow(A,B)->pow(A,B,1).

pow(A,B,Ans) when B=<0->Ans rem 1000000007;

pow(A,B,Ans) when B>0->
				if (B rem 2)==1->
					pow((A*A) rem 1000000007,B div 2,(Ans*A) rem 1000000007);
				
				true->pow((A*A) rem 1000000007,B div 2, Ans rem 1000000007)
			
			end.

% Function to implement given problem and find f(N)
f(N)->
	
	Pow=7*(pow(2,N,1)),
	Inv=pow(6,1000000005,1),
	
	if N rem 2==1->
		Ans=(Pow-8)*Inv;
	
	true->
		Ans=(Pow+8)*Inv
	end,
	
	Ans rem 1000000007.

% Function to time the code upto 60s or N=2^50 whichever comes first
timer(N)->
	X=power(2,50,1),
	if N>=X->
		io:format("2^50 reached!! Limit Exceeded!!~n");

	true->
		{Time,_}=timer:tc(asg3,f,[N]),
		
		case Time>60000000 of
			true->io:format("Time Limit of 60s exceeded!!~n");
			false->
			io:format("~w elements took ~w seconds!~n",[N,Time/1000000]),
			timer(2*N)
		end
	end.
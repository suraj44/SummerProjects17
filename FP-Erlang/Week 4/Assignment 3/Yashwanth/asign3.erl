-module(asign3).
-export([pow/2, multiply/2, funn/1,tim/1]).

pow(X,1)->X;
pow(X,N)-> if N rem 2 == 0->pow(multiply(X,X),N div 2);
			true->multiply(X,pow(multiply(X,X),(N-1) div 2))
			end.

multiply(A,B)->[(lists:nth(1,A)*lists:nth(1,B)+lists:nth(2,A)*lists:nth(3,B))rem 1000000007,(lists:nth(1,A)*lists:nth(2,B)+lists:nth(2,A)*lists:nth(4,B))rem 1000000007,(lists:nth(3,A)*lists:nth(1,B)+lists:nth(4,A)*lists:nth(3,B))rem 1000000007,(lists:nth(3,A)*lists:nth(2,B)+lists:nth(4,A)*lists:nth(4,B))rem 1000000007].

funn(1)->1;
funn(2)->6;
funn(N)->A=[0,1,2,1],B=pow(A,N-2),(lists:nth(3,B)+6*lists:nth(4,B))rem 1000000007. 
-module(asg4).
-export([for/4,index_in_list_by_predicate/3,index_in_list_by_predicate/4,for_all/2,there_exists/2,there_exists_2/2,there_exists_2/3,foldl/3,foldr/3,filterl/2,filterl/3,filterr/2,filterr/3,
scanl/3,scanl/4,scanr/3,scanr/4,qsort/1,takewhile/2,takewhile/3,elements/0,min_subset/2,min_subset/5,rem_dumps/1,rem_dumps2/1,sum_of_squares/1,timer/2,random/1,random/2]).

% Implementation of for looping construct
for(I,Pred,Update,Body) ->
	case Pred(I) of
	true ->
		Body(I),
		for(Update(I),Pred,Update,Body);
	false ->
		ok
	end.

% Function to return zero based index of the first element satisfying the predicate
index_in_list_by_predicate(L,E,F) ->
	index_in_list_by_predicate(L,E,F,0).

index_in_list_by_predicate([],E,F,P) -> not_found;
index_in_list_by_predicate([H|T],E,F,P) ->
	case F(E,H) of
		true ->	P;
		false -> index_in_list_by_predicate(T,E,F,P+1)
	end.

% Function to check if all elements of the list satisfy the predicate or not
for_all([],Pred) -> true;
for_all([H|T],Pred) ->
	case Pred(H) of
		true -> for_all(T,Pred);
		false -> false
	end.

% Function to check if atleast 1 element of the list satisfies the predicate
there_exists([],Pred) -> false;
there_exists([H|T],Pred) ->
	case Pred(H) of
		true -> true;
		false -> there_exists(T,Pred)
	end.

% Function to check if exactly 2 elements of the list satisfy the predicate
there_exists_2(List,Pred) ->
	there_exists_2(List,Pred,0).

there_exists_2([],_,2) -> true;
there_exists_2([],_,Num) when Num/=2 -> false;
there_exists_2([H|T],Pred,Num) ->
	case Pred(H) of
		true -> there_exists_2(T,Pred,Num+1);
		false -> there_exists_2(T,Pred,Num)
	end.

% Function to implement foldl that traverses the list from left to right and applies a function to the element
foldl(_,X,[]) -> X;
foldl(F,X,[H|T]) -> % io:format("~w~n",[H]),
					foldl(F,F(H,X),T).

% Function to implement foldr that traverses the list from right to left and applies a function to the element
foldr(_,X,[]) -> X;
foldr(F,X,List) -> Last=lists:last(List),
					 % io:format("~w~n",[List]),
					foldr(F,F(Last,X),lists:droplast(List)).

% Function to return a list of all elements satisfying a condition traversing from left to right
filterl(F,List) -> filterl(F,List,[]).

filterl(F,List,X) -> foldl(fun(A,B)-> case F(A) of true -> B++[A]; false -> B end end,X,List).

%Function to return a list of all elements satisfying a condition traversing from right to left
filterr(F,List) -> filterr(F,List,[]).

filterr(F,List,X) -> foldr(fun(A,B)-> case F(A) of true -> B++[A]; false -> B end end,X,List).

% Function to return a list containing all intermediate states of foldl
scanl(F,X,List) -> scanl(F,X,List,[]).

scanl(_,X,[],New) -> New;
scanl(F,X,[H|T],New) -> scanl(F,F(H,X),T,New++[F(H,X)]).

% Function to return list containing all intermediate states of foldr
scanr(F,X,List) -> scanr(F,X,List,[]).

scanr(_,X,[],New) -> New;
scanr(F,X,List,New) -> Last=lists:last(List),
						scanr(F,F(Last,X),List--[Last],New++[F(Last,X)]).

% Function to implement quick sort by using filterl
qsort([])->[];
qsort([H|T]) -> qsort(filterl(fun(X)->X<H end,T))++[H]++qsort(filterl(fun(X)->X>=H end,T)).

% Function to return the longest prefix of a list satisfying a condition
takewhile(Pred,List) -> takewhile(Pred,List,[]).

takewhile(_,[],X) -> X;
takewhile(Pred,[H|T],X) ->
	case Pred(H) of
		true -> takewhile(Pred,T,X++[H]);
		false -> X
	end.

% Function to check n where sigma(k^0.5) for k from 1 to n is less than 1000 
elements() -> length(takewhile(fun(X)->X=<1000 end, scanl(fun(E,X)->X+math:sqrt(E) end,0,lists:seq(1,1000)))).

% Function to return length of smallest sublist whose sum is greater than a given value
min_subset(L,X) -> min_subset(L,X,[],length(L)+1,length(L)).

min_subset([],_,_,X,N) when X<N -> X;
min_subset([],_,_,X,N) when X>N -> not_found;
min_subset(L,X,Ans_list,Ans,N) -> S=foldl(fun(H,Sub)->case lists:sum(Sub)<X of true->Sub++[H];false->Sub end end,[],L),
								  % io:format("~w ~w~n",[S,Ans]),
							% I have included the case for list of negative integers too here
							case (lists:sum(S)=<0) and (X>0) of
								true -> min_subset(tl(L),X,[],Ans,N);
								false ->
					     			case (length(S)<Ans) and (lists:sum(S)>X) of
					     			true ->
					     				min_subset(tl(L),X,S--[hd(S)],length(S),N);
					     			false ->
					     				min_subset(tl(L),X,S--[hd(S)],Ans,N) 
					     			end
					     	end.

% Function to remove adjacent duplicates from a list using foldr
rem_dumps([]) -> [];
rem_dumps(List) -> foldr(fun(E,In) -> % io:format("~w~w~n",[hd(In),E]),
							case E=:=hd(In) of true -> In; false -> [E]++In end end,[lists:last(List)],lists:droplast(List)).

% Function to remove adjacent duplicates from a list using foldl
rem_dumps2([]) -> [];
rem_dumps2(List) -> foldl(fun(E,In) -> case E=:=lists:last(In) of true -> In; false -> In++[E] end end,[hd(List)],List--[hd(List)]).

% Function to return the sum of squares of all even numbers that can be expressed as sum of 2 primes
sum_of_squares(List) -> foldl(fun(H,In)->case H>2 of true -> In+math:pow(H,2); false -> In end end,0,List).

% Function to generate random list having N elements
random(N) -> random(N,[]).
random(0,X) -> X;
random(N,X) -> random(N-1,X++[rand:uniform(100000)]).

% Timer function
timer(Function,N) -> 
	case Function of
		qsort -> {Time,_}=timer:tc(asg4,qsort,[random(N)]),
				 io:format("~w seconds!~n",[Time/1000000]);
		elements -> {Time,_}=timer:tc(asg4,elements,[]),
					io:format("~w seconds!~n",[Time/1000000]);
		for_all -> {Time,_}=timer:tc(asg4,for_all,[random(N),fun(X) -> X<100000 end]),
					io:format("~w seconds!~n",[Time/1000000]);
		min_subset -> {Time,_}=timer:tc(asg4,min_subset,[random(N),N]),
					io:format("~w seconds!~n",[Time/1000000]);
		true -> io:format("Invalid Argument!")
	end.

%########################################### ASSIGNMENT 4 ###########################################
%########################################### Ashwin Joisa ###########################################
-module(assgn4).

% ############################################################################# Question 1
-export([for/4]).
% ############################################################################# Question 2
-export([index_in_list_by_predicate/3, index_in_list_by_predicate/4]).
% ############################################################################# Question 3
-export([for_all/2, there_exists/2, there_exists_2/2, there_exists_2/3]).
% ############################################################################# Question 4
-export([foldl/3, foldr/3, filterl/2, filterr/2]).
% ############################################################################# Question 5
-export([scanl/3, scanl/4, scanr/3]).
% ############################################################################# Question 6
-export([remdups/1]).
% ############################################################################# Question 7
-export([qsort/1]).
% ############################################################################# Question 8
-export([ans/1]).
% ############################################################################# Question 9
-export([takewhile/2, num/0]).
% ############################################################################# Question 10
-export([minimal_subset/2, desc_sort/1]).



% ########################################################################################## Question 1

for(I, Pred, Update, Body)-> 
	case Pred(I) of
		true ->	Body(I), 
				for(Update(I), Pred, Update, Body);
		false -> io:fwrite("~n### End of for loop ###~n")
	end. 


% ########################################################################################## Question 2

index_in_list_by_predicate(List, Elem, Pred) -> index_in_list_by_predicate(List, Elem, Pred, 0).

index_in_list_by_predicate([], _, _, _) -> 'not_found';
index_in_list_by_predicate([H|T], Elem, Pred, Pos) ->
	case Pred(Elem, H) of
		true ->	Pos;
		false->	index_in_list_by_predicate(T, Elem, Pred, Pos+1)
	end.	

% ########################################################################################## Question 3

for_all([], _) -> 'true';
for_all([H|T], Pred) ->
	case Pred(H) of
		true -> for_all(T, Pred);
		false-> 'false'
	end. 


there_exists([], _) -> 'false';
there_exists([H|T], Pred) ->
	case Pred(H) of
		true -> 'true';
		false-> there_exists(T, Pred)
	end. 


there_exists_2(List, Pred) -> there_exists_2(List, Pred, 0).

there_exists_2([], _, 2) -> 'true';
there_exists_2([], _, _) -> 'false';
there_exists_2([H|T], Pred, Count) -> % This Function could be made more efficient to break out if Count>2 :D
	case Pred(H) of
		true -> there_exists_2(T, Pred, Count+1);
		false-> there_exists_2(T, Pred, Count)
	end. 

% ########################################################################################## Question 4

foldl(_, Start, []) -> Start;
foldl(F, Start, [H|T]) -> foldl(F, F(H, Start), T).

foldr(_, Start, []) -> Start;
foldr(F, Start, List) ->
	foldr(F, F(lists:last(List), Start), lists:droplast(List)).


filterl(Pred, L) ->
	F = fun(X,Acc) ->
		case Pred(X) of
			true  -> [X|Acc];
			false -> Acc
		end
	end,
	lists:reverse(foldl(F, [], L)).

filterr(Pred, L) ->
	F = fun(X,Acc) ->
		case Pred(X) of
			true  -> [X|Acc];
			false -> Acc
		end
	end,
	lists:reverse(foldr(F, [], L)).

% ########################################################################################## Question 5

scanl(F, X ,L) -> scanl(F, X, L, []).

scanl(_, _, [], L) -> L;
scanl(F, X, [H|T], L) -> scanl(F, F(H, X), T, L++[F(H, X)]).


scanr(F, X, L) ->
	Acc = scanl(F, X, L, []),
	[lists:last(Acc)] ++ lists:droplast(Acc).


% ########################################################################################## Question 6

remdups([]) -> [];
remdups(List)-> foldr(fun(X, L) ->case X=:=hd(L) of true -> L; false -> [X]++L end end,
				[lists:last(List)],lists:droplast(List)).


% ########################################################################################## Question 7

qsort([])->[];
qsort([H|T]) -> qsort(filterl(fun(X) -> X<H end, T)) ++ [H] ++ qsort(filterl(fun(X)-> X>=H end, T)).



% ########################################################################################## Question 8

% Every even number greater then 2 can be expressed as the sum of 2 primes!! :) 
ans(List) -> foldl(fun(X, Ans) -> case X>2 of true -> Ans+X*X; false -> Ans end end, 0, List).



% ########################################################################################## Question 9

takewhile(Pred,List) -> takewhile(Pred,List,[]).

takewhile(_, [], L) -> L;
takewhile(Pred, [H|T], L) ->
	case Pred(H) of
		true -> takewhile(Pred, T, L++[H]);
		false -> L
	end.

num() -> length(takewhile(fun(X) -> X=<1000 end, scanl(fun(N, Sum)-> Sum+math:sqrt(N) end, 0, lists:seq(1,200)))).
% Answer is less than 200, since sum of sqrt(i) 100<=i<=200 is greater than sum of 100 * sqrt(100)  which is 1000.



% ########################################################################################## Question 10

% We sort in descending order and pick minimum number of elements to get sum K.
desc_sort([])->[];
desc_sort([H|T]) -> desc_sort(filterl(fun(X) -> X>=H end, T)) ++ [H] ++ desc_sort(filterl(fun(X)-> X<H end, T)).

minimal_subset(L, K) ->
	List = desc_sort(L),
	{Sum, Count} = foldl(fun(X, {S, C}) -> case S>=K of true -> {S, C}; false -> {S+X, C+1} end end, {0, 0}, List),
	case Sum>=K of 
		true -> Count;
		false-> 'not_found'
	end.
%########################################### ASSIGNMENT 2 ###########################################
%########################################### Ashwin Joisa ###########################################

-module(ashwin).

% ******************************************************* Question 1
-export([qsort/1]).
-export([isort/1, insertion_sort/2, insert/2]).
-export([bsort/1, biggestToRightEnd/1]).
-export([ssort/1, selection_sort/2, max_elem/3]).
-export([msort/1, merge/2]).
-export([tim/2, randomList/1]).
% ******************************************************* Question 2
-export([unique/1]).
% ******************************************************* Question 3
-export([replicate/2]).
% ******************************************************* Question 4
-export([reverse/1]).
% ******************************************************* Question 5
-export([zip/2]).
% ******************************************************* Question 6
-export([fib/3, tim1/1, tim2/1, fibo/1, fibonacci/1]). 


% ############################################################################################# Question 1

% qsort() - Quick Sort

qsort([]) -> [];
qsort([Pivot|T]) -> qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).
					% Partitioning with pivot as first element.

% isort() - Insertion Sort

isort(List) -> insertion_sort(List, []).
%Inserting first element of given list, into a new sorted list recursively
insertion_sort([], List) -> List;
insertion_sort([H|T], List) -> insertion_sort(T, insert(H, List)).	
%Inserting element into the right place of the sorted list.
insert(X, []) -> [X];
insert(X, [H|T]) when X =< H -> [X | [H|T]];
insert(X, [H|T]) -> [H | insert(X, T)].

% bsort() - Bubble Sort

bsort(L) when length(L) =< 1 -> L;
bsort(L) -> List = biggestToRightEnd(L),
    		bsort(lists:sublist(List, 1, length(List)-1)) ++ [lists:last(List)].
%Pushes the largest element to the right extreme.
biggestToRightEnd([]) -> [];
biggestToRightEnd([A]) -> [A];
biggestToRightEnd([A, H|T]) when A > H ->[H|biggestToRightEnd([A|T])];
biggestToRightEnd([A, H|T]) -> [A|biggestToRightEnd([H|T])].

% ssort() - Selection Sort

ssort([]) -> [];
ssort(List) -> selection_sort(List, []).
%Recursively select the max element from List and push into SortedList.
selection_sort([], SortedList) -> SortedList;
selection_sort([H|T], SortedList)->	{Max, Remaining} = max_elem(T, H, []),
    								selection_sort(Remaining, [Max|SortedList]).
%Finding largest element in [H|T] (Remaining is already checked).
max_elem([], Max, Remaining) -> {Max, Remaining};
max_elem([H|T], Max, Remaining) when H < Max -> max_elem(T, Max, [H|Remaining]);
max_elem([H|T], Max, Remaining) -> max_elem(T, H, [Max|Remaining]).

% msort() - Merge sort

msort([]) -> [];
msort([A]) -> [A];
msort(L) -> {A, B} = lists:split(length(L) div 2, L),
			merge(msort(A), msort(B)).

merge(A, []) -> A;
merge([], B) -> B;
merge([H1|T1], [H2|T2]) -> 	if H1 < H2 -> [H1] ++ merge(T1, [H2|T2]);
    						true -> [H2] ++ merge([H1|T1], T2)
  							end.

% Timer

tim(Func, Size) -> {A, _}=timer:tc(ashwin, Func, [randomList(Size)]), A/1000000. %Converting to seconds.
randomList(Size) -> [rand:uniform(1000000001) || _ <- lists:seq(1, Size)].

% ############################################################################################# Question 2

unique([])->[];
unique([H|T])-> case lists:member(H, T) of
				true -> unique(T);
				false -> lists:append([unique(T), [H]])
				end.

% ############################################################################################# Question 3

replicate(0, _)-> [];
replicate(N, Elem)-> [Elem|replicate(N-1, Elem)].

% ############################################################################################# Question 4

reverse([])-> [];
reverse([H|T])-> lists:append([reverse(T), [H]]).

% ############################################################################################# Question 5

zip(_, [])-> [];
zip([], _)-> [];
zip([A|B], [C|D])-> lists:append([[{A, C}], zip(B, D)]).

% ############################################################################################# Question 6

% Recursive - fibonacci

fibonacci(1)-> 1;
fibonacci(2)-> 1;
fibonacci(N)-> fibonacci(N-1)+fibonacci(N-2).

% Tail Recursive - fibo (which calls fib()).
fibo(N)->fib(N, 1, 1).

fib(1, A, _)-> A;
fib(2, _, B)-> B;
fib(N, A, B)-> fib(N-1, B, A+B).

% Timers - displays only time. To see answer, use above functions(fibonacci, fibo)!! :)

tim1(A)-> {B, _}=timer:tc(ashwin,fibonacci,[A]), B/1000000. %Converting to seconds.
tim2(A)-> {B, _}=timer:tc(ashwin,fibo,[A]), B/1000000. %Converting to seconds.
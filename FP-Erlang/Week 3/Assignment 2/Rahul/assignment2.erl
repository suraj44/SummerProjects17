-module(assignment2).
-export([qsort/1, insort/1, bubsort/1, selsort/1, mergesort/1, unique/1, replicate/2, reverse/1, zip/2, fibonacci_T/1, fibo_NT/1]).

qsort([]) -> [];
qsort([Pivot|T]) ->
qsort([X||X <- T, X<Pivot]) ++ [Pivot] ++ qsort([X||X <- T, X>=Pivot]).

insort([H|T]) -> insort([H],T).
insort(Sorted,[]) -> Sorted;
insort(Sorted,[H|T]) -> insort([X||X <- Sorted, X<H]++[H]++[X||X <- Sorted, X>=H],T).

bubsort(Unsorted) -> bubsort(Unsorted, [], []).
bubsort([H|[H1|T]], Passed, Sorted) when T==[], H<H1 -> bubsort(Passed++[H], [], [H1]++Sorted);
bubsort([H|[H1|T]], Passed, Sorted) when T==[], H>=H1 -> bubsort(Passed++[H1], [], [H]++Sorted);
bubsort([H|[]], [], Sorted) -> bubsort([], [], [H]++Sorted);
bubsort([H|[H1|T]], Passed, Sorted) when H<H1 -> bubsort([H1]++T, Passed++[H], Sorted);
bubsort([H|[H1|T]], Passed, Sorted) when H>=H1 -> bubsort([H]++T, Passed++[H1], Sorted);
bubsort([], [], Sorted) -> Sorted.

selsort(Unsorted) -> selsort(Unsorted,[],[]).
selsort([H|T],Passed, Sorted) -> selsort([X||X <- T , X<H],[H]++Passed++[X||X <- T , X>=H], Sorted);
selsort([],[H|T],Sorted) -> selsort(T,[],Sorted++[H]);
selsort([], [], Sorted) -> Sorted.


mergesort(Unsorted) -> mergesort(Unsorted,[]).
mergesort([],[H|[]]) -> H;
mergesort([],Sorted) -> mergesort(Sorted,[]);
mergesort([[H|T]|[]], Sorted) when T/=[] -> mergesort([],Sorted++[merge([H|T],[])]);
mergesort([[H|[]]|[]], Sorted) -> mergesort([],Sorted++[merge([H],[])]);
mergesort([H|[]], Sorted) -> mergesort([],Sorted++[merge([H],[])]);
mergesort([[H|T]|[[H1|T1]|T2]], Sorted) when T/=[],T1/=[] -> mergesort(T2,Sorted++[merge([H|T],[H1|T1])]);
mergesort([[H|T]|[H1|T2]], Sorted) when T/=[] -> mergesort(T2,Sorted++[merge([H|T],H1)]);
mergesort([H|[H1|T]], Sorted) -> mergesort(T,Sorted++[merge([H],[H1])]).

merge(L1,L2) -> merge(L1,L2,[]).
merge([],[],Sorted) -> Sorted;
merge([],L2,Sorted) -> merge([],[],Sorted++L2);
merge(L1,[],Sorted) -> merge([],[],Sorted++L1);
merge([H1|T1],[H2|T2],Sorted) when H1<H2-> merge(T1,[H2|T2],Sorted++[H1]);
merge([H1|T1],[H2|T2],Sorted) when H2=<H1-> merge([H1|T1],T2,Sorted++[H2]).


unique(List) -> unique(List,[]).
unique([H|T], NewList) -> unique([X||X <- T, X /= H],NewList++[H]);
unique([],NewList) -> NewList.

replicate(X,N) -> replicate([],X,N).
replicate(List,_,0) -> List;
replicate(List,X,N) -> replicate(List++[X],X,N-1).

reverse(List) -> reverse(List, []).
reverse([],NewList) -> NewList;
reverse([H|T], NewList) -> reverse(T,[H]++NewList).

zip(List1, List2) -> zip(List1, List2, []).
zip(T1,T2,NewList) when T1==[]; T2==[] -> NewList;
zip([H1|T1], [H2|T2], NewList) -> zip(T1,T2,NewList++[{H1,H2}]).

fibonacci_T(1) -> [0];
fibonacci_T(2) -> [0,1];
fibonacci_T(N) -> fibonacci_T(N-2,[0,1],[0,1]).
fibonacci_T(0,Series,_) -> Series;
fibonacci_T(N,Series,[H|[H1|_]]) -> fibonacci_T(N-1,Series++[H+H1],[H1,H+H1]).

fibonacci_NT(1) -> 0;
fibonacci_NT(2) -> 1;
fibonacci_NT(N) -> fibonacci_NT(N-1)+fibonacci_NT(N-2).

fibo_NT(1) -> [0];
fibo_NT(2) -> [0,1];
fibo_NT(N) -> fibo_NT(N-1)++[fibonacci_NT(N)].

-module(sorting).
-export([qsort/1,ins/1,insert/2,bubble/1,move/2,select/1,merge/1,max/3,rand/1]).

qsort([]) -> []; 
qsort([P|T]) -> qsort([X || X <- T, X =< P]) ++ [P] ++ qsort([X || X <- T, X >P]).


ins(L)  ->
    ins(L, []).

ins([], Sorted) -> Sorted;
ins([H | T], Sorted) ->
    ins(T, insert(H, Sorted)).

insert(X, []) -> [X];
insert(X, Sorted) when X =< hd(Sorted) -> [X | Sorted];
insert(X, [H | T]) -> [H | insert(X, T)].

select([]) -> [];
select(L) -> select(L, []).

select([], Sorted) -> Sorted;
select([H|T], Sorted) ->
    {Max, R} = max(T, H, []),
   select(R, [Max|Sorted]).

bubble([]) -> [];
bubble(L)  ->
    bubble(L, []).

bubble([X], Sorted) -> [X | Sorted];
bubble(List, Sorted) ->
    [Max | R] = move(List, []),
    bubble(R, [Max | Sorted]).

move([X], R) -> [X | R];
move([X, Y | T], R) ->
    if X > Y -> move([X | T], [Y | R]);
        true -> move([Y | T], [X | R])
    end.    
merge(L) when length(L) =< 1 -> L;
merge(L) ->
    {Lt, Rt} = lists:split(length(L) div 2, L),
    lists:merge(merge(Lt), merge(Rt)).



max([], Max, Rest) -> {Max, Rest};
max([H|T], Max, Rest) when H < Max ->
    max(T, Max, [H|Rest]);
max([H|T], Max, Rest) ->
   max(T, H, [Max|Rest]).

rand(N) -> rand(N, [], 0).
rand(N, X, N) -> X;
rand(N, X, A) -> rand(N, X ++ [rand:uniform(100)], A + 1).
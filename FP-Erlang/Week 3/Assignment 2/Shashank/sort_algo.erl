%%%-------------------------------------------------------------------
%%% @author shashankp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end

%%%-------------------------------------------------------------------
-module(sort_algo).
-author("Shashank P").

%% API
-export([qsort/1, isort/1, bsort/1, ssort/1, msort/1, check_time_sort/1]).

% Quick sort
qsort([]) -> [];
qsort([H | T]) ->
  qsort([X || X <- T, X =< H]) ++ [H] ++ qsort([X || X <- T, X > H]).


% Insertion sort
isort(List) ->
  isort(List, []).

isort([], SortList) -> SortList;
isort([X | T], SortList) ->
  isort(T, insert(X, SortList)).

insert(X, [H | T]) when X > H ->
  [H | insert(X, T)];
insert(X, List) ->
  [X | List].


% Bubble sort
bsort(List) ->
  bsort(List, []).

bsort([], SortList) -> SortList;
bsort(List, SortList) ->
  [Min | NewList] = bubble(List, []),
  bsort(NewList, SortList ++ [Min]).

bubble([X], NewList) -> [X | NewList];
bubble([X | [Y | T]], NewList) when X < Y ->
  bubble([X | T], [Y | NewList]);
bubble([X | [Y | T]], NewList) ->
  bubble([Y | T], [X | NewList]).


% Selection sort
ssort(List) ->
  ssort(List, []).

ssort([], SortList) -> SortList;
ssort([H | T], SortList) ->
  [Min | NewList] = select(T, H, []),
  ssort(NewList, SortList ++ [Min]).

select([], Min, NewList) -> [Min | NewList];
select([H | T], Min, NewList) when H < Min ->
  select(T, H, [Min | NewList]);
select([H | T], Min, NewList) ->
  select(T, Min, [H | NewList]).


% Merge sort
msort([]) -> [];
msort([X]) -> [X];
msort(List) ->
  Len = length(List),
  {NewList1, NewList2} = lists:split(Len div 2, List),
  merge(msort(NewList1), msort(NewList2)).

merge([], []) -> [];
merge([], L2) -> L2;
merge(L1, []) -> L1;
merge([H1 | T1], [H2 | T2]) when H1 < H2 ->
  [H1 | merge(T1, [H2 | T2])];
merge([H1 | T1], [H2 | T2]) ->
  [H2 | merge([H1 | T1], T2)].



% Timer function
check_time_sort(Function) ->
  check_time_sort(Function, 10).

check_time_sort(Function, Size) when Size < 10000000->
  List = [rand:uniform(1000000000) || _ <- lists:seq(1, Size)],
  {Time, _} = timer:tc(Function, [List]),
  if Time < 60000000 ->
    io:fwrite("Time when size of list is ~w : ~w~n", [Size, Time]),
    check_time_sort(Function, Size * 10);
    true ->
      io:fwrite("Time exceeds 60 seconds")
  end;
check_time_sort(_,_) ->
  io:fwrite("Size exceeds 10^7").

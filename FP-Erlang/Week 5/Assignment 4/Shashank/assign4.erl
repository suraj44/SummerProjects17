%%%-------------------------------------------------------------------
%%% @author shashankp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%%
%%%-------------------------------------------------------------------
-module(assign4).
-author("shashankp").

%% API
-export([for/4, index_in_list_by_predicate/3, quantifier/3, for_all/2, there_exists/2, there_exists_2/2, foldl/3, foldr/3, filterl/2, filterr/2, scanl/3, scanr/3, rem_dups/1, rem_dups_foldl/1, quick_sort/1, even_non_prime/1, takewhile/2, sum_sqroot/0, size_subset/2, time_fun_list/1]).

% Question 1
for(I, Pred, Update, Body) ->
  case Pred(I) of
    true -> Body(I),
      for(Update(I), Pred, Update, Body);
    false -> io:fwrite("")
  end.

% Question 2
index_in_list_by_predicate([], _, _) -> io:format("not_found", []);

index_in_list_by_predicate(L, A, Pred) ->
  index_in_list_by_predicate(0 ,L, A, Pred).

index_in_list_by_predicate(Pos ,[H|T], A, Pred) ->
  Found = Pred(A, H),
  if Found ->
  io:format("~w~n", [Pos]);
  true ->
    index_in_list_by_predicate(Pos + 1 ,T, A, Pred)
  end;

index_in_list_by_predicate(_, [], _, _) -> io:format("not_found", []).

% Question 3
quantifier(_, [], _) -> io:fwrite("");
quantifier(F, List, Pred) ->
  Len = length(List),
  quantifier(F, List, Pred, 0, Len).

quantifier(F, [H|T], Pred, Count, Len) ->
  Condition = Pred(H),
  if Condition ->
    quantifier(F, T, Pred, Count + 1, Len);
    true ->
      quantifier(F, T, Pred, Count, Len)
  end;
quantifier(F, [], _, Count, Len) ->
  F(Count, Len).

for_all(Count, Len) ->
  if Count =:= Len ->
    io:fwrite("true");
    true ->
      io:fwrite("false")
  end.

there_exists(Count, _) ->
  if Count >= 1 ->
    io:fwrite("true");
    true ->
      io:fwrite("false")
  end.

there_exists_2(Count, _) ->
  if Count =:= 2 ->
    io:fwrite("true");
    true ->
      io:fwrite("false")
  end.


% Question 4
foldl(_, Answer, []) -> Answer;
foldl(F, Answer, [H|T]) -> foldl(F, F(H, Answer), T).

foldr(_, Answer, []) -> Answer;
foldr(F, Answer, List) ->
  [H|T] = lists:reverse(List),
  foldr(F, F(H, Answer), lists:reverse(T)).

filterl(Pred, L) ->
  F = fun(X, Acc) ->
        case Pred(X) of
          true -> Acc ++ [X];
          false -> Acc
        end
      end,
  foldl(F, [], L).

filterr(Pred, L) ->
  F = fun(X, Acc) ->
        case Pred(X) of
          true -> [X|Acc];
          false -> Acc
        end
      end,
  foldr(F, [], L).

%Question 5
scanl(_, _, []) -> [];
scanl(F, Answer, List) -> scanl(F, Answer, List, []).
scanl(F, Answer, [H|T], Scans) ->
  Answer2 = F(H, Answer),
  Scans2 = Scans ++ [Answer2],
  scanl(F, Answer2, T, Scans2);
scanl(_, _, [], Scans) -> Scans.

scanr(_, _, []) -> [];
scanr(F, Answer, List) -> scanr(F, Answer, lists:reverse(List), []).
scanr(F, Answer, [H|T], Scans) ->
  Answer2 = F(H, Answer),
  Scans2 = [Answer2] ++ Scans,
  scanr(F, Answer2, T, Scans2);
scanr(_, _, [], Scans) -> Scans.

%Question 6
rem_dups([]) -> [];
rem_dups(List) ->
  F = fun(X, Acc) ->
        [First|_] = Acc,
        if X =:= First -> Acc;
          true -> [X|Acc]
        end
      end,
  [H|T] = lists:reverse(List),
  foldr(F, [H], lists:reverse(T)).

rem_dups_foldl([]) -> [];
rem_dups_foldl([H|T]) ->
  F = fun(X, Acc) ->
    Last = lists:last(Acc),
    if X =:= Last -> Acc;
      true -> Acc ++ [X]
    end
      end,
  foldl(F, [H], T).

%Question 7
quick_sort([]) -> [];
quick_sort([Pivot|T]) ->
  Lesser = filterr(fun(X) -> X < Pivot end, T),
  Greater = filterl(fun(X) -> X >= Pivot end, T),
  quick_sort(Lesser) ++ [Pivot] ++ quick_sort(Greater).

% Question 8
even_non_prime(List) ->
  F = fun(X, Sum) ->
        if ((X > 2) and (X rem 2 == 0)) ->
          X * X + Sum;
          true -> Sum
        end
      end,
  foldl(F, 0, List).

% Question 9
takewhile(Pred, List) ->
  takewhile(Pred, List, []).
takewhile(Pred, [Elem|T], Answer) ->
  Condition = Pred(Elem),
  if Condition ->
    Answer2 = Answer ++ [Elem],
    takewhile(Pred, T, Answer2);
    true -> Answer
  end;
takewhile(_, [], Answer) -> Answer.

sum_sqroot() ->
  Min_sum = 1000,
  List = lists:seq(1, 1000, 1),
  F = fun(X, Sum) ->
      Sum + math:sqrt(X)
      end,
  Scans = scanl(F, 0, List),
  Subset = takewhile(fun(X) -> X < Min_sum end, Scans),
  Count = length(Subset) + 1,
  io:format("Sum of square roots of first ~w natural numbers exceeds ~w", [Count, Min_sum]).

% Question 10
size_subset(List, S) ->
  Sorted_list = quick_sort(List),
  F = fun(X, {Sum, Count}) ->
        if (Sum >= S) or (X =< 0) ->
          {Sum, Count};
          true ->
            {Sum + X, Count + 1}
        end
      end,
  {Sum, Size}= foldr(F, {0,0}, Sorted_list),
  if Sum >= S ->
    io:format("Size of minimal subset is ~w", [Size]);
    true ->
      not_found
  end.



% To find the time of execution of a function that takes only a list as argument.
time_fun_list(Function) ->
  time_fun_list(Function, 100).
time_fun_list(Function, Size) when Size < 10000000->
   L = [rand:uniform(Size div 10) || _ <- lists:seq(1, Size)],
  {Time, _} = timer:tc(Function, [L]),
  if Time < 60000000 ->
    io:fwrite("Time when size of list is ~w : ~w~n", [Size, Time]),
    time_fun_list(Function, Size * 10);
    true ->
      io:fwrite("Time exceeds 60 seconds")
  end;
time_fun_list(_,_) ->
  io:fwrite("Size exceeds 10^7").
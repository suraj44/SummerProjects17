%%%-------------------------------------------------------------------
%%% @author shashankp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end

%%%-------------------------------------------------------------------
-module(higherorder).
-author("shashankp").

%% API
-export([add/1, subtract/1, multiply/1, divide/1, greaterThanX/1, lessThanX/1, fold/2, filter/1, map/1, all/1, takewhile/1, derive/2, integral/4, foldr/3, foldl/3]).

% Question 1

add(X) ->
  fun(Y) -> X + Y end.

subtract(X) ->
  fun(Y) -> X - Y end.

multiply(X) ->
  fun(Y) -> X * Y end.

divide(X) ->
  fun(Y) -> X / Y end.

greaterThanX(X) ->
  fun(Y) -> Y > X end.

lessThanX(X) ->
  fun(Y) -> Y < X end.

%%%%%%%%%%%%%%%%%%%%
% Examples with definition

fold(F, Answer) ->
  fun([H | T]) ->
    FoldF = fold(F, F(H, Answer)),
    FoldF(T);
  ([]) -> Answer end.


filter(Pred) -> filter(Pred, []).
filter(Pred, Answer) ->
  fun([H | T]) ->
    case Pred(H) of
      true  ->
        FilterT = filter(Pred, [H|Answer]),
        FilterT(T);
      false ->
        FilterF = filter(Pred, Answer),
        FilterF(T)
    end;
    ([]) -> lists:reverse(Answer) end.

map(F) ->
  fun([H|T]) ->
    MapF = map(F),
    [F(H)| MapF(T)];
    ([]) -> [] end.

% checks if all elements in list satisfy Pred. Returns true if Pred(Elem) returns true for all elements Elem in list, otherwise false
all(Pred) ->
  fun([H | T]) ->
    case Pred(H) of
      true ->
        AllPred = all(Pred),
        AllPred(T);
      false -> false
    end;
    ([]) -> true end.

% Takes elements Elem from list while Pred(Elem) returns true, that is, the function returns the longest prefix of the list for which all elements satisfy the predicate.
takewhile(Pred) -> takewhile(Pred, []).
takewhile(Pred, Answer) ->
  fun([H | T]) ->
    case Pred(H) of
      true  ->
        TakewhilePred = takewhile(Pred, [H|Answer]),
        TakewhilePred(T);
      false -> lists:reverse(Answer)
    end;
    ([]) -> lists:reverse(Answer) end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 2

derive(F, H) ->
  fun(X) -> (F(X + H) - F(X)) / H end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3

integral(A, B, N, F) ->
  H = (B - A) / N,
  H * func(F, A, 0, H, N) / 3.
func(F, A, K, H, N) when K =:= N ->
  F(A + K * H);
func(F, A, 0, H, N) ->
  F(A) + func(F, A, 1, H, N);
func(F, A, K, H, N) when (K rem 2 =:= 1) ->
  4 * F(A + K * H) + func(F, A, K + 1, H, N);
func(F, A, K, H, N) when (K rem 2 =:= 0) ->
  2 * F(A + K * H) + func(F, A, K + 1, H, N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 4

foldr(_, Answer, []) -> Answer;
foldr(F, Answer, List) ->
  [H|T] = lists:reverse(List),
  foldr(F, F(H, Answer), lists:reverse(T)).

foldl(_, Answer, []) -> Answer;
foldl(F, Answer, List) ->
  foldr(F, Answer, foldr(fun(X,Acc) -> Acc ++ [X] end, [], List)).

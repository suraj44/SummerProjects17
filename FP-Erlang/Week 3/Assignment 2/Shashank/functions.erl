%%%-------------------------------------------------------------------
%%% @author shashankp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end

%%%-------------------------------------------------------------------
-module(functions).
-author("Shashank P").

%% API
-export([unique/1, replicate/2, reverse/1, zip/2]).


unique(List) ->
  unique(List, []).

unique([], UniqueList)  -> UniqueList;
unique([X | T], UniqueList)  ->
  CheckMember = lists:member(X, UniqueList),
  if CheckMember =:= false ->
    unique(T, UniqueList ++ [X]);
    true ->
      unique(T, UniqueList)
  end.

replicate(0, _) -> [];
replicate(N, X) ->
  [X | replicate(N - 1, X)].


reverse([]) -> [];
reverse([H | T]) ->
  reverse(T) ++ [H].


zip([], _) -> [];
zip(_, []) -> [];
zip([H1 | T1], [H2 | T2]) ->
  [{H1, H2} | zip(T1, T2)].



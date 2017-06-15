%%%-------------------------------------------------------------------
%%% @author shashankp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end

%%%-------------------------------------------------------------------
-module(fibonacci).
-author("Shashank P").

%% API
-export([fibon/1, tail_fib/1, check_time_fibon/1, check_time_tfib/1]).

% Non-tail recursion
fibon(0) -> 0;
fibon(1) -> 1;
fibon(2) -> 1;
fibon(N) ->
  fibon(N - 1) + fibon(N - 2).


% Tail recursion
tail_fib(0) -> 0;
tail_fib(1) -> 1;
tail_fib(2) -> 1;
tail_fib(N) -> tail_fib(N - 2, 1, 1).

tail_fib(0, A, _) -> A;
tail_fib(N, A, B) -> tail_fib(N - 1, A + B, A).


% Timer function for non-tail recursion
check_time_fibon(Function) ->
  check_time_fibon(Function, 5).

check_time_fibon(Function, N)->
  {Time, _} = timer:tc(Function, [N]),
  if Time < 60000000 ->
    io:fwrite("Time when N is ~w : ~w~n", [N, Time]),
    check_time_fibon(Function, N + 5);
    true ->
      io:fwrite("Time exceeds 60 seconds")
  end.


%Timer function for tail recursion
check_time_tfib(Function) ->
  check_time_tfib(Function, 1).

check_time_tfib(Function, N)->
  {Time, _} = timer:tc(Function, [N]),
  if Time < 60000000 ->
    io:fwrite("Time when N is ~w : ~w~n", [N, Time]),
    check_time_tfib(Function, N * 10);
    true ->
      io:fwrite("Time exceeds 60 seconds")
  end.
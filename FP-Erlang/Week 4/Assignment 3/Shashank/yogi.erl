%%%-------------------------------------------------------------------
%%% @author shashankp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Jun 2017 8:16 PM
%%%-------------------------------------------------------------------
-module(yogi).
-author("shashankp").

%% API
-export([main/0, test/1, func/1, power/1, mul/2, check_time/1]).

main() ->
  {_, [T]} = io:fread("", "~d"),
  test(T).

test(T) when T > 0 ->
  {_, [N]} = io:fread("", "~d"),
  io:fwrite("~w~n", [func(N)]),
  test(T - 1);
test(_) ->  io:fwrite("").

func(N) when N =:= 1-> 1;
func(N) when N =:= 2 -> 6;
func(N) ->
  Mod = 1000000007,
  [[U1, _], [U2, _]] = power(N - 2),
  (6 * U1 + 1 * U2) rem Mod.

power(N) when N =:= 1 -> [[1, 1], [2, 0]];
power(N) ->
  A = [[1, 1], [2, 0]],
  S = power(N div 2),
  if (N rem 2) =:= 0 ->
    mul(S, S);
    true ->
      mul(A, mul(S, S))
  end.

mul(P, Q) ->
  Mod = 1000000007,
  [[P1, P2], [P3, P4]] = P,
  [[Q1, Q2], [Q3, Q4]] = Q,
  [[((P1*Q1+P2*Q3) rem Mod), ((P1*Q2+P2*Q4) rem Mod)], [((P3*Q1+P4*Q3) rem Mod), ((P3*Q2+P4*Q4) rem Mod)]].


check_time(Function) ->
  check_time(Function, 1, 0).

check_time(Function, N, I) when I < 50->
  {Time, _} = timer:tc(Function, [N]),
  if Time < 60000000 ->
    io:fwrite("Time when N is 2^~w : ~w~n", [I, Time]),
    check_time(Function, N * 2, I + 1);
    true ->
      io:fwrite("Time exceeds 60 seconds")
  end;
check_time(_,_,_) ->
  io:fwrite("N exceeds 2^49").


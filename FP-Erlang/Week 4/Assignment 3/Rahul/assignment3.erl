-module(assignment3).
-export([func/1, power/4]).

func([]) ->io:fwrite("");
func([H|T]) ->
io:fwrite("~w~n",[((-4*power(-1,H-1,1000000007,1)+7*power(2,H-1,1000000007,1))*power(3,(1000000007-2),1000000007,1)) rem 1000000007]),
func(T).

power(_, 0, _, Result) -> Result;
power(Base, Expo, Modulo, Result) when (Expo rem 2)==1 -> power(((Base*Base) rem Modulo), Expo div 2, Modulo, ((Result*Base) rem Modulo));
power(Base, Expo, Modulo, Result) -> power((Base*Base) rem Modulo, Expo div 2, Modulo, Result).

-module(unique).
-export([uniq/1]).

uniq([H|[]])->[H];
uniq([H|T])->
case 
   lists:member(H,T) of
     true->uniq(T);
   _->[H]++ uniq(T)
   end.

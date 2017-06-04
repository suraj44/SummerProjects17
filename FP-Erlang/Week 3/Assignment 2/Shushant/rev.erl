-module(rev).
-export([reverse/1]).
reverse([H|[]])->[H];
reverse([H|T])->reverse(T)++[H].
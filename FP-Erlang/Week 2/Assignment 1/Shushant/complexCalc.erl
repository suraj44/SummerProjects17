-module(complexCalc).
-export([add/4,subtract/4,multiply/4,divide/4,arg/1,absolute/1,argInv/1,print/1]).

add(A1,B1,A2,B2)->
[A1+A2,B1+B2].

subtract(A1,B1,A2,B2)->
add(A1,B1,-A2,-B2).

multiply(A1,B1,A2,B2)->
subtract(A1*A2,A1*B2,B1*B2,-B1*A2).

divide(A1,B1,A2,B2)->
multiply(A1,B1,A2/lists:sum(multiply(B2,A2,A2,B2)),hd(subtract(0,0,B2,0))/lists:sum(multiply(B2,A2,A2,B2))).


arg(List)->
(math:atan(lists:nth(2,List)/lists:nth(1,List)))*(180/math:pi()).

absolute(List)->
math:sqrt((lists:nth(2,List)*lists:nth(2,List))+(lists:nth(1,List)*lists:nth(1,List))).

argInv(A)->
[math:cos(A*(math:pi()/180)),math:sin(A*(math:pi()/180))].

print(List)->
io:format("Number:~p+",[lists:nth(1,List)]),
io:format("~pi~n",[lists:nth(2,List)]),
io:format("Real Component: ~p~n",[lists:nth(1,List)]),
io:format("Imaginary Component:~p~n",[lists:nth(2,List)]),
io:format("Argument:~p~n",[arg(List)]),
io:format("Magnitude:~p~n",[absolute(List)]).

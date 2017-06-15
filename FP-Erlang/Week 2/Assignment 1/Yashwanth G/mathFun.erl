-module(mathFun). 
-import(io,[format/2]).
-export([arg/1,argInv/1,absolute/1,print/1]). 

arg(A)->(180/3.14)*math:atan((lists:nth(2,A)/(lists:nth(1,A)))).

argInv(B)->[math:cos(B),math:sin(B)].

absolute(C)->math:sqrt(math:pow(lists:nth(1,C),2)+math:pow(lists:nth(2,C),2)). 

print([D,E])->
io:format("Number : ~p + ~pi~nReal Component : ~p~nImaginary Component : ~p~nArgument : ~p~nMagnitude : ~p~n",[D,E,D,E,arg([D,E]),absolute([D,E])]).
-module(complexCalc).
-export([add/4, subtract/4, multiply/4, divide/4, arg/1, argInv/1, absolute/1, print/1]).

add(R1, R2, I1, I2) ->
[R1+R2, I1+I2].

subtract(R1, R2, I1, I2) ->
add(R1, -R2, I1, -I2).

multiply(R1, R2, I1, I2) ->
A=hd(subtract(0,I1*I2,0,0)),
add(R1*R2, A, R1*I2, R2*I1).

divide(R1, R2, I1, I2) ->
B=hd(tl(subtract(0,0,0,I2))),
A=hd(multiply(R2,R2,I2,B)),
multiply(R1/A, R2, I1/A, B).

arg(C) ->
[R|T]=C,
[I|_]=T,
math:atan(I/R)*180/3.14159.

argInv(Arg) ->
R=math:cos(Arg),
I=math:sin(Arg),
[R,I].

absolute(C) ->
[R|[I|_]]=C,
math:sqrt((R*R)+(I*I)).

print(C) ->
[R|[I|_]]=C,
io:fwrite("Number: ~w + ~wi~n", [R,I]),
io:fwrite("Real Component: ~w~n", [R]),
io:fwrite("Imaginary Component: ~w~n", [I]),
io:fwrite("Argument: ~w~n", [arg(C)]),
io:fwrite("Magnitude: ~w~n", [absolute(C)]).

%
%  Erlang Assignment 1
%  
%  Complex Calculator Program
%
%  author-Nachiket

-module(complexCalc).
-export([add/4,subtract/4,multiply/4,divide/4,arg/1,argInv/1,absolute/1,print/1]).
-import(math,[atan2/2,pi/0,cos/1,sin/1,sqrt/1,pow/2]).

add(R1,Img1,R2,Img2) ->
[R1+R2,Img1+Img2].

subtract(R1,Img1,R2,Img2) ->
add(R1,Img1,-R2,-Img2).

multiply(R1,Img1,R2,Img2)  ->
add((R2*R1),(R1*Img2),(-Img2*Img1),(Img1*R2)).

divide(R1,Img1,R2,Img2) ->
[X,_] = multiply(R2, Img2, R2, -Img2),
multiply(R1, Img1, R2/X, (-Img2)/X).

arg([X,Y]) ->
atan2(Y,X)*(180/pi()).

argInv(X) ->
[cos(X),sin(X)].

absolute([X,Y]) ->
sqrt(pow(X, 2) + pow(Y, 2)).

print([X,Y]) ->
io:fwrite("Number : ~w + ~w i,~nReal Component: ~w,~nImaginary Component: ~w,~nArgument: ~w,~nMagnitude: ~w",[X,Y,X,Y,arg([X,Y]),absolute([X,Y])]).

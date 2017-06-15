
-module(complexCalc).
-author("Shashank P").

-import(math, [sin/1, cos/1, sqrt/1, pow/2, atan/1, pi/0]).
-export([add/4, subtract/4, multiply/4, divide/4, arg/1, argInv/1, absolute/1, print/1]).

add(R1, I1, R2, I2) ->
  R = R1 + R2,
  I = I1 + I2,
  [R, I].

subtract(R1, I1, R2, I2) ->
  add(R1, I1, -R2, -I2).

multiply(R1, I1, R2, I2) ->
  [R3, _] = subtract(R1*R2, 0, I1*I2, 0),
  [_, I3] = add(0, R1*I2, 0, R2*I1),
  add(R3, I3, 0, 0).

divide(R1, I1, R2, I2) ->
  [Neg_I2, _] = multiply(-1, 0, I2, 0),
  [Den, _] = multiply(R2, I2, R2, Neg_I2),
  multiply(R1, I1, R2/Den, Neg_I2/Den).

arg(List) ->
  [R, I] = List,
  atan(I/R) * 180  / pi()

argInv(X) ->
  [cos(X), sin(X)].

absolute(List) ->
  [R, I] = List,
  sqrt(pow(R, 2) + pow(I, 2)).

print(List) ->
  [R, I] = List,
  io:fwrite("Number : ~w + ~w i~nReal Component: ~w~nImaginary Component: ~w~nArgument: ~w~nMagnitude: ~w",[R, I, R, I, arg(List), absolute(List)]).
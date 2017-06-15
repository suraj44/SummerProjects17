-module(complexCalc).
-export([add/4, subtract/4, multiply/4, divide/4, arg/2, argInv/1, absolute/2, print/1]). 

add(R1, I1, R2, I2) -> [R1+R2, I1+I2].

subtract(R1, I1, R2, I2) -> add(R1, I1, -R2, -I2).

multiply(R1, I1, R2, I2) -> [lists:nth(1, subtract(R1*R2, 0, I1*I2, 0)), lists:last(add(0, R2*I1, 0, R1*I2))].

divide(R1, I1, R2, I2) -> [(lists:nth(1, multiply(R1, I1, R2, -I2)))/lists:nth(1, multiply(R2, I2, R2, -I2)), 
							(lists:nth(2, multiply(R1, I1, R2, -I2)))/lists:nth(1, multiply(R2, I2, R2, -I2))].


arg(R, I) -> 180/(math:pi())*(math:atan(I/R)).

argInv(Theta) -> [math:cos(Theta), math:sin(Theta)].

absolute(R, I) -> math:pow(R*R + I*I, 0.5).

print(List) -> io:fwrite("######################~nNumber : ~w + ~bi~nReal Component : ~w~nImaginary Component : ~w~nArgument: ~f~nMagnitude : ~f~n######################~n",
							[lists:nth(1, List), lists:nth(2, List), lists:nth(1, List), lists:nth(2, List), 
							arg(lists:nth(1, List), lists:nth(2, List)), absolute(lists:nth(1, List), lists:nth(2, List))]).
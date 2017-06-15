-module(complexCalc). 
-export([add/4,subtract/4,multiply/4,divide/4]).

add(A,B,C,D)->[A+C,B+D]. 

subtract(G,E,F,H)->add(G,E,-1*F,-1*H). 

multiply(M,N,O,P)->add(O*M,M*P,-1*P*N,N*O). 

divide(W,X,Y,Z)->
   [A1,B1]=subtract(Y,0,0,Z),
   [M,N]=multiply(W,X,A1,B1),
   [A2,_]=multiply(Y,Z,A1,B1),
   [M/A2,N/A2].
%[((W*Y + X*Z)/(Y*Y + Z*Z)),(((-1*W*Z)+X*Y)/(Y*Y+Z*Z))]. 
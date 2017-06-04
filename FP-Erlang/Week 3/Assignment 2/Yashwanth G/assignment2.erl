-module(assignment2).
-export([unique/1,insort/1,ssort/1,rand/1,bsort/1,bsort1/1,mersort/1,mrge/2,fib/1,fibo/1,fiboc/1,fib1/3,replicate/2,reverse/1,qsort/1,zip/2,factorial/1,fact/1]).

unique(A)->[X||X<-A, lists:member(X,lists:delete(X,A))==false].

replicate(0,_)->[];
replicate(B,C) when B>0->[C|replicate(B-1,C)].

reverse([])->[];
reverse([M|N])->reverse(N)++[M].

zip([],_)->[];
zip(_,[])->[];
zip([D|E],[F|G])->[{D,F}|zip(E,G)].

factorial(0)->1;
factorial(H)->H*factorial(H-1).

fact(J)->fact(J,1).
fact(0,K)->K;
fact(J,K)->fact(J-1,K*J).

fib(No)-> case No of
    1 -> [1];
    2 -> [1, 1];
    _ -> reverse(fib(No, [1, 1]))
  end.
fib(2,L)->L;
fib(No,L)->fib(No-1,[hd(L)+hd(tl(L))]++L).

fibo(0)->0;
fibo(1)->1;
fibo(N)->fibo(N-1)+fibo(N-2).

fiboc(N)->fib1(N, 0, 1).
fib1(0,R,_)->R;
fib1(X,Y,Z) when X>0->fib1(X-1,Z,Y+Z).

mersort([])->[];
mersort([H|[]])->[H];
mersort(X)->{F,S}=lists:split(length(X) div 2,X),
  mrge(mersort(F),mersort(S)).

mrge(X,[])->X;
mrge([],X)->X;
mrge([X|Xs],[Y|Ys]) ->
  if X<Y->[X]++mrge(Xs,[Y|Ys]);
    true->[Y]++mrge([X|Xs],Ys)
  end.

bsort(L) when length(L) =< 1->L;
bsort(L)->S =bsort1(L),
bsort(lists:sublist(S,1,length(S)-1))++[lists:last(S)].

bsort1([])->[];
bsort1([F])->[F];
bsort1([F,G|T]) when F>G ->[G|bsort1([F|T])];
bsort1([F,G|T]) ->[F|bsort1([G|T])].

insort([])->[];
insort(L)->[H|T] = L,
insort(H,T,[]).   
insort(V,[H|T],[])->insort(H,T, [V]);
insort(V,[], S)->insert(V,S);
insort(V,[H|T],S)->insort(H,T, insert(V,S)).
   
insert(V,[])->[V];
insert(V,[H|T])->
if V =< H ->[V,H|T];
 	true->[H|insert(V,T)]
end.

ssort([])->[];
ssort(X)->ssort(X,[]).
ssort([],S)->S;
ssort([H|T],S) -> {M,R} =max(T,H,[]),
ssort(R,[M|S]).

max([],M,R)->{M,R};
max([H|T],M,R) when H < M ->max(T,M,[H|R]);
max([H|T],M,R)->max(T, H, [M|R]).

qsort([])->[];
qsort([H|T])->qsort([X||X<-T,X =<H])++[H]++qsort([X||X<-T,X>H]).

rand(N)->rand(N,[],0).
rand(N,A,N)->A;
rand(N,A,B)->rand(N,A++[rand:uniform(100)],B+1).
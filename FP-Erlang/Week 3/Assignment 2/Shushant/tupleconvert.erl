-module(tupleconvert).
-export([zip/2]).

zip([],[_])->[];
zip([_],[])->[];
zip([],[])->[];
zip([H1|L1],[H2|L2])->[{H1,H2}]++zip(L1,L2).
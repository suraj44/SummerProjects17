-module(repl).
-export([replicate/2]).

replicate(1,Y)->[Y];
replicate(X,Y)->replicate(X-1,Y)++[Y].
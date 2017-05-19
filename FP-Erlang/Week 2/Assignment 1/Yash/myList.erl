-module(myList).
-import(lists,[member/2,sort/1,sum/1,droplast/1]).
-export([append/2,last/1,find/2,sortl/1,suml/1]).
	append(X,[]) -> X;
	append(X,[H|T]) ->append(X++[H],T).
	last(L)->lists:droplast(L).
	find(X,L) ->
		lists:member(X,L).
	sortl(L) ->
		lists:sort(L).
	suml(L) ->
		lists:sum(L).

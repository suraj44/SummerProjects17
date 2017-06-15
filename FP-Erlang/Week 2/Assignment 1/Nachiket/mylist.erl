%
%  Erlang Assignment 2
%  
%  MyList Program
%
%  author-Nachiket
%
-module(mylist).
-export([appendList/2,lastElement/1,searchKey/2,sort_list/1,sum_ofList/1]).
-import(lists, [last/1, member/2, sort/1, sum/1]).

appendList(X,Y) ->
X++Y.

lastElement(List)->
last(List).

searchKey(Key,List)->
member(Key, List).

sort_list(List) -> 
sort(List).

sum_ofList(List) -> sum(List).

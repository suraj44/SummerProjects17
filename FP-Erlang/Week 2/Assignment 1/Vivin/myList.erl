-module(myList).
-export([append_list/2,last_elem/1,memin_list/1,sortl/1,sum/1]).
append_list(l1,l2)->lists:append(l1,l2).
last_elem(list)->lists:last(list).
memin_list(n,list)->lists:member(A,list).
sortl(list)->lists:sort(list).
sum(list)->lists:sum(list).
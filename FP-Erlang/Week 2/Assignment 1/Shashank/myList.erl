
-module(myList).
-author("Shashank P").

-import(lists, [append/2, last/1, member/2, sort/1, sum/1]).
-export([append_list/2, return_last/1, is_member/2, sort_list/1, sum_all/1]).

append_list(A, B) -> append(A, B).

return_last(List) -> last(List).

is_member(A, List) -> member(A, List).

sort_list(List) -> sort(List).

sum_all(List) -> sum(List).
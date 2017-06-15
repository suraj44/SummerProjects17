-module(myList).
-export([append_2lists/2, ret_last_elem/1, member_inlist/2, sort_list/1, sum_of_elem/1]). 

append_2lists(List1, List2) -> lists:append(List1, List2).

ret_last_elem(List) -> lists:last(List).

member_inlist(Member, List) -> lists:member(Member, List).

sort_list(List) -> lists:sort(List).

sum_of_elem(List) -> lists:sum(List).
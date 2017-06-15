-module(myList).
-export([append/2, append_mine/2, last/1, last_mine/1, member/2, member_mine/2, sort/1, sum/1, sum_mine/1, add_element/2]).

%Tried to write the functions for some of these operations on my %own, indicated by the function name followed by "_mine"

append(List1, List2)->
lists:append(List1,List2).

last(List1) ->
lists:last(List1).

member(A, List1) ->
lists:member(A, List1).

sort(List1) ->
lists:sort(List1).

sum(List1)->
lists:sum(List1).

append_mine(List1, List2) ->
io:format("Appending...~n"),
List3=List1++List2,
io:fwrite("~w~n", [List3]).

last_mine(List1) ->
[H|T]=List1,
if
   T == [] ->
    io:fwrite("Last element is ~w~n", [H]);
   true ->
    last_mine(T)
end.

member_mine(A, List1) ->
[H|T]=List1,
if
    A == H ->
     io:fwrite("Element found.~n");
    true ->
        if
           T == [] ->
            io:fwrite("Element not found.~n");
           true->
             member_mine(A, T)
         end
 end.

sum_mine(List1) ->
[H|T]=List1,
if 
   T /= [] ->
    H+sum_mine(T);
   true ->
    sum_mine(H,T,0)
end.

sum_mine(A, List1, 0) -> A.
 
add_element(A, List1) ->
List2=[A|List1].


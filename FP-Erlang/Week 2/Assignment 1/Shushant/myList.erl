-module(myList).
-export([append/2,last/1,is_member/2,sort/1,sum/1,addlast/2,addfirst/2]).

%Appending 2 lists
append(List1,List2)->
io:format("Appended List is:"),List1++List2.

%Finding last element of the list
last(List)->
io:format("Last element is:"),
A=lists:reverse(List),
hd(A).

%Finding if a member or not
is_member(Item, List) ->
lists:member(Item, List).

%Sorting the list
sort(List)->
io:format("List after sorting is:"),
lists:sort(List). 

%Returning Sum of elements
sum(List)->
io:format("The sum of elements in list is:"),
lists:sum(List).

%Adds a element to the end of the list
addlast(List,X)->
io:format("After adding the element at last, the list is :"),
List++[X].

%Adds a element to the beginning of the list
addfirst(List,X)->
io:format("After adding the element at first, the list is :"),
[X]++List.









 


  ASSIGNMENT 4

1) Function for(I, Pred, Update, Body) is a function that implements a for loop. For example, to display first 15 even natural number :-
assign4:for(1, fun(X) -> X =< 15 end, fun(X) -> X+1 end, fun(X) -> io:format("~w~n", [2*X]) end).


2) Function index_in_list_by_predicate(List, A, F) checks if a given A and an element of list(List) satisfies the condition in function(F) and returns the position of the first element which satisfies the condition. If no element is found, it returns not_found.
For example, to find first position of element which is divisor of 6 in a list([4,8,2,5,6,9]) :-
assign4:index_in_list_by_predicate([4,8,2,5,6,9], 6, fun(X,Y) -> X rem Y =:= 0 end).

3) Function quantifier(F, List, Pred) is a map to the following 3 functions.

(a) for_all :- Function returns true if all elements in a list(List) satisfies the predicate(Pred) and false otherwise. For example, to check if all numbers in a list are less than 10:-
assign4:quantifier(fun assign4:for_all/2, [6,8,3,9,2], fun(X) -> X < 10 end).

(b)there-exists :- Function returns true if one or more elements in the list(List) satisfy the predicate(Pred) and false otherwise. For example, to check if 7 is present in the list:-
assign4:quantifier(fun assign4:there_exists/2, [6,8,3,7,9,2], fun(X) -> X =:= 7 end).

(c)there_exists_2 :- Function returns true if exactly two elements in list(List) satisfy predicate(Pred). For example, to check if there are exactly two odd numbers in list:-
assign4:quantifier(fun assign4:there_exists_2/2, [6,8,3,4,9,2], fun(X) -> X rem 2 =:= 1 end).

4) Function foldr(F, Answer, List) implements the fold function processing from the end of list(List).
Function foldl(F, Answer, List) implements the fold function processing from the beginning of list(List).
Function filterr(Pred, L) implements the filter function using foldr.
Function filterl(Pred, L) implements the filter function using foldl.

5) Function scanl(F, Answer, List) is similar to foldl but they report all the intermediate accumulator states in the form of a list such the final result is at the end of list.
Function scanr(F, Answer, List) is similar to foldr but they report all the intermediate accumulator states in the form of a list such the final result is at the beginning of list.

6) Function rem_dups(List) removes adjacent duplicates from a list starting from its end using foldr.
(Time in microseconds).
Time when size of list is 100 : 322
Time when size of list is 1000 : 5567
Time when size of list is 10000 : 320303
Time when size of list is 100000 : 39334228

Function rem_dups_foldl(List) removes adjacent duplicates from a list from the beginning using foldl.
(Time in microseconds).
Time when size of list is 100 : 69
Time when size of list is 1000 : 4652
Time when size of list is 10000 : 335425
Time when size of list is 100000 : 37903271


7) Function quick_sort(List) uses filterl to implement quick sort algorithm on the list(List).
(Time in microseconds).
Time when size of list is 100 : 883
Time when size of list is 1000 : 6422
Time when size of list is 10000 : 235137
Time when size of list is 100000 : 39646367

8) Function even_non_prime(List) takes a list of even numbers as argument and returns sum of squares of all numbers which can be expressed as sum of 2 primes using foldl.
Note:-This algorithm assumes that the Goldbach's conjecture is true. Goldbach's conjecture states that "Every even integer greater than 2 can be expressed as the sum of two primes". Goldbach's conjecture is one of the oldest unsolved problems.

9) Function takewhile(Pred, List) returns the longest prefix of the list(List) for which all elements satisfy the predicate(Pred).
For example, assign4:takewhile(fun(X) -> X < 15 end, [10,6,14,15,22,3,4,1]) returns [10,6,14].

Function sum_sqroot() returns the least natural number n such the sum of square roots of 1 to n is greater than 1000.
Output :- Sum of square roots of first 131 natural numbers exceeds 1000ok.
Time taken :- 6520 microseconds (timer:tc(fun assign4:sum_sqroot/0))

10) Function size_subset(List, S) takes a list(List) of positive integers and another integer S as arguments and returns the size of the minimal subset whose sum is greater than or equal to s. If there exists no such subset then it returns the atom not_found.

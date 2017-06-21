############################################## ASSIGNMENT 4 ######################################################
############################################## Ashwin Joisa ######################################################


################################################################################################ Question 1

for(I, Pred, Update, Body) - Implements a for loop construct.

################################################################################################ Question 2

index_in_list_by_predicate(List, Elem, Pred) - 	searches for a given element. The comparison between the 
												given element and the elements in the list is controlled by a comparison
												parameter to index-in-list-by-predicate. The function returns the list ​ position of the match (first element is number 0), or the atom ​not_found​ if no match is found.

################################################################################################ Question 3

for_all([H|T], Pred) - checks if all elements in the list List satisfy the predicate Pred.
there_exists([H|T], Pred) - checks if one or more elements in the list List satisfy the predicate Pred.
there_exists_2(List, Pred) - checks if exactly two elements in the list List satisfy Pred.

################################################################################################ Question 4

foldl(F, Start, [H|T]) - Implements fold from left.
foldr(F, Start, [H|T]) - Implements fold from right.

filterl(Pred, L) - uses foldl.
filterr(Pred, L) - uses foldr.

################################################################################################ Question 5

scanl(F, X ,L) - reports all the intermediate accumulator states in the form of a list. Final result is the last element.
scanr(F, X ,L) - reports all the intermediate accumulator states in the form of a list. Final result is the first element.

################################################################################################ Question 6

remdups(List) - removes adjacent duplicates from a list.

################################################################################################ Question 7

qsort(List) - Sort the list using filterl() and quick sort algorithm.

################################################################################################ Question 8

ans(List) - returns sum of squares of all numbers which can be expressed as sum of 2 primes.

################################################################################################ Question 9

takewhile(Pred,List) - 	takes elements Elem from List while Pred(Elem) returns
						true, that is, the function returns the longest prefix 
						of the list for which all elements satisfy the predicate.

num() - returns the number of elements required for the sum of square roots of all natural numbers
		till that number, to exceed a sum of 1000.

################################################################################################ Question 10

desc_sort(List) - Sorts the list in descending order.

minimal_subset(L, S) - returns the ​ size of minimal subset whose sum is greater than or equal to S.
# Assignment 1

## TSORT
LOGIC: Sort using better time complexity alogrithms Eg, Mergesort: O(nlogn)
Apply Divide and Conquer algorithm.
Divide untill we obtain an atomic value for the input list
Conquer (solve recursively) and combine.

## MAXDIFF
LOGIC: Sort. Substract largest group from smallest group.
Sort list L2
a = Bought items(originally N in problem)
b = Item to contain(originally K in problem)
N1 = minimum of( (b:a-b) partition of l2 )
N2 = minimum of( (a-b:b) partition of l2 )
print sum(L2) - 2*minimum(N1,N2)
( we multiply by 2 because, minimum(N1, N2) is 'b'. So, Sum(L2)-b gives 'a' and a-b=Difference. Hence two times.)

## DIVGOLD
LOGIC: Picking a reference letter and comparing with the rest letters to arrange them lexicographically smallest.
st = Main string input(originally S in problem)
a = copy of st
Pick reference letter stored in variable 'c'. Create 'x' with the rest of letters of 'st'.
Permute c and x using concatenation and slicing and retain minimum(a, temp) to a.



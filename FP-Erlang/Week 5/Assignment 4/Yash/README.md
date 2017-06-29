------------------------------------------------------------ASSIGNMENT 4---------------------------------------------------------------------

 Function							Arguments							Explanation
 --------------------------------------------------------------------------------------------------------------------------------------------

  for							I,Pred,Update,Body				Implements a for loop with variable I based on Pred(), update statement being
  																Update() and body of the loop being Body().

  index_in_list_by_predicate	List,Value,Function				Returns zero-based index of first element for which Function(Value,Element)
  																is true.

  for_all						List,Pred 						Returns true if Pred(Element) is true for all elements of the list and false
  																if not.

  there_exists					List,Pred 						Returns true if atleast one element of the List satisfied Pred.

  there_exists_2				List,Pred 						Returns true if exactly 2 elements of the list satisfy Pred.

  foldl							Func,In,List 					Traverses list from left to right and updates In to Func(Element,In).

  foldr							Func,In,List 					Traverses list from right to left and updates In to Func(Element,In).

  filterl						Func,List 						Traverses list from left to right and returns a list of elements
  																satisfying Func.

  filterr						Func,List 						Traverses list from right to left and returns a list of elements
  																satisfying Func.

  scanl							Func,X,List                     Implements foldl but returns a list containing all intermediate states of X.

  scanr							Func,X,List                     Implements foldr but returns a list containing all intermediate states of X.

  qsort							List 							Implements quick sort using filterl.

  takewhile						Pred,List 						Returns longest prefix of the list satisfying Pred.

  elements							-							Returns number N such that sigma(sqrt(k)) for k=1 to N is less than 1000.

  min_subset 					List, Sum 						Returns length of smallest sublist of List whose sum is greater than Sum.

  rem_dumps 					List 							Removes adjacent duplicates of a list using foldr.

  rem_dumps2 					List 							Removes adjacent duplicates of a list using foldl.

  sum_of_squares 				List 							Returns sum of squares of elements in the list which can be expressed as
  																sum of 2 prime numbers.

  random 						N 								Returns a random list containing N elements.

  timer 						Function,N 						Displays time taken for Function() to excecute by generating a list of N
  																elements.
 -------------------------------------------------------------------------------------------------------------------------------------------


 Goldbach Conjecture(used for sum_of_squares function):
 ------------------------------------------------------

 Every even number greater than 2 can be expressed as a sum of 2 prime numbers.


 Timing the Code:
 ----------------

qsort:
------
1000 elements - 0.0 seconds
10000 elements - 0.656 seconds
100000 elements - 51.313 seconds

elements:
---------
0.016 seconds

for_all:
--------
Takes 0.0 seconds for upto 1000000 elements.

min_subset:
-----------
100 elements - 0.0 seconds
1000 elements - 0.015 seconds
10000 elements - 1.687998 seconds







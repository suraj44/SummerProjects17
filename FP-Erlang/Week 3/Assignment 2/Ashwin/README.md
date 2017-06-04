############################################## ASSIGNMENT 2 ######################################################
############################################## Ashwin Joisa ######################################################

############################################### Question 1 #######################################################

qsort() 			- Function that accepts a list, and sorts it using the quick sort algorithm.

isort() 			- Function that accepts a list, and sorts it using the insertion sort algorithm.
insertion_sort() 	- Inserting first element the given list, into a new sorted list recursively.
insert() 			- Inserting an element into the right place of the sorted list.

bsort() 			- Function that accepts a list, and sorts it using the bubble sort algorithm.
biggestToRightEnd() - Pushes the largest element to the right extreme of the list.

ssort() 			- Function that accepts a list, and sorts it using the selection sort algorithm.
selection_sort() 	- Recursively pops the max element from List and push into the beginning of sorted list.
max_elem() 			- Finds largest element in the list.

msort() 			- Function that accepts a list, and sorts it using the merge sort algorithm.
merge() 			- Merges 2 sorted lists, such that the merged list is also sorted.


Time taken by algorithms to sort lists of various sizes, randomly generated:-

Algorithm\Size of List		100 	1000	1000	10000(10^4)		100000(10^5)		10^6 		10^7

1. Quick Sort				0.0 	0.0  	0.0 	0.016 			0.188 				2.953 		39.70324
2. Insertion Sort			0.0 	0.0  	0.015 	1.077995 		TLE 				TLE			TLE
3. Bubble Sort				0.0 	0.0 	0.063 	15.077941 		TLE 				TLE 		TLE
4. Selection Sort			0.0 	0.0 	0.015 	1.921992 		TLE 				TLE 		TLE
5. Merge Sort				0.0 	0.0 	0.0 	0.015 			0.234 				2.906 		32.70337

TLE - Time Limit Exceeded (60 Seconds)

############################################### Question 2 #######################################################

unique() -  Takes a list as a parameter and returns the unique itemsof the list as a new list.

############################################### Question 3 #######################################################

replicate() - 	Takes two parameters n and x and returns a list containing the value x, n times.
				Example replicate(5,2) => [2,2,2,2,2]

############################################### Question 4 #######################################################

reverse() - Reverses the contents of an input list.

############################################### Question 5 #######################################################

zip() -	Takes two lists as parameters and returns a list of tuples, where each tuple contains the ith
		element from each of the input lists. The returned listis truncated in length to the length of
		the shortest argument sequence.
		Example – zip [1,2,3,4,5] [7,8,9] => [(1,7), (2,8), (3,9)]

############################################### Question 6 #######################################################

fibonacci(i) 	- Calculates the ith fibonacci number of the sequence using recursion.
fibo() 			- Calls fib() function.
fib() 			- Calculates the ith fibonacci number of the sequence using tail recursion.

Time taken by fibonacci() - Using Recursion, to compute the Nth fibonacci number.

N 		Time(s)
30 		0.078
35 		0.828
40 		9.266
42 		24.125
45 		102.656

Time taken by fib() - Using tail Recursion, to compute the Nth fibonacci number.

Fibonacci - Using Tail Recursion

N 			Time(s)
10000 		0.015
50000 		0.078
100000 		0.296
500000 		6.532
1000000 	27.094
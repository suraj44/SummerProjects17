--------------------------------------------Assignment 2------------------------------------

This assignment consists of a module asg2 consisting of the following functions:
--------------------------------------------------------------------------------------------
	Function Name			Arguments				Purpose
--------------------------------------------------------------------------------------------
		qsort				(List)				Implements quick sort algorithm.

	  merge_sort			(List)				Implements merge sort with the merge
	  											function.

	  	merge 				(List1,List2)       Merges two sorted lists to make a sorted
	  						and					list(List3).
						 (List1,List2,List3)	Merges lists 1 and 2 to list3.

	  	split				(List)				Splits the list to 2 sublists X and Y.
	  						and
	  		                (List,{X,Y})		
	  	
	  	ssort				(List)				Implements selection sort.
	  						and
	  						(List,Sorted)

	  	max					(List,Max,Rest)		Finds maxima of a list.

	  	isort				(List)				Implements insertion sort.
	  						and
	  						(List,Sorted)

	  	bubble_sort		    (List)				Implement bubble sort.
	  	and
	  	bubble_sort_p

	  	reverse				(List)				Returns a list after reversing it.
	  						and
	  						(List,Reversed)

	  	unique				(List)				Returns all the unique elements in a list.
	  						and
	  						(List,NewList)

	  	zip					(List1,List2)		Makes a list containing tuples of
	  						and					corresponding elements of 2 lists.
	  						(List1,List2,New)

	  	replicate			(Number,Element)	Makes a list by replicating Element for a 
	  						and					given number of times.
	  					   (Number,Element,New)

	  	fac					(Number)			Finds factorial of a number by recursion.

	  	fact 				(Number)			Finds factorial by tail recursion.
	  						and
	  						(Number,Factorial)

	  	random				(Number)			Generates a random list containing
	  						and					n elements.
	  						(Number,List)

	  	timer				(Type)				Times the various functions in this
	  						and					module by changing the number of
	  						(Type,Number)		elements everytime.

	  	fib					(Number)			Returns nth Fibonacci number by recursion.

	  	fib_t				(Number)			Returns nth Fibonacci number by tail
	  						and					recursion.
	  					  (Number,Prev,Prev2)
--------------------------------------------------------------------------------------------
*Note: "and" is used in arguments column to represent overloaded functions.

Arguments in timer function:
---------------------------

timer(X):

	If X is:

		i - Insertion Sort
		s - Selection Sort
		q - Quick Sort
		m - Merge Sort
		b - Bubble Sort
		fib - Fibonacci without tail recursion
		fibt - Fibonacci using tail recursion
		fac - Factorial without tail recursion
		fact - Factorial with tail recursion

	Times are calculated and displayed in powers of 10 and are shown below.

Timings:
--------
Number of elements->   10		100		1000	10^4	10^5	10^6	10^7
----------------------------------------------------------------------------
Insertion sort 		  0.00		0.00	0.016	1.078	TLE

Selection sort 		  0.00		0.00	0.015	0.61	TLE

Quick sort 			  0.00		0.00	0.00	0.015	0.094  	TLE

Merge sort 			  0.00		0.00	0.016	0.796	TLE

Bubble sort 		  0.00		0.00	0.047	7.203	TLE

-----------------------------------------------------------------------------
Without Tail Recursion:

Fibonacci:
---------
fib finished for 10 elements in 0.000000 seconds!
fib finished for 20 elements in 0.000000 seconds!
fib finished for 40 elements in 2.235000 seconds!

Factorial:
---------
fac finished for 20480 elements in 0.281000 seconds!
fac finished for 40960 elements in 1.641000 seconds!
fac finished for 81920 elements in 7.531000 seconds!

-------------------------------------------------------------------------------
With Tail Recursion:

Fibonacci:
----------
fib_t finished for 163840 elements in 0.281000 seconds!
fib_t finished for 327680 elements in 1.094000 seconds!
fib_t finished for 655360 elements in 4.500000 seconds!
fib_t finished for 1310720 elements in 25.344000 seconds!
Time limit exceeded for 2621440 elements fib_t!

Factorial:
----------
fact finished for 20480 elements in 0.297000 seconds!
fact finished for 40960 elements in 1.234000 seconds!
fact finished for 81920 elements in 5.360000 seconds!









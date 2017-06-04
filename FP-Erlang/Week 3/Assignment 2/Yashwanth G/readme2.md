Yashwanth G
Erlang - ASSIGNMENT 2.

1.unique- takes a list A and prints all the unique elements in A. The function deletes the first occurence of the element in the list and searches for the same element in the deleteed array.

2.replicate - takes two numbers B and C and returns a list of size B with all elements equal to C using recursion.

3.reverse- takes in a list and reverses the list and return a new list. We use the concept of head and tail here and recursion.

4.zip-function takes in two lists and returns a list of tuples.we again make use of head and tail of a list here and call the function recursively.

5.factorial-takes in a number H and returns its factorial by recursion
using timer function:

1-0 microseconds ; 5-0 0 microseconds  ; 10-0 microseconds ; 100-0 microseconds ; 1000-0 microseconds ; 2000- 0 microseconds ; 3000-15000 microseconds ; 4000- 1600 microseconds ; 5000- 1600 microseconds 

6.fact-calculates factorial using tail recursion.
using timer function:

1-0 microseconds ; 5-0 microseconds  ; 10-0 microseconds ; 100-0 microseconds ; 1000-0 microseconds ; 2000- 0 microseconds ; 3000-15000 microseconds ; 4000- 1600 microseconds ; 5000- 1500 microseconds

7. fib function- takes in an integer,No, and prints the first No fibonacci numbers. The function uses lists and also uses the reverse function.
using timer function:

1-0 microseconds ; 5-0 0 microseconds  ; 10-0 microseconds ; 100-0 microseconds ; 1000-0 microseconds ; 1500-16000 microseconds ; 2000- 3100 microseconds ; 3000-62000 microseconds ; 4000- 125000 microseconds ; 5000- 218000 microseconds ; 10000-1045000 microseconds.

8.fibo- takes a number N and returns the Nth fibonacci number using recursion.

using timer function:

1-0 microseconds ; 5-0 microseconds  ; 10-0 microseconds ; 20-0 microseconds ; 25-15000 microseconds ; 30- 63000 microseconds ; 35-640000 microseconds ; 40- 6817000 microseconds 

9.fiboc- takes a number N and returns the Nth fibonacci number using tail recursion.

using timer function:

1-0 microseconds ; 5-0 microseconds  ; 10-0 microseconds ; 20-0 microseconds ; 25-0 microseconds ; 100- 0 microseconds ; 1000-0 microseconds ; 2000-0 microseconds ; 5000-0 microseconds : 10000-16000 microseconds ; 20000-63000 microseconds 

10.mersort- takes a list as a input and returns the sorted list as output by performing merge sort operation. This function calls the mrge function which merges two sorted lists.

11.bsort -  takes a list as the input and then sorts it using the bubble sort algorithm. we make use of another function bsort1 which recursively sorts by exchanging two elements in the list for sorting the list.

12.insort- sorts the list using insertion sort algorithm. We use a function insert to insert the elemnent at the appropriate location.

13.ssort- this function sorts the list using selection sorting algorithm.it uses the function max to calculate the maximum for swapping the values.

14-qsort-sorts using quick sort algorithm.

15.rand- generates a random listof length N with each element between 0 and 100.

using timer function:

for list with length 1:
Merge sort-0 microseconds
Quick sort-0 microseconds
Bubble sort-0 microseconds
Insertion sort-0 microseconds
Selection sort-0 microseconds

for list with length 10:
Merge sort-0 microseconds
Quick sort-0 microseconds
Bubble sort-0 microseconds
Insertion sort-0 microseconds
Selection sort-0 microseconds

for list with length 100:
Merge sort-0 microseconds
Quick sort-0 microseconds
Bubble sort-0 microseconds
Insertion sort-0 microseconds
Selection sort-0 microseconds

for list with length 1000:
Merge sort-0 microseconds
Quick sort-0 microseconds
Bubble sort-109000 microseconds
Insertion sort-0 microseconds
Selection sort-16000 microseconds

for list with length 10000:
Merge sort-15000 microseconds
Quick sort-32000 microseconds
Bubble sort-730000 microseconds
Insertion sort-297000 microseconds
Selection sort-700000 microseconds



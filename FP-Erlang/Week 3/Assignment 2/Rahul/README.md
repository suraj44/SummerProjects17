ASSIGNMENT - 2

Name of module - assignment2

Functions included in the module -

1.qsort - Implements the quick-sort algorithm.

2.insort - Implements the insertion sort algorithm.

3.bubsort - Implements the bubble sort algorithm.

4.selsort - Implements the selection sort algorithm.

5.mergesort - Implements the merge sort algorithm.

6.unique - Returns the unique elements of a list.

7.replicate - Takes two parameters n and x and returns a list 
  containing the value x n times.
  
8.reverse - Returns the reverse of the given list.

9.zip - Takes two lists as parameters and returns a list of tuples, 
  where each tuple contains the i-th element from each of the 
  input lists. The returned list is truncated in length to the length 
  of the shortest argument sequence.
  
10.fibonacci_T - Returns n terms of the fibonacci sequence where   
  n is the given parameter using tail recursion.
  
11.fibo_NT - Returns n terms of the fibonacci sequence where 
n is the given parameter without using tail recursion.



Efficiency of Sorting Algorithms - 

Function used for timing - timer:tc/3

Function used for generating random lists - 
[rand:uniform(a)||_<-lists:seq(1,b)]  
where a = range of the numbers from 1 to a
b = number of elements in the list
 
Taking a = 1000 -->

All average times are in micro seconds.

Quick Sort ->

10 elements - 0

10^2 elements - 0

10^3 elements - 1570

10^4 elements - 24850

10^5 elements - 662345

10^6 elements - 45344043

10^7 elements - >1 minute


Insertion Sort -> 

10 elements - 0

10^2 elements - 470

10^3 elements - 40310

10^4 elements - 40310

10^5 elements - 4125003

10^6 elements - >1 minute

10^7 elements - >1 minute


Bubble Sort ->

10 elements - 0

10^2 elements - 4530

10^3 elements - 1740600

10^4 elements - >1 minute

10^5 elements - >1 minute

10^6 elements - >1 minute

10^7 elements - >1 minute


Selection Sort ->

10 elements - 0

10^2 elements - 470

10^3 elements - 37500

10^4 elements - 7071906

10^5 elements - >1 minute

10^6 elements - >1 minute

10^7 elements - >1 minute


Merge Sort ->

10 elements - 0

10^2 elements - 160

10^3 elements - 18700

10^4 elements - 4543800

10^5 elements - >1 minute

10^6 elements - >1 minute

10^7 elements - >1 minute


Efficiency of Fibonacci Algorithm-

Using Tail Recursion ->

1 element - 0

2 elements - 0

5 elements - 0

10 elements - 0

20 elements - 0

50 elements - 0

100 elements - 0

200 elements - 0

500 elements - 150

1000 elements - 8750

5000 elements - 324220

10000 elements - 1690780

100000 elements - >1 minute


Without using Tail Recursion ->

1 element - 0

2 elements - 0

5 elements - 0

10 elements - 16

20 elements - 1750

30 elements - 313000

40 elements - 18467819

50 elements - >1 minute

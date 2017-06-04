
 Assignment 2

Sorting Algorithms

Here is the data of time(in microseconds) taken by five different sorting algorithms for different sizes of input list.

(Refer to sort_algo.erl for the code)
(Time is computed for lists below size 10^7 AND when time taken does not exceed 60 seconds)

1) Quick sort 
  
Function: qsort

Time when size of list is 10 : 19
Time when size of list is 100 : 240
Time when size of list is 1000 : 2535
Time when size of list is 10000 : 14200
Time when size of list is 100000 : 60389
Time when size of list is 1000000 : 856808

2) Insertion sort

Function: isort

Time when size of list is 10 : 8
Time when size of list is 100 : 175
Time when size of list is 1000 : 18864
Time when size of list is 10000 : 270554
Time when size of list is 100000 : 31015605

3) Bubble sort

Function: bsort

Time when size of list is 10 : 3
Time when size of list is 100 : 164
Time when size of list is 1000 : 14321
Time when size of list is 10000 : 823110

4) Selection sort

Function: ssort

Time when size of list is 10 : 3
Time when size of list is 100 : 68
Time when size of list is 1000 : 8046
Time when size of list is 10000 : 646946

5) Merge sort

Function: msort

Time when size of list is 10 : 5
Time when size of list is 100 : 35
Time when size of list is 1000 : 797
Time when size of list is 10000 : 5505
Time when size of list is 100000 : 89294
Time when size of list is 1000000 : 1236629

Conclusion: Among the five sorting algorithms quick sort and merge sort are the fastest, insertion sort is medium fast, bubble sort and selection sort are the slowest.


Fibonacci Numbers

Here is the data of time(in microseconds) taken by two different recursive functions(tail and non-tail) to find Nth Fibonacci number for different input N.

(Refer to fibonacci.erl for the code)
(Time is computed until time taken exceeds 60 seconds)

1) Non-tail recursion
  
Function: fibon

Time when N is 5 : 1
Time when N is 10 : 2
Time when N is 15 : 27
Time when N is 20 : 194
Time when N is 25 : 2048
Time when N is 30 : 24288
Time when N is 35 : 252416
Time when N is 40 : 2766989
Time when N is 45 : 30802235


2) Tail recursion
  
Function: tail_fib

Time when N is 1 : 2
Time when N is 10 : 2
Time when N is 100 : 9
Time when N is 1000 : 207
Time when N is 10000 : 11466
Time when N is 100000 : 162452
Time when N is 1000000 : 13350402

Conclusion: Tail recursion is faster than non_tail recursion.







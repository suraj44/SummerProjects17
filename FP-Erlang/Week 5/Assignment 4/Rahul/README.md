# Assignment 4

### Given module contains the following functions :-

for - Implementation of a FOR loop in Erlang

index_in_list_by_predicate - Returns the list position of match
(first element is number 0), or the atom not_found​ if no match is found.

for_all - Checks if all elements in the list satisfy
the given predicate.

there_exists - Checks if one or more elements in the
list satisfy the given predicate.

there_exists_2 - Checks if exactly two elements in the list
satisfy the given predicate.

foldl - Processes elements of a list starting from the left.

foldr - Processes elements of a list starting from the right.

filterl - Filters the elements of a list that satisfy a predicate starting from the left.

filterr - Filters the elements of a list that satisfy a predicate starting from the right.

scanl - Processes elements of a list starting from the left while also displaying the
intermediate accumulator states.

scanr - Processes elements of a list starting from the right while also displaying the
intermediate accumulator states.

rem_dupsl - Removes adjacent duplicates from a list starting from the left.

rem_dupsr - Removes adjacent duplicates from a list starting from the right.

qsort - Implements quick sort.

sumsquare - Takes a list of even numbers as argument and returns sum of squares of
all numbers which can be expressed as sum of 2 primes i.e. sum of squares of all numbers
greater than 2 (Goldbach Conjecture).

takewhile - Takes elements from the list and returns the longest prefix of the list for which all elements satisfy the
predicate.

sumroot - Finds the number of elements it takes for the sum of the square roots of all natural numbers to
exceed 1000.

min_size - Takes a list of n positive integers and
another integer s as arguments and returns the size of minimal subset whose sum is greater than
or equal to s. If there exists no such subset then return the atom not_found​ instead.

### Efficiency of the Algorithms :-

All average times are in microseconds.

Function used for generating random lists - 
[rand:uniform(a)||_<-lists:seq(1,b)]  
where a = range of the numbers from 1 to a
b = number of elements in the list
 
Taking a = 1000 -->

qsort - 

10 elements - 0

10^2 elements - 320

10^3 elements - 16720

10^4 elements - 3270252

10^5 elements - >1 minute

sumsquare - 

10 elements - 0

10^2 elements - 460

10^3 elements - 5470

10^4 elements - 58440

10^5 elements -  661721

10^6 elements - 10968832

10^7 elements - >1 minute

sumroot - 93000


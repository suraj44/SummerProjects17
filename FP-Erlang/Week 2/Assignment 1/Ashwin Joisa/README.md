Ashwin Joisa
Erlang - ASSIGNMENT 1.

Module 1 - myList.erl
This module contains wrapper functions for the following features which are already defined in the inbuilt
lists module in Erlang.

1. Appending 2 lists.
2. Returning last element of list.
3. Finding out if an element is a member of a list.
4. Sorting a given list.
5. Returning sum of elements in a given list


Module 2 - complexCalc.erl
This module contains a calculator module for complex numbers which consists of 4 functions that takes 4
numbers as arguments (Real and Imaginary Components of 2 numbers) and returns a single
list containing the real and imaginary component of the result.

1. add() - Adds the 2 complex numbers manually
2. subtract() - Calls the add() function for computation
3. multiply() - Using only the '*' operator, add() and subtract() functions for
computation
4. divide() - Without using any of the 3 operators [ '+' , '-', '*' ] to
implement this function.

It also contains 2 functions by taking help of the inbuilt math module in Erlang.
1. arg() - Takes a 2-membered list corresponding to a complex number as input parameter
and returns the argument in degrees.
2. argInv() - Takes a single number as an input parameter and returns a complex number
(2-membered list) whose argument in radians corresponds to the input (For the sake
of the problem, take the magnitude of the complex number = 1).
3. absolute() - Takes a 2-membered list corresponding to a complex number as input
paramater and returns the magnitude.
4. print() - Takes a 2-membered list corresponding to a complex number as input param-
eter and prints details of the complex number in the format "Number : a + b i, Real
Component: a, Imaginary Component: b, Argument: theta, Magnitude: z". You are
allowed to innovate on the format.
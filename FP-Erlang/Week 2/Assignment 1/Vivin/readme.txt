Module 1 - myList.erl This module contains wrapper functions for the following features which are already defined in the inbuilt lists module in Erlang.

Appending 2 lists.
Returning last element of list.
Finding out if an element is a member of a list.
Sorting a given list.
Returning sum of elements in a given list
Module 2 - complexCalc.erl This module contains a calculator module for complex numbers which consists of 4 functions that takes 4 numbers as arguments (Real and Imaginary Components of 2 numbers) and returns a single list containing the real and imaginary component of the result.

add() - Adds the 2 complex numbers manually
subtract() - Calls the add() function for computation
multiply() - Using only the '*' operator, add() and subtract() functions for computation
divide() - Without using any of the 3 operators [ '+' , '-', '*' ] to implement this function.
Some other functions are

arg() - Takes a 2-membered list corresponding to a complex number as input parameter and returns the argument in degrees.
argInv() - Takes a single number as an input parameter and returns a complex number (2-membered list) whose argument in radians corresponds to the input (For the sake of the problem, take the magnitude of the complex number = 1).
absolute() - Takes a 2-membered list corresponding to a complex number as input paramater and returns the magnitude.
print() - Takes a 2-membered list corresponding to a complex number as input param- eter and prints details of the complex number in the format "Number : a + b i, Real Component: a, Imaginary Component: b, Argument: theta, Magnitude: z". You are allowed to innovate on the format.
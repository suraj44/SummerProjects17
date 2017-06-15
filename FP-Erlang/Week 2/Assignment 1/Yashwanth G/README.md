Yashwanth G
Erlang - ASSIGNMENT 1.

Module 1- myList.erl
this module contains five functions for performing various actions on lists.
This module basically contains wrapper functions.
1. Appending two lists- using the inbuilt function append adn taking two lists A and B as input.
2.Last element of list- using the inbuilt function last taking only a list C as the input.
3.Finding out if an element is a member of a list- input is D, any elemnent and E is the list in which we are checking using the member function.
4.to sort a list- we use sort function taking the list,F as the input.
5.returning sum of elemet sof list- using sum function and taking input as G a list

Module 2-complexCalc.erl
This module contains four functions for performing basic mathematical operations on two complex numbers.
1 . add- takes four inputs for two real parts and two imaginary parts and a single list containing the final result is returned.
2. subtract- takes four inputs for two real parts and two imaginary parts and it calls the addition function with a minus sign on the second complex number.
3. multiply-takes four inputs for two real parts and two imaginary parts and a single list containing the final result is returned.
4.divide-takes four inputs and we store the conjugate of denominator in A1,B1, then M,N store the numerator after dividing and A2 stores the denominator. finally we divide them and return a list.

Module 3-mathFun.erl
 1. arg - using atan funtion we return the argument of input list A
 2 argInv- takes in a list B and gives the comlex number of form <cos + i sin> busing the sin and cos functions
 3.absolute - takes in a list and returns the square root of sum of squares by using the pow and sqrt functions.
 4. print- prints all details calculated above by using the format function and calling all functons in module.
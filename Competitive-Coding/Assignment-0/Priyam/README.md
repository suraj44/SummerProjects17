# Assignment 0 

## TEST
LOGIC: Break on encountering 42
Takes x=1 as boolean true and starts a while loop.
Upon encountering input = 42, loop breaks else it keeps printing them.

## HS08TEST
LOGIC: Checking for valid transaction conditions
x = Amount to withdraw
y = Initial account balance
If x is a multiple of 5 and y-x-0.5 is positive, print y-x-0.5 upto 2 decimal places
else it isn't a valid transaction, print y


## FCTRL
LOGIC: No of trailing 0's is determined by factors 5 and 2.
x = Input number
Using x in a function: Z(x)
Function z implements the following:
For each factor of x, check if they are divisible by 5 and increment cnt(intially 0)

## TRICOIN
LOGIC: A trangle is formed when it has consecutive entries starting from 1(1,2,3...)
x = No of gold coins Chef has
Start a loop from 1 to x(included)
check if consecutive entry logic applies(by storing them in sum and checking if sum<=x at each step) else break.
Also incement h(initially 0) at each step where above step satisfies.

## SMPAIR
LOGIC: Sorting
Take the inputs in a list and sort them in ascending order. 
(py has a sort() fn inbuilt, but for the sake of this course, coded it)
Print sum of 1st and 2nd entry.


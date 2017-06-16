readme3

ASSIGNMENT 3
Yashwanth G

the given function fun(N) after simplifying from its recursive defintion becomes fun(N) = fun(N-1) + 2*fun(N-2).

we solve it using matrix exponentiation.
take a two by two matrix with 0 1 in row 1 and 2 1 in row 2.
mutiplying it with a matrix with fun(1) in row 1 and fun(2) in row 2 will give us a matrix with fun(2) and fun(3).

similarly the first matrix raised to the power n multiplied with second matrix will give us fun(n+1) and fun(n+2).

pow function- accepts two inputs a list X and a number N and this function multiplies the list X treating it as a 2X2 matrix with itself N times.

multiply funciton- this functon multiplies two matrices and returns the resultant 2x2 matrix.

funn function- calculates the value required. based on the fun() function.


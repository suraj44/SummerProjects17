Hello everyone! This is Yash V Dodeja and this is my first assignment in Erlang.
It has two modules:

1.myList- This module is used to implement various list computations with the
	  following functions:

	a)append(X,Y): takes two lists X and Y as arguments and returns the appended list.
	   A new case is added for the case if Y is an empty list.

	b)last(X): takes a list as argument, uses dropLast() from lists module and returns
	   the last element in X.

	c)find(X,L): takes a list L and a value X and returns true if X is in L and false if not.
	   It uses the built in member() function in lists module.

	d)sortl(L): takes a list L and returns it after sorting it using built in function sort()
	   in lists module.

	e)suml(L): takes a list L and returns the sum of all its elements using built in sum() in
	   lists module.

2.complexCalc- This module is used to do various computations with complex numbers with the
	       following functions:

	Without built-in functions:

	a)add(R1,I1,R2,I2): takes two complex numbers [R1,I1] and [R2,I2] and adds them and returns
	   the sum.

	b)subtract(R1,I1,R2,I2): takes two complex numbers and uses the finds the difference using
	   the add() function.

	c)multiply(R1,I1,R2,I2): takes two complex numbers and returns their product as a two membered
	   list using the add() function.

	d)divide(R1,I1,R2,I2): takes two complex numbers and returns the answer after dividing them 
	   without using "+","-" and "*" operators.

	Using built-in functions:

	a)arg([X,Y]): takes a complex number and returns its argument in degrees using built-in 
	   atan() function in math module.
	
	b)argInv(Z): takes argument in radians and returns a complex number having this argument
	   and magnitude 1.

	c)absolute([A,B]): takes a complex number and returns its magnitude.

	d)print([A,B]): takes a complex number and displays all its details using the previous
	   functions.

--------------------------------------------Thank You-----------------------------------------------------------
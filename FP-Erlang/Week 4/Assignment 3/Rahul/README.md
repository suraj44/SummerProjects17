Assignment 3 -

Given module contains an algorithm to calculate value of fun(N) where fun() is represented by the following pseudocode :-

    fun(N)   
    
     ans = 0  

     if (N == 1)  
        return 1  

     for i in [1,N]  
        if (i == 1 or i == N)  
            ans = ans + 3  
        else  
            ans = ans + fun(i - 1) + fun(N - i)  
  
     return ans  

Efficiency of the algorithm :-


All average times are in microseconds.


N = 2 -> 5620

N = 2^2 -> 5620

N = 2^3 -> 5620

N = 2^4 -> 5780

N = 2^5 -> 5780

N = 2^6 -> 5780

N = 2^7 -> 5780

N = 2^8 -> 5780

N = 2^9 -> 5780
.  
.  
.  
.  
.  
.  
.  
.  
.  
.  
N = 2^45 -> 5780

N = 2^46 -> 5940

N = 2^47 -> 5940

N = 2^48 -> 5940

N = 2^49 -> 5940

N = 2^50 -> 5940

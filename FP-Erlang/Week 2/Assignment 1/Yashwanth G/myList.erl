-module(myList). 
-export([app/2,ret/1,elem/2,sort/1,sum/1]). 
 
 app(A,B)->lists:append(A,B).

 ret(C)->lists:last(C).

 elem(D,E)->lists:member(D,E). 

 sort(F)->lists:sort(F).

 sum(G)->lists:sum(G). 
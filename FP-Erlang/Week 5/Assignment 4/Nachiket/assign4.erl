%
% Assignment Four
%
% Author-Nachiket
%
-module(assign4).
-compile(export_all).
%
% 1) For loop construct
%
for(I,Pred,Update,Body) ->
	case Pred(I) of
    	true-> Body(I),
    		for(Update(I),Pred,Update,Body);
    	false-> looping_ends
    end.
%
% 2)Index-in-list-by-Predicate
%
index_in_list_by_predicate(L,I,Pred)-> index_in_list_by_predicate(L,I,Pred,0,0).
index_in_list_by_predicate([],_,_,Loc,_)->
	case Loc=:=0 of
		true-> not_found;
		false-> Loc-1
	end;
index_in_list_by_predicate([H|T],I,Pred,Loc,It)->
	case Pred(I,H) of
		true-> index_in_list_by_predicate(T,I,Pred,It+1,It+1);
		false -> index_in_list_by_predicate(T,I,Pred,Loc,It+1)
	end.
%
% 3)for_all() ,there_exists, there_exists2
%
for_all(List,Pred)-> for_all(List,Pred,0).
for_all([],_,Acc)->
	case Acc=:=0 of
		true-> true;
		false-> false
	end;
for_all([H|T],Pred,Acc) ->
	case Pred(H) of
		true -> for_all(T,Pred,Acc);
		false-> for_all([],Pred,1)
	end.

there_exists([],_)-> false;
there_exists([H|T], Pred)->
	case Pred(H) of
		true-> true;
		false-> there_exists(T,Pred)
	end.

there_exists_2(List,Pred)->there_exists_2(List,Pred,0).
there_exists_2([],_,Acc) ->
	case Acc=:=2 of
		true-> true;
		false-> false
	end;
there_exists_2([H|T],Pred,Acc)->
	case Pred(H) of
		true->there_exists_2(T,Pred,Acc+1);
		false->there_exists_2(T,Pred,Acc)
	end.

%
% 4)foldl(), foldr()
%
foldl(_,Start,[])->Start;
foldl(F,Start,[H|T])->foldl(F,F(H,Start),T).

foldr(F,Start,L)->foldl(F,Start,lists:reverse(L)).
%
% 4) filterr() and filterl()
%
filterr(Pred,L)->
	List= fun(X,Y)->
			case Pred(X) of
				true->[X|Y];
				false->Y
			end
		end,
	foldr(List,[],L).

filterl(Pred,L)->
	List= fun(X,Y)->
			case Pred(X) of
				true->[X|Y];
				false->Y
			end
		end,
	foldl(List,[],L).
%
% 5)scanl and scanr
%
scanl(F,Acc,L)->scanl(F,Acc,L,Acc).
scanl(_,_,[],List)-> lists:reverse(List);
scanl(F,Acc,[H|T],List)->scanl(F,F(H,Acc),T,[F(H,Acc)|List]).

scanr(F,Acc,L)->scanr(F,Acc,L,Acc).
scanr(_,_,[],List)-> List;
scanr(F,Acc,[H|T],List)->scanr(F,F(H,Acc),T,[F(H,Acc)|List]).

%
% 6)remove duplicates 
%

rem_dups(L)->
F = fun(X,List) ->
	case lists:member(X,List) of
		true -> List;
		false -> [X|List]
    end
end,
foldr(F,[],L).

%Another definition using foldl
%rem_dups(L)->
%F = fun(X,List)
%	case lists:member(X,List) of
%		true -> List;
%		false -> [List|X]
%    end
%end,
%foldr(F,[],L).

%
% 7)quicksort
%
qsort([]) -> [];
qsort([H|T]) ->
    qsort(filterl(fun(X)-> X=<H end,T)) ++ [H] ++ qsort(filterl(fun(X)-> X>H end,T)).
%
% 8)is_prime checks whether a number is prime
%   sumof() checks whether a number is sum of two primes
%   sumof_2primes is the main function
%
is_prime(1)-> false;
is_prime(N)-> is_prime(N,2,true).
is_prime(N,N,Acc)->Acc;
is_prime(N,I,Acc)->
	case (N rem I) =:= 0 of
		true-> is_prime(0,0,false);
		false->is_prime(N,I+1,Acc)
	end.

sumof(N)->sumof(N-2,2,false).
sumof(N,I,Acc) when N<I ->Acc;
sumof(N,I,Acc)->
	case is_prime(I) and is_prime(N) of
		 true->sumof(2,4,true);
		false->sumof(N-1,I+1,Acc)
	end.

sumof_2primes(L)->
	F= fun(X,Y)->
		case sumof(X) of
			true->(X*X)+Y;
			false->Y
		end
	    end,
    foldl(F,0,L).
%
% 9)takewhile()
%
takewhile(Pred,List)-> takewhile(Pred,List,[]).
takewhile(_,[],Acc)->lists:reverse(Acc);
takewhile(Pred,[H|T],Acc)->
	case Pred(H) of
		true-> takewhile(Pred,T,[H|Acc]);
		false-> takewhile(Pred,[],Acc)
	end.
%
% 9) part2 answer is 132
%    the function natural_nos is used to find the answer
%
natural_nos()->natural_nos(0,0).
natural_nos(I,Acc) ->
	case Acc=<1000 of
		true->natural_nos(I+1,Acc+math:sqrt(I));
		false->I
	end. 	 
%
% 10) Size of minimal subset
%

minimal_subset(L,S)->minimal_subset(lists:reverse(lists:sort(L)),S,0,0).
minimal_subset([],S,Acc,C)->
	case Acc < S of
		true-> not_found;
		false-> C
	end;
minimal_subset([H|T],S,Acc,C)->
	case Acc >= S of
		true -> C;
		false-> minimal_subset(T,S,Acc+H,C+1)
	end.
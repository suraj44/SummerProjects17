-module(asg2).
-export([qsort/1,merge_sort/1,merge/2,merge/3,split/1,split/2,ssort/1,ssort/2,max/3,isort/1,isort/2,bubble_sort/1,bubble_sort_p/1,reverse/1,reverse/2,unique/1,unique/2,zip/2,zip/3,replicate/2,replicate/3,random/1,timer/2,fac/1,fact/1,fact/2,timer/1,fib/1,fib_t/1,fib_t/3]).
	
	% Quick Sort Implementation
	
	qsort([])->[];
	qsort([Pivot|T])->
		qsort([X||X<-T,X<Pivot])++[Pivot]++qsort([X||X<-T,X>=Pivot]).
	
	% Merge Sort Implementation
	
	merge_sort([])->[];
	merge_sort([H|[]])->[H];
	merge_sort(L)->
		{L1,L2}=split(L),
		merge(merge_sort(L1),merge_sort(L2)).
	
	merge(L1,L2)->
		merge(L1,L2,[]).
	
	merge([],[],X)-> X;
	merge(S1,[],X)-> X++S1;
	merge([],S2,X)-> X++S2;
	merge([H1|T1],[H2|T2],X) ->
	 case H1<H2 of 
	 true -> merge(T1,[H2|T2],X++[H1]);
	 false-> merge(T2,[H1|T1],X++[H2])
	end.
	
	% splitting the list without built-in function
	
	split(L)-> split(L,{[],[]}).
	split([],{X,Y})-> {X,Y};
	split([H|T],{X,Y})-> split(T,{Y,X++[H]}).
	
	% Selection Sort Implementation
	
	ssort([])->[];
	ssort(L)->ssort(L,[]).
	ssort([],S)->S;
	ssort([H|T],S)->
	{Max,Rest}=max(T,H,[]),
	ssort(Rest,[Max|S]).

	% finding maxima of the list

	max([],M,R)->{M,R};
	max([H|T],M,R) when H<M->max(T,M,[H|R]);
	max([H|T],M,R)->max(T,H,[M|R]).

	% Insertion Sort Implementation

	isort(L) -> isort(L, []).
	isort([], S) -> S;
	isort(L, S) -> M = lists:min(L),
	isort(lists:delete(M, L), S++[M]).

	% Bubble Sort Implementation

	bubble_sort(L) when length(L) =< 1 ->
    	L;
	bubble_sort(L) ->
    	SL = bubble_sort_p(L),
    	bubble_sort(lists:sublist(SL,1,length(SL)-1)) ++ [lists:last(SL)].

	bubble_sort_p([])  ->
    	[];
	bubble_sort_p([F]) ->
    	[F];
	bubble_sort_p([F,G|T]) when F > G ->
    	[G|bubble_sort_p([F|T])];
	bubble_sort_p([F,G|T]) ->
    	[F|bubble_sort_p([G|T])].

	% Reversing a list
	
	reverse([H|T])->reverse([H|T],[]).
	reverse([],X)->X;
	reverse([H|T],X)->reverse(T,[H]++X).
	
	% Returning unique elements
	
	unique([H|T])->unique([H|T],[]).
	unique([],X)->X;
	unique([H|T],X)->
		case lists:member(H,X) of
			true->unique(T,X);
			false->unique(T,X++[H])
		end.
	
	% Returning tuples of corresponding list elements
	
	zip([H|T],[H1|T1])->zip([H|T],[H1|T1],[]).
	zip(_,[],X)->X;
	zip([],_,X)->X;
	zip([H|T],[P|Q],X)->zip(T,Q,X++[{H,P}]).
	
	% factorial of a number
	
	fac(0)->1;
	fac(N)->N*fac(N-1).
	
	% factorial using tail recursion
	
	fact(N)->fact(N,1).
	fact(0,X)->X;
	fact(N,X)->fact(N-1,X*N).
	
	% Replicating an element to make a list
	
	replicate(N,X)->replicate(N,X,[]).
	replicate(0,_,L)->L;
	replicate(N,X,L)->replicate(N-1,X,L++[X]).

	% Getting random lists of length N

	random(N)->
		random(N,[]).
	random(0,X)->X;
	random(N,X)->random(N-1,X++[rand:uniform(100000)]).

	% Timer function
	timer(Type)->timer(Type,10).

	timer(Query,N) when N>=10000000->
			io:format("Time limit exceeded >=10^7 elements!~n");
	timer(Query,N)->
			case Query of
				i->
					X=random(N),
					{Time,_}=timer:tc(asg2,isort,[X]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements isort!~n",[N]);
					true->io:format("isort finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;
				q->
					X=random(N),
					{Time,_}=timer:tc(asg2,qsort,[X]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements qsort!~n",[N]);
					true->io:format("qsort finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;
				b->
					X=random(N),
					{Time,_}=timer:tc(asg2,bubble_sort,[X]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements bsort!~n",[N]);
					true->io:format("bsort finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;
				m->
					X=random(N),
					{Time,_}=timer:tc(asg2,merge_sort,[X]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements msort!~n",[N]);
					true->io:format("msort finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;
				s->
					X=random(N),
					{Time,_}=timer:tc(asg2,ssort,[X]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements ssort!~n",[N]);
					true->io:format("ssort finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;
				fib->
					{Time,_}=timer:tc(asg2,fib,[N]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements fib!~n",[N]);
					true->io:format("fib finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;
				fibt->
					{Time,_}=timer:tc(asg2,fib_t,[N]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements fib_t!~n",[N]);
					true->io:format("fib_t finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;
			 	fac->
					{Time,_}=timer:tc(asg2,fac,[N]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements fac!~n",[N]);
					true->io:format("fac finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;
				fact->
					{Time,_}=timer:tc(asg2,fact,[N]),
					if Time>60000000->
						io:format("Time limit exceeded for ~w elements fact!~n",[N]);
					true->io:format("fact finished for ~w elements in ~f seconds!~n",[N,Time/1000000])
					end;

				true->io:format("Invalid Query!~n")
			end,
			timer(Query,N*2).%timer(Query,N*2). for the last 4 cases...

			% Fibonacci using recursion

			fib(1)->1;
			fib(2)->1;
			fib(N)->fib(N-1)+fib(N-2).

			% Fibonacci using tail recursion

			fib_t(N)->fib_t(N,1,1).
			fib_t(1, A, _)-> A;
			fib_t(2, _, B)-> B;
			fib_t(N, A, B)-> fib_t(N-1, B, A+B).









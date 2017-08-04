-module(assignment4).
-export([for/4, index_in_list_by_predicate/3, for_all/2, there_exists/2, there_exists_2/2, foldl/3, foldr/3, filterl/2, filterr/2, scanl/3, scanr/3, remdupsl/1, remdupsr/1, qsort/1, sumsquare/1, takewhile/2, sumroot/0, sumroot/1, min_size/2]).

for([], _, _, _) -> io:format("");
for(I, Pred, Update, Body) -> Body(I),
 case Pred(I) of
          true -> for(Update(I), Pred, Update, Body);
          false -> for([], Pred, Update, Body)
 end.

index_in_list_by_predicate(L, Element, Pred) -> index_in_list_by_predicate(0, L, Element, Pred, 0).
index_in_list_by_predicate(_, [], _, _, 0) -> not_found;
index_in_list_by_predicate(_, [], _, _, 1) -> io:format("");
index_in_list_by_predicate(Index, [H|T], Element, Pred, Flag) ->
  case Pred(Element, H) of
      true -> io:format("~w~n", [Index]),
      index_in_list_by_predicate(Index+1, T, Element, Pred, 1);
      false -> if Flag == 0 ->
                index_in_list_by_predicate(Index+1, T, Element, Pred, 0);
                true -> index_in_list_by_predicate(Index+1, T, Element, Pred, 1)
                end
    end.


for_all([], _) -> true;
for_all([H|T], Pred) ->
 case Pred(H) of
  true -> for_all(T, Pred);
  false -> false
  end.

there_exists([], _) -> false;
there_exists([H|T], Pred) ->
 case Pred(H) of
  true -> true;
  false -> there_exists(T, Pred)
  end.

there_exists_2(List, Pred) -> there_exists_2(List, Pred, 0).
there_exists_2([], _, Count)-> if Count ==2 -> true;
true -> false
end;
there_exists_2([H|T], Pred, Count) ->
 case Pred(H) of
   true -> there_exists_2(T, Pred, Count+1);
   false -> there_exists_2(T, Pred, Count)
   end.

foldl(_, Element, []) -> Element;
foldl(F, Element, [H|T]) -> foldl(F, F(H,Element), T).

foldr(F, Element, List) -> foldl(F, Element, lists:reverse(List)).

filterl(Pred, List) -> filterl(Pred, List, []).
filterl(_,[],[]) -> [];
filterl(Pred, [H|T], []) ->
F = fun(Head, Acc) ->
case Pred(Head) of
 true -> Acc++[Head];
 false -> Acc
 end
end,
foldl(F, [], [H|T]).

filterr(Pred, List) -> filterl(Pred, lists:reverse(List)).

scanl(F, Element, List) -> scanl(F, Element, List, []).
scanl(_, _, [], Acc) -> Acc;
scanl(F, Element, [H|T], Acc) -> scanl(F, F(H,Element), T, Acc++[F(H,Element)]).

scanr(F, Element, List) -> scanl(F, Element, lists:reverse(List), []).

remdupsl([H|T]) ->
F= fun(Head,Acc) ->
 case Head =:= hd(lists:reverse(Acc)) of
 true -> Acc;
 false -> Acc++[Head]
 end
end,
foldl(F, [H], [H|T]).

remdupsr([H|T]) ->
F= fun(Head,Acc) ->
 case Head =:= hd(lists:reverse(Acc)) of
 true -> Acc;
 false -> Acc++[Head]
 end
end,
lists:reverse(foldr(F, [H], [H|T])).

qsort([])->[];
qsort([Pivot|Tail]) ->
qsort(filterl(fun(X) -> X<Pivot end, Tail))++[Pivot]++qsort(filterl(fun(X) -> X>=Pivot end, Tail)).

sumsquare(List) ->
F= fun(X,Sum) ->
 case X =:= 2 of
  true -> Sum;
  false -> Sum+(X*X)
  end
 end,
foldl(F,0,List).

takewhile(Pred, List) -> takewhile(Pred, List, []).
takewhile(_, [], Acc) -> Acc;
takewhile(Pred, [H|T], Acc) ->
case Pred(H) of
 true -> takewhile(Pred, T, Acc++[H]);
 false -> Acc
 end.

sumroot() -> sumroot(1).
sumroot(Y) ->
P=scanl(fun(X,Sum) -> math:sqrt(X)+Sum end, 0, lists:seq(1,Y)),
Q=takewhile(fun(X) -> X<1000 end, P),
case length(P) =:= length(Q) of
 true -> sumroot(Y+1);
 false -> io:fwrite("~w~n~w", [length(Q), Q])
 end.

min_size(List,S) -> min_size(lists:reverse(qsort(List)),S,[]).
min_size([],_,_)->not_found;
min_size([H|T],S,Acc) ->
case foldl(fun(X,Sum)->X+Sum end,0,Acc) >= S of
 true -> length(Acc);
 false -> min_size(T,S,Acc++[H])
 end.

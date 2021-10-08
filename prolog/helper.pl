getIdx(Line, Col, X, Y, Idx):-
    Idx is (((Line-1) * Y) + Col) - 1.

count(X, [],0).
count(X, [H|Tail], N) :-
    count(X, Tail, N1),
    (H =:= X -> N is N1 + 1 ;  
        N = N1
    ).

replaceElement(Index, List, Element, NewList) :-
    nth0(Index, List, _, R),
    nth0(Index, NewList, Element, R).

generateVisited(Size, Size, SelPos, List, Visited):-
    Visited = List.
generateVisited(Idx, Size, SelPos, List, Visited):-
    (Idx =:= SelPos -> Curr = 1 ; Curr = 0),
    append(List, [Curr], NewList),
    NewIdx is Idx + 1,
    generateVisited(NewIdx, Size, SelPos, NewList, Visited).

generateFlags(Size, Size, List, Flags):-
    Flags = List.
generateFlags(Idx, Size, List, Flags):-
    append(List, [0], NewList),
    NewIdx is Idx + 1,
    generateFlags(NewIdx, Size, NewList, Flags).

validPosition(E, X):-
    integer(E),
    between(1, X, E).

validAction(Action):-
    integer(Action),
    between(1, 2, Action).
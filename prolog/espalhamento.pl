acessa_matriz(X, Y, N, MAT, ELE) :- 
    IDX is X+(N*Y), 
    nth0(IDX, MAT, ELE).

visita(X, Y, N, VIS, NEW_VIS) :- 
    I is X+(N*Y), 
    append(PRIMEIROS, [_|ULTIMOS], VIS), 
    length(PRIMEIROS, I), 
    append(PRIMEIROS, [1|ULTIMOS], NEW_VIS).

direita(X, Y, M, N, NUM, VIS, NEW_VIS) :- 
    acessa_matriz(X, Y, N, NUM, NUM_ELE), 
    X_ is X+1,
    (X_ < N ->
    acessa_matriz(X_, Y, N, VIS, VIS_ELE),
    (NUM_ELE=:=0, VIS_ELE = 0 ->  
    espalhamento(X_, Y, M, N, NUM, VIS, NEW_VIS);
    NEW_VIS = VIS);
    NEW_VIS = VIS).
esquerda(X, Y, M, N, NUM, VIS, NEW_VIS):- 
    acessa_matriz(X, Y, N, NUM, NUM_ELE), 
    X_ is X-1,
    (X_ >= 0 ->  
    acessa_matriz(X_, Y, N, VIS, VIS_ELE),
    (NUM_ELE=:=0, VIS_ELE = 0 ->  
    espalhamento(X_, Y, M, N, NUM, VIS, NEW_VIS);
    NEW_VIS = VIS);
    NEW_VIS = VIS).
baixo(X, Y, M, N, NUM, VIS, NEW_VIS) :- 
    acessa_matriz(X, Y, N, NUM, NUM_ELE), 
    Y_ is Y+1,
    (Y_ < M ->  
    acessa_matriz(X, Y_, N, VIS, VIS_ELE),
    (NUM_ELE=:=0, VIS_ELE = 0 ->  
    espalhamento(X, Y_, M, N, NUM, VIS, NEW_VIS);
    NEW_VIS = VIS);
    NEW_VIS = VIS).
cima(X, Y, M, N, NUM, VIS, NEW_VIS) :- 
    acessa_matriz(X, Y, N, NUM, NUM_ELE), 
    Y_ is Y-1,
    (Y_ >= 0 ->  
    acessa_matriz(X, Y_, N, VIS, VIS_ELE),
    (NUM_ELE=:=0, VIS_ELE = 0 ->  
    espalhamento(X, Y_, M, N, NUM, VIS, NEW_VIS);
    NEW_VIS = VIS); 
    NEW_VIS = VIS).

torna_visivel(X, Y, M, N, NUM, VIS, NEW_VIS):-
    acessa_matriz(X, Y, N, NUM, ELE),
    (ELE=:=0 -> 
    espalhamento(X, Y, M, N, NUM, VIS, NEW_VIS);
    visita(X, Y, N, VIS, NEW_VIS)).

espalhamento(X, Y, M, N, NUM, VIS, NEW_VIS) :- 
    visita(X, Y, N, VIS, VIS_1),  
    direita(X, Y, M, N, NUM, VIS_1, VIS_2), 
    baixo(X, Y, M, N, NUM, VIS_2, VIS_3),
    esquerda(X, Y, M, N, NUM, VIS_3, VIS_4),
    cima(X, Y, M, N, NUM, VIS_4, NEW_VIS).
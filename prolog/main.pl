:- [bombs, espalhamento, style, render, input, helper, bombCount].

gameOver:-
    write("GAME OVER!").

winGame:-
    write("VOCÊ VENCEU!").

verificaVitoria(Vis, X, Y, Bombs, Venceu):-
    count(1, Vis, NumVis),
    FreeSquares is (X * Y) - Bombs,
    (NumVis =:= FreeSquares -> Venceu = true ; Venceu = false).

gameLoop(X, Y, Bombs, BombList, BombCount, Visited, Flags):-
    renderBoard(1, 1, X, Y, BombCount, Visited, Flags),
    getUserChoice(X, Y, Line, Col, Action),
    getIdx(Line, Col, X, Y, SelPos),
    (Action =:= 2 -> 
        replaceElement(SelPos, Flags, 1, NewFlags), 
        gameLoop(X, Y, Bombs, BombList, BombCount, Visited, NewFlags)
        ;
        nth0(SelPos, BombList, IsBomb),
        (IsBomb =:= 1 -> gameOver ;
            NewLine is Line - 1,
            NewCol is Col - 1,
            torna_visivel(NewCol, NewLine, X, Y, BombCount, Visited, NewVisited),
            verificaVitoria(NewVisited, X, Y, Bombs, Venceu),
            (Venceu -> winGame ; 
                gameLoop(X, Y, Bombs, BombList, BombCount, NewVisited, Flags)
            )
        )
    ).

newBoard(X, Y, Bombs, Line, Col):-
    Size is X * Y,
    getIdx(Line, Col, X, Y, SelPos),
    gerabombas(Size, Bombs, SelPos, BombList),
    lista_quantidade(X, Y, BombList, 1, BombCount),
    generateVisited(0, Size, SelPos, [], Visited),
    NewLine is Line - 1,
    NewCol is Col - 1,
    torna_visivel(NewCol, NewLine, X, Y, BombCount, Visited, NewVisited),
    generateFlags(0, Size, [], Flags),
    gameLoop(X, Y, Bombs, BombList, BombCount, NewVisited, Flags).

newFakeBoard(X, Y, Bombs):-
    colNumbers(Y),
    renderFakeBoard(1, 1, X, Y, Bombs),
    getUserFirstChoice(X, Y, Line, Col),
    newBoard(X, Y, Bombs, Line, Col).

startGame(1):-
    newFakeBoard(9, 9, 10).
    
startGame(2):-
    newFakeBoard(16, 16, 40).

startGame(3):-
    newFakeBoard(20, 20, 100).

main:-
    getDifficultyLevel(Level),
    startGame(Level).
renderBoard(CounterX, CounterY, X, Y, BombCount, Visited, Flags):-
    getIdx(CounterX, CounterY, X, Y, Idx),
    (Idx =:= 0 -> colNumbers(Y) ; Idx is Idx),
    newLine(CounterX, CounterY, Y),
    nth0(Idx, Visited, Show),
    nth0(Idx, Flags, IsFlag),
    (Show =:= 0 -> (IsFlag =:= 1 -> flag ; square);
        nth0(Idx, BombCount, NBombs),
        square(NBombs)
    ),
    (CounterY =:= Y -> NewCounterY is 1, NewCounterX is CounterX + 1 ; 
        NewCounterY is CounterY + 1,
        NewCounterX is CounterX
    ),
    (CounterX =:= X, CounterY =:= Y -> lineDivider(Y) ;
        renderBoard(NewCounterX, NewCounterY, X, Y, BombCount, Visited, Flags)
    ).

renderFakeBoard(CounterX, CounterY, X, Y, Bombs):-
    newLine(CounterX, CounterY, Y),
    square,
    (CounterY =:= Y -> NewCounterY is 1, NewCounterX is CounterX + 1 ; 
        NewCounterY is CounterY + 1,
        NewCounterX is CounterX
    ),
    (CounterX =:= X, CounterY =:= Y -> lineDivider(Y) ;
        renderFakeBoard(NewCounterX, NewCounterY, X, Y, Bombs)
    ).

colNumbersLoop(Size, Size):- write(Size).
colNumbersLoop(X, Size):-
    write(X),
    (X >= 9 -> write('  ') ; 
        write('   ')
    ),
    NewX is X + 1,
    colNumbersLoop(NewX, Size).
colNumbers(Size):- 
    styleText('green'),
    write('     '),
    colNumbersLoop(1, Size),
    resetStyle.

newLine(X, Y, Size):-
    (Y =:= 1 -> 
        lineDivider(Size),
        styleText('green'),
        write(X),
        (X >= 10 -> write(' ') ;
            write('  ')
        ),
        resetStyle,
        styleBg('white'),
        styleText('black'),
        write('|'),
        resetStyle; write("")
    ).

lineDividerLoop(0):- write('+').
lineDividerLoop(X):-
    write('+---'),
    NewX is X - 1,
    lineDividerLoop(NewX).

lineDivider(X):- 
    nl,
    write('   '),
    styleBg('white'),
    styleText('black'),
    lineDividerLoop(X),
    resetStyle,
    nl.

flag:-
    styleBg('red'),
    write('   '),
    styleBg('white'),
    styleText('black'),
    write('|'),
    resetStyle.

square:-
    styleBg('white'),
    styleText('black'),
    write('   '),
    write('|'),
    resetStyle.

square(0):-
    write('   '),
    styleBg('white'),
    styleText('black'),
    write('|'),
    resetStyle.

square(N):-
    numberColor(N),
    write(' '),
    write(N),
    write(' '),
    resetStyle,
    styleBg('white'),
    styleText('black'),
    write('|'),
    resetStyle.
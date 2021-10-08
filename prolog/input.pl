getLine(Line):-
    write('Linha'),
    read(Line),
    nl.

getCol(Col):-
    write('Coluna'),
    read(Col),
    nl.

getAction(Action):-
    writeln("Escolha uma ação:"),
    writeln("1 - Abrir"),
    writeln("2 - Bandeira"),
    read(Action),
    nl.

getUserFirstChoice(X, Y, Line, Col):-
    getLine(RawLine),
    (validPosition(RawLine, X) -> 
        getCol(RawCol),
        (validPosition(RawCol, Y) -> 
            Line = RawLine,
            Col = RawCol
        ; getUserFirstChoice(X, Y, Line, Col)) 
    ; getUserFirstChoice(X, Y, Line, Col)).

getUserChoice(X, Y, Line, Col, Action):-
    getAction(RawAction),
    (validAction(RawAction) ->
        getLine(RawLine),
        (validPosition(RawLine, X) -> 
            getCol(RawCol),
            (validPosition(RawCol, Y) -> 
                Line = RawLine,
                Col = RawCol,
                Action = RawAction
            ; getUserChoice(X, Y, Line, Col, Action)) 
        ; getUserChoice(X, Y, Line, Col, Action))
    ; getUserChoice(X, Y, Line, Col, Action)).


getDifficultyLevel(Level):-
    nl,
    writeln("Escolha uma dificuldade:"),
    writeln("1 - Fácil"),
    writeln("2 - Médio"),
    writeln("3 - Difícil"),
    read(LevelRaw),
    (member(LevelRaw, [1, 2, 3]) -> Level = LevelRaw;
        getDifficultyLevel(Level)
    ).
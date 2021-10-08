resetStyle:- write('\u001b[0m').
cleanScreen:- write('\u001b[2J').

numberColor(1):-
    write('\u001b[31m').
numberColor(2):-
    write('\u001b[32m').
numberColor(3):-
    write('\u001b[33m').
numberColor(4):-
    write('\u001b[34m').
numberColor(5):-
    write('\u001b[35m').
numberColor(6):-
    write('\u001b[36m').
numberColor(7):-
    write('\u001b[37m').
numberColor(8):-
    write('\u001b[31m').

styleText('black'):- write('\u001b[30m').
styleText('red'):- write('\u001b[31m').
styleText('green'):- write('\u001b[32m').
styleText('yellow'):- write('\u001b[33m').
styleText('blue'):- write('\u001b[34m').
styleText('magenta'):- write('\u001b[35m').
styleText('cyan'):- write('\u001b[36m').
styleText('white'):- write('\u001b[37m').

styleBg('black'):- write('\u001b[40m').
styleBg('red'):- write('\u001b[41m').
styleBg('green'):- write('\u001b[42m').
styleBg('yellow'):- write('\u001b[43m').
styleBg('blue'):- write('\u001b[44m').
styleBg('magenta'):- write('\u001b[45m').
styleBg('cyan'):- write('\u001b[46m').
styleBg('white'):- write('\u001b[47m').
criabomba(B):- random(0, 100, R), R<17 -> B = 1; B = 0.
decresceBomba(H, B, B1):- H =:= 1 -> B1 = B - 1;  B1 = B.

gerabombas(0, _, _, []).
gerabombas(S, B, C, [H|T]):- C =:= 0,  C1 is -1, H = 0, S1 is S-1, gerabombas(S1, B, C1, T).
gerabombas(S, B, C, [H|T]):- B > 0, B =:= S, H = 1, S1 is S-1, C1 is C-1, B1 is B-1, gerabombas(S1, B1, C1, T).
gerabombas(S, B, C, [H|T]):- B > 0, B < S, criabomba(H), S1 is S-1, C1 is C-1, decresceBomba(H, B, B1), gerabombas(S1, B1, C1, T).
gerabombas(S, B, C, [H|T]):- B =:= 0, H = 0, S1 is S-1, C1 is C-1, gerabombas(S1, B, C1, T).
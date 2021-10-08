% Função que recebe as dimensões do campo e a lista da posição das bombas
% e gera a lista de quantidade de bombas ao redor de cada posição.
%  A variavel I deve sempre começar em 1.
lista_quantidade(M, N, L, I, R):- X is M * N, (I =< X -> R = [H|T], quantidade(M, N, L, I, H),
J is I + 1, lista_quantidade(M, N, L, J, T); R = []).

% A função quantidade recebe as dimensões do campo, a lista de bombas e um indice
% e atribui a R quantas bombas têm ao redor da posição daquele índice.

% A posição é a diagonal superior esquerda.
quantidade(_, N, L, 1, R):- dir(1, D), baixo_dir(1, N, BD), baixo(1, N, B),
busca(D, L, R1), busca(BD, L, R2), busca(B, L, R3), R is R1 + R2 + R3.
% A posição é a diagonal superior direita.
quantidade(_, N, L, N, R):- esq(N, E), baixo_esq(N, N, BE), baixo(N, N, B),
busca(E, L, R1), busca(BE, L, R2), busca(B, L, R3), R is R1 + R2 + R3.
% A posição é a diagonal inferior esquerda.
quantidade(M, N, L, I, R):- X is (M*N) - N + 1, (I =:= X -> cima(I, N, C), cima_dir(I, N, CD), dir(I, D),
busca(C, L, R1), busca(CD, L, R2), busca(D, L, R3), R is R1 + R2 + R3; false).
% A posição é a diagonal inferior direita.
quantidade(M, N, L, I, R):- X is M*N, (I =:= X -> cima(I, N, C), cima_esq(I, N, CE), esq(I, E),
busca(C, L, R1), busca(CE, L, R2), busca(E, L, R3), R is R1 + R2 + R3; false).
% A posição está na linha superior.        
quantidade(_, N, L, I, R):- (I > 1, I < N ->
esq(I, E), dir(I, D), baixo_esq(I, N, BE), baixo(I, N, B), baixo_dir(I, N, BD),
busca(E, L, R1), busca(D, L, R2), busca(BE, L, R3), busca(B, L, R4), busca(BD, L, R5),
R is R1 + R2 + R3 + R4 + R5; false).
% A posição está na coluna mais à esquerda.
quantidade(_, N, L, I, R):- X is (I-1) mod N, (X =:= 0 ->
cima(I, N, C), cima_dir(I, N, CD), dir(I, D), baixo(I, N, B), baixo_dir(I, N, BD),
busca(C, L, R1), busca(CD, L, R2), busca(D, L, R3), busca(B, L, R4), busca(BD, L, R5),
R is R1 + R2 + R3 + R4 + R5; false).
% A posição está na coluna mais à direita.
quantidade(_, N, L, I, R):- X is I mod N, (X =:= 0 ->
cima_esq(I, N, CE), cima(I, N, C), esq(I, E), baixo_esq(I, N, BE), baixo(I, N, B),
busca(CE, L, R1), busca(C, L, R2), busca(E, L, R3), busca(BE, L, R4), busca(B, L, R5),
R is R1 + R2 + R3 + R4 + R5; false).
% A posição está na linha inferior.
quantidade(M, N, L, I, R):- X is (M*N) - N + 1, Y is M * N, (I > X, I < Y ->
cima_esq(I, N, CE), cima(I, N, C), cima_dir(I, N, CD), esq(I, E), dir(I, D),
busca(CE, L, R1), busca(C, L, R2), busca(CD, L, R3), busca(E, L, R4), busca(D, L, R5),
R is R1 + R2 + R3 + R4 + R5; false).
% A posição está ao centro do campo.
quantidade(_, N, L, I, R):- cima_esq(I, N, CE), cima(I, N, C), cima_dir(I, N, CD), esq(I, E),
dir(I, D), baixo_esq(I, N, BE), baixo(I, N, B), baixo_dir(I, N, BD),
busca(CE, L, R1), busca(C, L, R2), busca(CD, L, R3), busca(E, L, R4),
busca(D, L, R5), busca(BE, L, R6), busca(B, L, R7), busca(BD, L, R8),
R is R1 + R2 + R3 + R4 + R5 + R6 + R7 + R8.

% Função que recebe um índice e uma lista de booleanos
% e atribui a R 1 caso o valor naquele índice seja true e 0 caso seja false.
% Os índices começam de 1 e não de 0.
busca(1, [A|_], R):- (A = 1 -> R = 1; R = 0).
busca(I, [_|B], R):- J is I - 1, busca(J, B, R).

% Funções que recebem um índice e atribuem a R o valor do indíce da posição
% em uma determinada direção em relação ao primeiro ao índice recebido.
cima_esq(I, N, R):- R is I - N - 1.
cima(I, N, R):- R is I - N.
cima_dir(I, N, R):- R is I - N + 1.
esq(I, R):- R is I - 1.
dir(I, R):- R is I + 1.
baixo_esq(I, N, R):- R is I + N - 1.   
baixo(I, N, R):- R is I + N.
baixo_dir(I, N, R):- R is I + N + 1.
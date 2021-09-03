module ContaBombas where

--Função que recebe as dimensões do campo e a lista da posição das bombas e retorna a lista de quantidade de bombas ao redor de cada posição.
--O último Int recebido pela função deve sempre começar em 1.
contaBombas :: Int -> Int -> [Bool] -> Int -> [Int]
contaBombas m n l i 
  |i > m*n = []
contaBombas m n l i = [quantidade m n l i] ++ contaBombas m n l (i+1)

--Função que recebe um índice e uma lista de booleanos e retorna 1 caso o valor naquele índice seja True e 0 caso seja False.
--Os índices começam de 1 e não de 0.
busca :: Int -> [Bool] -> Int
busca 1 (a:as) = if a == True then 1 else 0
busca ind (a:as) = busca (ind-1) as

--Função que recebe as dimensões do campo, a lista de bombas e um indice e retorna quantas bombas têm ao redor da posição daquele índice.
quantidade :: Int -> Int -> [Bool] -> Int -> Int
quantidade m n l i
  --A posição é a diagonal superior esquerda
  |i == 1 = busca dir l + busca baixo l + busca baixo_dir l
  --A posição é a diagonal superior direita
  |i == n = busca esq l + busca baixo_esq l + busca baixo l
  --A posição é a diagonal inferior esquerda
  |i == (m*n) - n + 1 = busca cima l + busca cima_dir l + busca dir l
  --A posição é a diagonal inferior direita
  |i == m*n = busca cima_esq l + busca cima l + busca esq l
  --A posição está na linha superior
  |i > 1 && i <= n = busca esq l + busca dir l + busca baixo_esq l + busca baixo l + busca baixo_dir l
  --A posição está na coluna mais à esquerda
  |mod (i - 1) n == 0 = busca cima l + busca cima_dir l + busca dir l + busca baixo l + busca baixo_dir l
  --A posição está na coluna mais à direita
  |mod i n == 0 = busca cima_esq l + busca cima l + busca esq l + busca baixo_esq l + busca baixo l
  --A posição está na linha inferior
  |i > (m*n) - n && i <= (m*n) = busca cima_esq l + busca cima l + busca cima_dir l + busca esq l + busca dir l
  |otherwise = busca cima_esq l + busca cima l + busca cima_dir l + busca esq l + busca dir l + busca baixo_esq l + busca baixo l + busca baixo_dir l
  where
    cima_esq = i - n - 1
    cima = i - n
    cima_dir = i - n + 1
    esq = i - 1
    dir = i + 1
    baixo_esq = i + n - 1
    baixo = i + n
    baixo_dir = i + n + 1

--main :: IO()
--main = do
--  print (contaBombas 3 5 [True, False, False, False, False, False, True, False, True, False, False, True, False, False, False] 1)
module Espalhamento where

import Queue
import List

--               x      y      n      m      num      bombs      vis      get_vis
espalhamento :: Int -> Int -> Int -> Int -> [Int] -> [Bool] -> [Bool] -> [Bool]
espalhamento x y n m num bombs vis = get_vis (espalhamento_rec m n (num,bombs) ([x*n + y], visitar (x*n + y) vis))

espalhamento_rec :: Int -> Int -> ([Int],[Bool]) -> ([Int], [Bool]) -> ([Int],[Bool])
espalhamento_rec n m (num,bombs) ([], vis) = ([], vis)
espalhamento_rec n m (num,bombs) (fila, vis) = espalhamento_rec n m (num,bombs) (dequeue (cima n m (num,bombs) (esquerda n m (num,bombs) (baixo n m (num,bombs) (direita n m (num,bombs) (fila, vis))))))

cima :: Int -> Int -> ([Int],[Bool]) -> ([Int], [Bool]) -> ([Int], [Bool])
cima m n (num,bombs) ([], vis) = ([], vis)
cima m n (num,bombs) (fila, vis)
  |top fila - m < 0 = (fila, vis)
  |access (top fila - m) vis = (fila, vis)
  |access (top fila - m) bombs = (fila, vis)
  |access (top fila) bombs = (fila, vis)
  |access (top fila - m) num > 0 = (fila, visitar (top fila - m) vis)
  |otherwise = (enqueue (top fila - m) fila, visitar (top fila - m) vis)

baixo :: Int -> Int -> ([Int],[Bool]) -> ([Int], [Bool]) -> ([Int], [Bool])
baixo m n (num,bombs) ([], vis) = ([], vis)
baixo m n (num,bombs) (fila, vis)
  |top fila + m >= n*m = (fila, vis)
  |access (top fila + m) vis = (fila, vis)
  |access (top fila + m) bombs = (fila, vis)
  |access (top fila) bombs = (fila, vis)
  |access (top fila + m) num > 0 = (fila, visitar ((top fila) + m) vis)
  |otherwise = (enqueue ((top fila) + m) fila, visitar ((top fila) + m) vis)

direita :: Int -> Int -> ([Int],[Bool]) -> ([Int], [Bool]) -> ([Int], [Bool])
direita m n (num,bombs) ([], vis) = ([], vis)
direita m n (num,bombs) (fila, vis)
  |((top fila) + 1 >= n*m) || (div ((top fila) + 1) m) /= (div (top fila) m) = (fila, vis)
  |access (top fila + 1) vis = (fila, vis)
  |access (top fila + 1) bombs = (fila, vis)
  |access (top fila) bombs = (fila, vis)
  |access ((top fila) + 1) num > 0 = (fila, visitar ((top fila) + 1) vis)
  |otherwise = (enqueue ((top fila) + 1) fila, visitar ((top fila) + 1) vis)

esquerda :: Int -> Int -> ([Int],[Bool]) -> ([Int], [Bool]) -> ([Int], [Bool])
esquerda m n (num,bombs) ([], vis) = ([], vis)
esquerda m n (num,bombs) (fila, vis)
  |((top fila) - 1 < 0) || (div ((top fila) - 1) m) /= (div (top fila) m) = (fila, vis)
  |access (top fila - 1) vis = (fila, vis)
  |access (top fila - 1) bombs = (fila, vis)
  |access ((top fila) - 1) num > 0 = (fila, visitar ((top fila) - 1) vis)
  |otherwise = (enqueue ((top fila) - 1) fila, visitar ((top fila) - 1) vis)

get_vis :: ([Int],[Bool]) -> [Bool]
get_vis (_,vis) = vis

visitar :: Int -> [Bool] -> [Bool]
visitar _ [] = []
visitar 0 (h:t) = True:t
visitar i (h:t) = h:visitar (i-1) t
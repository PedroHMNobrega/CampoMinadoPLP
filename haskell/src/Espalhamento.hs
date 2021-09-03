module Espalhamento where

import Queue
import List

espalhamento :: Int -> Int -> Int -> Int -> [Int] -> [Bool] -> [Bool]
espalhamento x y m n num vis = get_vis (espalhamento_rec m n num (if ((access (x + n*y) num) > 0) then [] else [x + n*y], visitar (x + n*y) vis))

espalhamento_rec :: Int -> Int -> [Int] -> ([Int], [Bool]) -> ([Int],[Bool])
espalhamento_rec m n num ([], vis) = ([], vis)
espalhamento_rec m n num (fila, vis) = espalhamento_rec m n num (dequeue (cima m n num (esquerda m n num (baixo m n num (direita m n num (fila, vis))))))

cima :: Int -> Int -> [Int] -> ([Int], [Bool]) -> ([Int], [Bool])
cima m n num ([], vis) = ([], vis)
cima m n num (fila, vis)
  |(top fila) - n < 0 = (fila, vis)
  |access (top fila - n) vis = (fila, vis)
  |access ((top fila) - n) num > 0 = (fila, visitar ((top fila) - n) vis)
  |otherwise = (enqueue ((top fila) - n) fila, visitar ((top fila) - n) vis)

baixo :: Int -> Int -> [Int] -> ([Int], [Bool]) -> ([Int], [Bool])
baixo m n num ([], vis) = ([], vis)
baixo m n num (fila, vis)
  |((top fila) + n >= n*m) = (fila, vis)
  |access (top fila + n) vis = (fila, vis)
  |access ((top fila) + n) num > 0 = (fila, visitar ((top fila) + n) vis)
  |otherwise = (enqueue ((top fila) + n) fila, visitar ((top fila) + n) vis)

direita :: Int -> Int -> [Int] -> ([Int], [Bool]) -> ([Int], [Bool])
direita m n num ([], vis) = ([], vis)
direita m n num (fila, vis)
  |((top fila) + 1 >= n*m) || (div ((top fila) + 1) n) /= (div (top fila) n) = (fila, vis)
  |access (top fila + 1) vis = (fila, vis)
  |access ((top fila) + 1) num > 0 = (fila, visitar ((top fila) + 1) vis)
  |otherwise = (enqueue ((top fila) + 1) fila, visitar ((top fila) + 1) vis)

esquerda :: Int -> Int -> [Int] -> ([Int], [Bool]) -> ([Int], [Bool])
esquerda m n num ([], vis) = ([], vis)
esquerda m n num (fila, vis)
  |((top fila) - 1 < 0) || (div ((top fila) - 1) n) /= (div (top fila) n) = (fila, vis)
  |access (top fila - 1) vis = (fila, vis)
  |access ((top fila) - 1) num > 0 = (fila, visitar ((top fila) - 1) vis)
  |otherwise = (enqueue ((top fila) - 1) fila, visitar ((top fila) - 1) vis)

get_vis :: ([Int],[Bool]) -> [Bool]
get_vis (_,vis) = vis

visitar :: Int -> [Bool] -> [Bool]
visitar _ [] = []
visitar 0 (h:t) = True:t
visitar i (h:t) = h:visitar (i-1) (t)
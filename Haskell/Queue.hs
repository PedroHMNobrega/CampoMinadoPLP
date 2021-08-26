module Queue where

enqueue :: Int -> [Int] -> [Int]
enqueue e fila = fila ++ [e]

dequeue :: ([Int],[Bool]) -> ([Int],[Bool])
dequeue (fila, vis) = (tail fila, vis)

top :: [Int] -> Int
top (h:t) = h 
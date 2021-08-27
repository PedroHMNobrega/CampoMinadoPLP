module List where

access :: Int -> [a] -> a
access 0 (h:t) = h
access i (h:t) = access (i-1) t
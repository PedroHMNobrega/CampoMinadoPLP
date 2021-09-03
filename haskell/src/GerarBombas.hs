module GerarBombas where

import System.Random ( Random(randomR), StdGen )

getRandom:: StdGen -> (Int, StdGen)
getRandom gen =
    let (num, newGen) = randomR (1, 100) gen
    in (num, newGen)

geraBombas :: StdGen -> Int -> Int -> Int -> [Bool]
geraBombas gen 0 bombasFaltando casaInicial = []
geraBombas gen espacosFaltando bombasFaltando casaInicial
 | (r < 15 || espacosFaltando==bombasFaltando) && bombasFaltando > 0 && espacosFaltando /= casaInicial = [True]++(geraBombas newGen (espacosFaltando - 1) (bombasFaltando - 1) casaInicial)
 | otherwise = [False]++(geraBombas newGen (espacosFaltando - 1) bombasFaltando casaInicial)
 where
  (r, newGen) = getRandom gen
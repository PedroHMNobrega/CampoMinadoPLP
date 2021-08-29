module GerarBombas where

import System.Random ( Random(randomR), StdGen )

getRandom:: StdGen -> (Int, StdGen)
getRandom gen =
    let (num, newGen) = randomR (1, 100) gen
    in (num, newGen)

geraBombas :: StdGen -> Int -> Int -> [Bool]
geraBombas gen 0 bombasFaltando = []
geraBombas gen espacosFaltando bombasFaltando = do
    let (r, newGen) = getRandom gen
    if (r < 15 || espacosFaltando==bombasFaltando) && bombasFaltando > 0
        then return True ++ geraBombas newGen (espacosFaltando - 1) (bombasFaltando - 1)
        else return False ++ geraBombas newGen (espacosFaltando - 1) bombasFaltando
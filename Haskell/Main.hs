import Graphics.UI.Threepenny as UI
import Style
import Espalhamento
import GerarBombas
import ContaBombas
import Prelude as P
import qualified Graphics.UI.Threepenny.Core as UI
import System.Random (getStdGen, StdGen)

main :: IO ()
main = startGUI config gui

gui :: Window -> UI ()
gui w = do 
    gen <- getStdGen

    let startGame :: [(Int, Bool)] -> Int -> Int -> Int -> UI()
        startGame grid 0 m n = return ()
        startGame grid index m n = do
            let (bombs, isBomb) = grid !! (index - 1)
            let bombStr = show bombs

            btn <- mkElement "button"
                #+ [p # set text bombStr # set style numberCss]
                # set style unknownSquareCss

            c <- UI.getElementsByClassName w "container" 

            element (head c) #+ [element btn]

            on UI.click btn $ \_ -> do
                --let x = P.div index m
                --let y = mod index n
                --let vis = espalhamento x y m n (getNum grid) (getVis grid)
                set' style knownSquareCss  btn 
                set' style (getStyle bombs isBomb) btn 

            startGame grid (index-1) m n


    getBody w #+ [h1 # set text "Campo Minado"]
        # set style bodyCss

    -- Criando Botões de dificuldade
    -- Facil 9X9 e 10 Minas
    easy <- mkElement "button" # set text "Fácil"
            # set style difCss
    -- Medio 16X16 e 40 Minas
    medium <- mkElement "button" # set text "Médio"
            # set style difCss
    -- Difícil 20X20 e 100 Minas
    hard <- mkElement "button" # set text "Difícil"
            # set style difCss

    --Adicionando os botões
    startGameContainer <- UI.div #. "startGameContainer"
        #+ [element easy, element medium, element hard]
        # set style startGameContainerCss
    getBody w #+ [element startGameContainer]

    --Container da grade
    container <- UI.div #. "container"
        # set style containerCss
    getBody w #+ [element container]


    on UI.click easy $ \ _ -> do    
        refreshContainer "container" w

        c <- UI.getElementsByClassName w "container" 
        element (head c) #set style [("width", "315px")] --9 * 35

        let bombs = geraBombas gen 81 10
        let bombCount = contaBombas 9 9 bombs 1

        let game = generateGame 81 bombs bombCount []
        startGame game 81 9 9
        return()

    on UI.click medium $ \ _ -> do    
        refreshContainer "container" w

        c <- UI.getElementsByClassName w "container" 
        element (head c) #set style [("width", "560px")] --16 * 35
        let game = createGame 256 []
        startGame game 256 16 16
        return()

    
    on UI.click hard $ \ _ -> do    
        refreshContainer "container" w

        c <- UI.getElementsByClassName w "container" 
        element (head c) #set style [("width", "700px")] --20 * 35
        let game = createGame 400 []
        startGame game 400 20 20
        return()

    return ()

getNum :: [(a,b)] -> [a]
getNum [] = []
getNum (x:xs) = [fst x] ++ getNum xs

getVis :: [(a,b)] -> [b]
getVis [] = []
getVis (x:xs) = [snd x] ++ getVis xs

createGame :: Int -> [(Int, Bool)] -> [(Int, Bool)]
createGame 0 l = l
createGame n l = createGame (n-1) (l ++ [(0, False)])

generateGame :: Int -> [Bool] -> [Int] -> [(Int, Bool)] -> [(Int, Bool)]
generateGame 0 bombs bombCount l = l
generateGame n (bh:bt) (ch:ct) l = generateGame (n-1) bt ct (l ++ [(ch, bh)])

refreshContainer :: String -> Window -> UI ()
refreshContainer className w = do
    c <- UI.getElementsByClassName w "container" 
    delete (head c)
    container <- UI.div #. "container"
        # set style containerCss
    getBody w #+ [element container]
    return ()

getStyle :: Int -> Bool -> [(String, String)]
getStyle bombs True = bombCss
getStyle bombs False
    | bombs == 1 = umCss
    | bombs == 2 = doisCss
    | bombs == 3 = tresCss
    | bombs == 4 = quatroCss
    | bombs == 5 = cincoCss
    | bombs == 6 = seisCss
    | bombs == 7 = seteCss
    | bombs == 8 = oitoCss
    | otherwise = []

config = defaultConfig { jsLog= \ _ -> return ()}
import Graphics.UI.Threepenny as UI
import Style
import Espalhamento
import GerarBombas
import ContaBombas
import Prelude as P
import qualified Graphics.UI.Threepenny.Core as UI
import System.Random (getStdGen, StdGen, newStdGen)

main :: IO ()
main = startGUI config gui

gui :: Window -> UI ()
gui w = do 
    gen <- getStdGen
    
    let startGame :: [(Int, Bool)] -> Int -> Int -> Int -> Int -> UI()
        startGame grid (-1) m n numBombs = return ()
        startGame grid index m n numBombs = do
            let (bombs, isBomb) = grid !! index
            let bombStr = show bombs

            btn <- mkElement "button"
                #. show index
                #+ [p # set text bombStr # set style numberCss]
                # set style unknownSquareCss
                # set value "false"

            c <- UI.getElementsByClassName w "container" 

            element (head c) #+ [element btn]

            on UI.click btn $ \_ -> do
                --TODO: Verificar primeiro clique
                case () of _
                            | isBomb -> gameOver w
                            | otherwise -> do
                                let y = P.div index m
                                let x = mod index n
                                let vis = espalhamento x y m n (getNum grid) (getVis (length grid) [])

                                set' style knownSquareCss btn 
                                set' style (getStyle bombs isBomb) btn

                                showSquares vis ((m*n)-1) w grid
                                verifySquares ((m*n)-1) 0 ((m*n) - numBombs) w

            startGame grid (index-1) m n numBombs

    let newGame :: Int -> Int -> Int -> UI()
        newGame n m numBombs = do
            gen <- newStdGen
            refreshContainer "container" w

            c <- UI.getElementsByClassName w "container" 
            let size = show (n * 35) ++ "px"
            element (head c) #set style [("width", size)] --9 * 35

            let bombs = geraBombas gen (n*m) numBombs (-1)
            let bombCount = contaBombas n m bombs 1

            let game = generateGame (n*m) bombs bombCount []
            startGame game ((n*m)-1) n m numBombs
            return()

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
        newGame 9 9 10
        return()

    on UI.click medium $ \ _ -> do    
        newGame 16 16 40
        return()

    on UI.click hard $ \ _ -> do    
        newGame 20 20 100
        return()

    return ()

getNum :: [(a,b)] -> [a]
getNum [] = []
getNum (x:xs) = [fst x] ++ getNum xs

getBombs :: [(a,b)] -> [b]
getBombs [] = []
getBombs (x:xs) = [snd x] ++ getBombs xs

getVis :: Int -> [Bool] -> [Bool]
getVis 0 vis = vis
getVis n vis = [False] ++ getVis (n-1) vis

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

showSquares :: [Bool] -> Int -> Window -> [(Int, Bool)] -> UI ()
showSquares squares (-1) w grid = return()
showSquares squares idx w grid = do
    let (bombs, isBomb) = grid !! idx
    curr <- UI.getElementsByClassName w (show idx)
    let btn = head curr
    if squares !! idx
    then do
        set' style knownSquareCss btn
        set' style (getStyle bombs isBomb) btn
        set' value "true" btn
        showSquares squares (idx-1) w grid
    else
        showSquares squares (idx-1) w grid

verifySquares :: Int -> Int -> Int -> Window -> UI ()
verifySquares (-1) discovered maxDiscovered w = do
    if discovered >= maxDiscovered
        then victory w
    else return()
verifySquares idx discovered maxDiscovered w = do
    curr <- UI.getElementsByClassName w (show idx)
    let btn = head curr

    val <- get' value btn

    if val == "true"
    then do
        verifySquares (idx-1) (discovered + 1) maxDiscovered w
    else
        verifySquares (idx-1) discovered maxDiscovered w


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

gameOver :: Window -> UI()
gameOver w = do
    refreshContainer "container" w
    c <- UI.getElementsByClassName w "container" 
    element (head c) #+ [h1 # set text "Game Over!" # set style gameOverCss]
    return ()

victory :: Window -> UI()
victory w = do
    refreshContainer "container" w
    c <- UI.getElementsByClassName w "container" 
    element (head c) #+ [h1 # set text "Você Ganhou!" # set style victoryCss]
    return ()

config = defaultConfig { jsLog= \ _ -> return ()}
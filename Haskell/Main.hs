import Graphics.UI.Threepenny as UI
import Style
import Espalhamento
import Prelude as P
import qualified Graphics.UI.Threepenny.Core as UI
import System.Random (getStdGen, StdGen)

main :: IO ()
main = startGUI config gui

gui :: Window -> UI ()
gui w = do 
    let startGame :: [(Int, Bool)] -> Int -> UI()
        startGame grid 0 = return ()
        startGame grid index = do
            btn <- mkElement "button"
                # set style unknownSquareCss

            c <- UI.getElementsByClassName w "container" 

            element (head c) #+ [element btn]

            on UI.click btn $ \_ -> do
                let x = (P.div index 9)
                let y = (mod index 9)

                let vis = espalhamento x y 9 9 (getNum grid) (getVis grid)
                set' style knownSquareCss btn 

            startGame grid (index-1)


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
        let game = createGame 81 []
        startGame game 81
        return()

    on UI.click medium $ \ _ -> do    
        refreshContainer "container" w

        c <- UI.getElementsByClassName w "container" 
        element (head c) #set style [("width", "560px")] --16 * 35
        let game = createGame 256 []
        startGame game 256
        return()

    
    on UI.click hard $ \ _ -> do    
        refreshContainer "container" w

        c <- UI.getElementsByClassName w "container" 
        element (head c) #set style [("width", "700px")] --20 * 35
        let game = createGame 400 []
        startGame game 400
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

refreshContainer :: String -> Window -> UI ()
refreshContainer className w = do
    c <- UI.getElementsByClassName w "container" 
    delete (head c)
    container <- UI.div #. "container"
        # set style containerCss
    getBody w #+ [element container]
    return ()

config = defaultConfig { jsLog= \ _ -> return ()}
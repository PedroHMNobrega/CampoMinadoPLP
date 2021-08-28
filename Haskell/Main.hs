import Graphics.UI.Threepenny as UI
import Style
import Espalhamento
import Prelude as P

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
    -- Difícil 16X30 e 99 Minas
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
        c <- UI.getElementsByClassName w "container" 
        element (head c) #set style [("width", "360px")] --16 * 40
        let game = createGame 81 []
        startGame game 81
        return()

    on UI.click medium $ \ _ -> do        
        c <- UI.getElementsByClassName w "container" 
        element (head c) #set style [("width", "640px")] --16 * 40
        let game = createGame 256 []
        startGame game 256
        return()

    
    on UI.click hard $ \ _ -> do        
        c <- UI.getElementsByClassName w "container" 
        element (head c) #set style [("width", "1000px")] --25 * 40
        let game = createGame 625 []
        startGame game 625
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

erase :: [Element] -> UI ()
erase [] = return()
erase [x] = UI.delete x
erase (x:xs) = do
    erase xs
    UI.delete x 


config = defaultConfig { jsLog= \ _ -> return ()}
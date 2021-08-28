
import Graphics.UI.Threepenny as UI
import Style
import Espalhamento
import Prelude as P

main :: IO ()
main = startGUI config gui

    
gui :: Window -> UI ()
gui w = do

    let startGame :: Int-> [(Int, Bool)] -> Int -> UI()
        startGame n grid 0 = return ()
        startGame n grid index = do

            btn <- mkElement "button"
                # set style unknownSquareCss

            c <- UI.getElementsByClassName w "container"
            element (head c) #+ [element btn]

            on UI.click btn $ \_ -> do
                
                -- let x = P.div index n
                -- let y = mod index n
                -- vis eh uma lista [Bool]
                -- let vis = espalhamento x y n n (getNum grid) (getVis grid)                

                -- Falta criar a funcao de update dos quadrados

            startGame n grid (index-1)

    getBody w #+ [h1 # set text "Campo Minado"]
        # set style bodyCss

    -- Criando Botões de dificuldade
    -- Facil 9X9 e 10 Minas
    easy <- mkElement "button" # set text "Fácil"
            # set style difCss
    -- Medio 16X16 e 40 Minas
    medium <- mkElement "button" # set text "Médio"
            # set style difCss
    -- Difícil 25x25 e 99 Minas
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

    --Realizei uma reducao, de 45 para 40 no tamanho do quadrado
    on UI.click easy $ \ _ -> do
        c <- UI.getElementsByClassName w "container"
        element (head c) #set style [("width", "360px")] --16 * 40
        let vis = replicate 81 False
        let game = createGame 81 []
        startGame 9 game 81
        return()

    on UI.click medium $ \ _ -> do
        c <- UI.getElementsByClassName w "container"
        element (head c) #set style [("width", "640px")] --16 * 40
        let game = createGame 256 []
        startGame 16 game 256
        return()

    on UI.click hard $ \ _ -> do
        c <- UI.getElementsByClassName w "container"
        element (head c) #set style [("width", "1000px")] --25 * 40
        let game = createGame 625 []
        startGame 25 game 625
        return()


    return ()


-- espalhamento recebe duas listas , [Int] e [Bool]
-- as duas funcoes abaixo servem para separar a lista do tipo [(Int,Bool)]
getNum :: [(a,b)] -> [a]
getNum [] = []
getNum (x:xs) = fst x : getNum xs

getVis :: [(a,b)] -> [b]
getVis [] = []
getVis (x:xs) = snd x : getVis xs


createGame :: Int -> [(Int, Bool)] -> [(Int, Bool)]
createGame 0 l = l
createGame n l = createGame (n-1) (l ++ [(0, False)])

-- Tentativa falha de remover os quadrados extras criado
-- ao mudar de dificuldade do game
erase :: [Element] -> UI ()
erase [] = return()
erase [x] = UI.delete x
erase (x:xs) = do
    erase xs
    UI.delete x

config = defaultConfig { jsLog= \ _ -> return ()}
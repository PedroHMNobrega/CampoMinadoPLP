import Graphics.UI.Threepenny as UI
import Style

main :: IO ()
main = startGUI config gui

gui :: Window -> UI ()
gui w = do 
    getBody w #+ [h1 # set text "Campo Minado"]
        # set style bodyCss

    -- Criando Botões de dificuldade
    -- Facil 9X9 e 10 Minas
    easy <- mkElement "button" # set text "Fácil"
            # set style difCss
    on click easy (\ _ -> set' style knownSquareCss easy)

    -- Medio 16X16 e 40 Minas
    medium <- mkElement "button" # set text "Médio"
            # set style difCss
    on click medium (\ _ -> set' style knownSquareCss medium)

    -- Difícil 16X30 e 99 Minas
    hard <- mkElement "button" # set text "Difícil"
            # set style difCss
    on click hard (\ _ -> set' style knownSquareCss hard)

    --Adicionando os botões
    startGameContainer <- UI.div #. "startGameContainer"
        #+ [element easy, element medium, element hard]
        # set style startGameContainerCss
    getBody w #+ [element startGameContainer]

    --Container da grade
    container <- UI.div #. "container"
        # set style containerCss
    getBody w #+ [element container]

    --Renderizar o jogo
    let startGame :: [(Int, Bool)] -> UI()
        startGame [] = return ()
        startGame (h:t) = do
            btn <- mkElement "button"
                # set style unknownSquareCss
            c <- UI.getElementsByClassName w "container" 
            element (head c) #+ [element btn]
            on click btn (\ _ -> set' style knownSquareCss btn)
            startGame t

    let game = createGame 81 []
    c <- UI.getElementsByClassName w "container" 
    element (head c) #set style [("width", "405px")] --9 * 45
    startGame game

    return ()

createGame :: Int -> [(Int, Bool)] -> [(Int, Bool)]
createGame 0 l = l
createGame n l = createGame (n-1) (l ++ [(0, False)])

config = defaultConfig { jsLog= \ _ -> return ()}
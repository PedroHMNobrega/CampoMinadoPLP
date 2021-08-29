module Style where

bodyCss :: [(String, String)]
bodyCss = [("background","#31373c"), ("text-align", "center"), ("color", "white")]

startGameContainerCss :: [(String, String)]
startGameContainerCss = [
    ("background","white"), 
    ("width", "250px"), 
    ("padding", "10px"), 
    ("margin", "0 auto 20px auto"), 
    ("border-radius", "15px")]

difCss :: [(String, String)]
difCss = [
    ("background","#0000ff"), 
    ("color", "white"), 
    ("padding", "5px 15px"), 
    ("margin", "0 5px"), 
    ("border", "none"), 
    ("font-weight", "bold"),
    ("border-radius", "10px"),
    ("cursor", "pointer")]

containerCss :: [(String, String)]
containerCss = [("margin", "0 auto")]

numberCss :: [(String, String)]
numberCss = [
    ("margin", "0"),
    ("font-weight", "bold"),
    ("font-size", "20px")]

unknownSquareCss :: [(String, String)]
unknownSquareCss = [
    ("background","#77ccfd"), 
    ("width", "35px"), 
    ("height", "35px"), 
    ("border", "3px solid #31373c"), 
    ("padding", "0"), 
    ("cursor", "pointer"),
    ("color", "#77ccfd")]

knownSquareCss :: [(String, String)]
knownSquareCss = [("background","#fafafc"), ("color", "#fafafc")]

umCss :: [(String, String)]
umCss = [("color","blue")]

doisCss :: [(String, String)]
doisCss = [("color","green")]

tresCss :: [(String, String)]
tresCss = [("color","red")]

quatroCss :: [(String, String)]
quatroCss = [("color","black")]

cincoCss :: [(String, String)]
cincoCss = [("color","#9c27b0")]

seisCss :: [(String, String)]
seisCss = [("color","#ff5722")]

seteCss :: [(String, String)]
seteCss = [("color","#795548")]

oitoCss :: [(String, String)]
oitoCss = [("color","#e91e63")]

bombCss :: [(String, String)]
bombCss = [("background","crimson"), ("color", "crimson")]

gameOverCss :: [(String, String)]
gameOverCss = [("color", "crimson"), ("margin-top", "40px"), ("font-size", "50px")]
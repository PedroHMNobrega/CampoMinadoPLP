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

unknownSquareCss :: [(String, String)]
unknownSquareCss = [("background","#77ccfd"), ("width", "45px"), ("height", "45px"), ("border", "3px solid #31373c"), ("padding", "0"), ("cursor", "pointer")]

knownSquareCss :: [(String, String)]
knownSquareCss = [("background","#fafafc")]
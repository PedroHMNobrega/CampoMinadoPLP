module Main where

import Graphics.UI.Threepenny.Core
import qualified Game

main :: IO ()
main = do
    startGUI defaultConfig Game.startGui

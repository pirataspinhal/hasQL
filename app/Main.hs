module Main where

import User (app)
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = run 8080 app

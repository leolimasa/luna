module Main where

import System.Environment
import qualified Luna.Syntax.Text.Parser.Parsing as Parser
import Data.Text32 (Text32)
import qualified Data.Vector.Unboxed as Vector

stringToText32 :: String -> Text32
stringToText32 str =
   foldl
    (\result i -> Vector.cons i result)
    Vector.empty
    str

main :: IO ()
main = do
    [f] <- getArgs
    contents <- readFile f
    putStrLn $ show $ Parser.parsingBase_ Parser.unit (stringToText32 contents)

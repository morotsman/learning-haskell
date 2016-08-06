module InputHelper
( getNumericLine, getStringLine
) where

import Text.Read

getNumericLine :: String -> IO Float
getNumericLine message = do
    putStrLn message
    inputS <- getLine
    let maybeNumeric = readMaybe inputS :: Maybe Float
    case maybeNumeric of Just(a) -> return a
                         Nothing -> getNumericLine message

getStringLine :: [Char] -> IO [Char]
getStringLine message = do
    putStrLn message
    inputS <- getLine
    return inputS

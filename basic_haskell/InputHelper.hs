module InputHelper
( getNumericLine
) where

import Text.Read

getNumericLine :: String -> IO Float
getNumericLine message = do
    putStrLn message
    inputS <- getLine
    let maybeNumeric = readMaybe inputS :: Maybe Float
    case maybeNumeric of Just(a) -> return a
                         Nothing -> getNumericLine message



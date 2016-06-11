import Text.Read

getNumeric :: String -> IO Float
getNumeric message = do
    putStrLn message
    inputS <- getLine
    let maybeNumeric = readMaybe inputS :: Maybe Float
    case maybeNumeric of Just(a) -> return a
                         Nothing -> getNumeric message
    

main = do
    weightS <- getNumeric "Weight?"

    putStrLn (show (weightS))    

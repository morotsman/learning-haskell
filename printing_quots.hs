main = do
    putStrLn "What is the quote?"
    quote <- getLine
    putStrLn "Who said it?"
    who <- getLine
    putStrLn (who ++ " says \"" ++ quote ++ "\"") 

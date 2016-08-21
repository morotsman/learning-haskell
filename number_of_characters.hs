main = do
    putStrLn "What is the input string?"
    input <- getLine
    let result = input ++ " has " ++ show (length input) ++ " characters"
    putStrLn result

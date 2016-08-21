main = do
    putStrLn "What is the password?"
    password <- getLine
    
    let knownPassword = "abc$123"
    let message = if knownPassword == password then "Welcome!" else "I don't know you."

    putStrLn message 

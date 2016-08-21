main = do
    putStrLn "What is your age?"
    age <- getLine
    let myAge = read age

    let message = if myAge >= 16 then "You are old enough to legaly drive" else "You are not old enough to legaly drive"
    
    putStrLn message


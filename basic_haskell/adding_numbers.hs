
getNumber :: Integer -> IO String
getNumber number = do
    putStrLn ("Enter number " ++ (show number) ++ " : ")
    getLine


main = do
    numbers <- mapM getNumber [1..5] 

    let total = foldl (+) 0 $ map read numbers 

    putStrLn ("The total is " ++ show total)



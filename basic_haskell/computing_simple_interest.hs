main = do
    putStrLn "Enter the prinipal: "
    principalS <- getLine
    putStrLn "Enter the rate of interest: "
    rateOfInterestS <- getLine
    putStrLn "Enter the number of years"
    numberOfYearsS <- getLine

    let principal = read principalS
    let rateOfInterest = read rateOfInterestS
    let numberOfYears = read numberOfYearsS

    let roi = (principal * (100 + rateOfInterest*numberOfYears)) / 100 

    putStrLn $ "After " ++ principalS ++ " years at " ++ rateOfInterestS ++ ", the investment will be worth $" ++ show roi


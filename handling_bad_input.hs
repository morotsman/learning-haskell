import Text.Read


maybeInteger :: IO (Maybe Integer)
maybeInteger = fmap readMaybe getLine

moreThenZero :: Integer -> Maybe Integer
moreThenZero rateOfReturn = 
    if rateOfReturn > 0 then
        Just(rateOfReturn)
    else
        Nothing

getRateOfReturn :: IO Integer
getRateOfReturn = do
    putStrLn "What is the rate of return?"
    rateOfReturn <- fmap (\x -> x >>= moreThenZero) maybeInteger
    case rateOfReturn of
       Just a -> return a
       Nothing -> do
           putStrLn "Sorry. That's not a valid input"
           getRateOfReturn

doubleOfInterest :: Integer -> Float
doubleOfInterest rateOfReturn = 72.0 / fromInteger(rateOfReturn)

main = do
    result <- fmap doubleOfInterest getRateOfReturn
    putStrLn $ "It will take " ++ (show result) ++ " years to double your initial investment." 
    main

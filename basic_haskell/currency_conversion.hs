 main = do
    putStrLn "How many euros are you exchanging?"
    euroS <- getLine
    putStrLn "What is the exchange rate?"
    rateS <- getLine

    let euro = round $ 100 * read euroS
    let rate = round $ 100 * read rateS
    let product = fromIntegral $ euro * rate
    let usd = (fromIntegral $ round (product / 10000.0)) / 100.0

    putStrLn $ euroS ++ " euros at the exchange rate of " ++ rateS ++ " is " ++ show usd ++ " U.S. dollars."

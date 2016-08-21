import Control.Monad  
  
main = do   
    priceAndQuantityS <- forM [1,2,3] (\a -> do  
        putStrLn $ "Enter price of item " ++ show a ++ ":"  
        price <- getLine  
        putStrLn $ "Enter the quantity of item " ++ show a ++ ":"
        quantity <- getLine
        return (price,quantity))  
    
    let priceAndQuantity = map (\v -> ((read $ fst v), (read $ snd v))) priceAndQuantityS
    let subtotal = foldl (\acc pc -> acc + (fst pc)*(snd pc)) 0.0 priceAndQuantity
    let tax = subtotal * 0.055
    let total = subtotal + tax


    putStrLn $ "Subtotal: " ++ show subtotal
    putStrLn $ "Tax: " ++ show tax
    putStrLn $ "Total: " ++ show total

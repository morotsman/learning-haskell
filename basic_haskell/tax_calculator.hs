main = do
    putStrLn "What is the order amount?"
    orderAmount <- getLine
    let amount = read orderAmount :: Float

    putStrLn "What is the state?"
    state <- getLine
   
    let (tax,subtotal) = if (state == "WI") then (5.5,amount) else (0,0)   
    let taxAmount = (tax * amount)/ 100
    let total =  amount + taxAmount

    let results = [subtotal,taxAmount,total]
    let outputs = ["The subtotal is ", "The tax is ", "The total is "]
    let result = foldl (\a acc-> a ++ acc ++ "\n") "" $
               map (\(a,b) -> b ++ (show a)) $ 
               filter (\(a,b) -> a /= 0) $ 
               zip results outputs
    
     
    

    putStrLn result

main = do
    putStrLn "Length of room?"
    lengthS <- getLine
    putStrLn "Width of room?"
    widthS <- getLine
  
    let length = read lengthS
    let width = read widthS

    let conversionRate = 350
    let area = length * width
    let rest = mod area conversionRate
    let whole = quot area conversionRate
    let gallons = if (rest == 0)
                      then whole
                      else whole + 1


    putStrLn ("You will need to purchase " ++ show(gallons) ++ " gallons to paint to cover " ++ show(area) ++ " square feet")  

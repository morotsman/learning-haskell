main = do
    putStrLn "How many people?"
    nrPeopleS <- getLine
    putStrLn "How many pizzas do you have?"
    nrPizzaS <- getLine
    putStrLn "How many slices per pizza?"
    nrSlicesS <- getLine
   
    let nrPeople = read(nrPeopleS) 
    let nrPizza = read(nrPizzaS) 
    let nrSlices = read(nrSlicesS) 

    let totalSlices = nrPizza * nrSlices
    let leftovers = mod totalSlices nrPeople
    let picesPerPerson = quot totalSlices nrPeople


    putStrLn (show(nrPeople) ++ " people with " ++ show(nrPizza) ++ " pizzas")
    putStrLn ("Each person gets " ++ show(picesPerPerson) ++ " pieces of pizza.")
    putStrLn ("There are " ++ show(leftovers) ++ " leftover pieces.")    


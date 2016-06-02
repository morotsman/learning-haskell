import Text.Printf

main = do 
   putStrLn "What is the first number?"
   i1 <- getLine
   putStrLn "What is the second number?"
   i2 <- getLine

   let firstNumber = read i1 :: Float
   let secondNumber = read i2 :: Float

   let numbers = take 4 $ repeat (firstNumber, secondNumber)
   let operators = [(+),(-),(*),(/)]
   let results = zipWith (\op n -> op (fst n) (snd n)) operators numbers 

   let resultAndOperator = zipWith (\op n -> (n,op)) ["+","-","*","/"] results
   let output = unlines $ map (\r -> i1 ++ snd r ++ i2 ++ " = " ++ show(fst r)) resultAndOperator
   

   putStrLn output

--basic functionallity in haskell


--declare a function

helloWorld :: [Char] -> [Char]
helloWorld name = "Hello: " ++ name

--manipulate a list

squareNumbers :: Int -> [Integer]
squareNumbers n = take n $ map (\x -> x*x) [1..]

--list comprehension

squareNumbers2 :: Int -> [Integer]
squareNumbers2 n = take n $ [x^2 | x <- [1..]]

--list comprehension with filter and generators

--partialy applied function 

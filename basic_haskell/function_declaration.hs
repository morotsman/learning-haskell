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

triangels :: [(Int,Int,Int)]
triangels = [(a,b,c) | c <- [1..], b <- [1..c], a <- [1..c], a^2 + b^2 == c^2]

--pattern matching

map' :: (a->b) -> [a] -> [b]
map' f []     = []
map' f (x:xs) = f(x) : map' f xs

filter' :: (a->Bool) -> [a] -> [a]
filter' f []    = []
filter' f(x:xs) = if f(x) then x:filter' f xs else filter' f xs

fib :: Int -> Int
fib n | n == 0 = 0
      | n == 1 = 1
      | otherwise = fib(n-1) + fib(n-2)


fib' :: Int -> Int
fib' 0 = 0
fib' 1 = 1
fib' n = fib(n-1) + fib(n-2)


fibs :: Int -> [Int]
fibs n = [fib(x) | x <- [0..n]]

--partialy applied function




 

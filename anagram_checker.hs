import InputHelper
import Data.List


isAnagram :: String -> String -> Bool
isAnagram word1 word2 
    | length word1 == length word2 = sort word1 == sort word2
    | otherwise                    = False

main = do
    putStrLn "Enter two strings and I'll tell you if they are anagrams: "
    word1 <- getStringLine "Enter the first string: "
    word2 <- getStringLine "Enter the second string"
    if isAnagram word1 word2 then
        putStrLn (word1 ++ " and " ++ word2 ++ " are anagrams")
    else
        putStrLn (word1 ++ " and " ++ word2 ++ " are not anagrams")
    putStrLn ""
    main 

import Text.Printf

main = do
    putStrLn "Enter a noun: "
    noun <- getLine
    putStrLn "Enter a verb: "
    verb <- getLine
    putStrLn "Enter an adjective: "
    adjective <- getLine
    putStrLn "Enter an adverb: "
    adverb <- getLine
    let result = printf "Do you %s your %s %s %s? That's hilarious!" verb adjective noun adverb
    putStrLn result    

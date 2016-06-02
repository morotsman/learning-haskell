import Data.Time.Clock
import Data.Time.Calendar

main = do
    putStrLn "What is your current age?"
    age <- getLine
    putStrLn "At what age would you lika to retire?"
    retireAge <- getLine
    now <- getCurrentTime
    

    let (year, _, _) = toGregorian $ utctDay now
    let yearsLeft = read (retireAge) - read (age)
    let retirementYear = year + yearsLeft

    
    putStrLn ("You have " ++ (show yearsLeft) ++ " years until you can retire.")
    putStrLn ("It's " ++ (show year) ++ ", so you can retire in " ++ show (retirementYear))

    

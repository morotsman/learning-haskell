import InputHelper    
import Text.Read

data Gender = Male | Female deriving (Show, Read, Ord, Eq, Bounded, Enum)

getGender:: String -> IO Gender
getGender message = do
  putStrLn message
  input <- getLine
  let maybeGender = readMaybe input :: Maybe Gender
  case maybeGender of Just(a) -> return a
                      Nothing -> getGender message


main = do
    weight <- getNumericLine "Weight?"
    gender <- getGender "Gender?"
    numberOfDrinks <- getNumericLine "Number of drinks?"
    amountOfAlcohole <- getNumericLine "Amount of alcohole?"
    amountOfTime <- getNumericLine "Amount of time since last drink?"

    let r = if gender == Male then 0.73 else 0.66
    let bac = ((numberOfDrinks * amountOfAlcohole)/(weight*r)) - (0.015*amountOfTime)


    putStrLn $ "Your BAC is " ++ show bac 

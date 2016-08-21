import InputHelper
import Data.List

data State = State {
    stateName :: String,
    stateTax :: Float,
    counties :: [County]
} deriving (Show)

data County = County {
    countyName :: String,
    countyTax :: Float
} deriving (Show)

states = [State {stateName="Wisconsine", stateTax=0,
                 counties=[County {countyName="Eau Claire", countyTax=0.05},
                           County {countyName="Dunn", countyTax=0.04}]},
          State {stateName="Illinoise", stateTax=0.08,
                 counties=[]}]

isState :: String -> State -> Bool
isState stateToFind state = stateToFind == stateName state 

hasCounties :: State -> Bool
hasCounties state = (length (counties state)) /= 0

isCounty :: String -> County -> Bool
isCounty countyToFind county = countyToFind == countyName county

getCounty :: [Char] -> State -> Maybe(County)
getCounty countyToFind state = find (isCounty countyToFind) (counties state) 

taxCalculator :: Float -> Float -> Float -> Float
taxCalculator stateTax countyTax amount = (stateTax + countyTax) * amount

getStateTax :: Maybe(State) -> Float
getStateTax (Just(state)) = stateTax state
getStateTax Nothing = 0

getCountyTax :: Maybe(County) -> Float
getCountyTax (Just(county)) = countyTax county
getCountyTax Nothing = 0

main = do
    amount <- getNumericLine "What is the order amount? "
    stateName <- getStringLine "What state do you live in? "
  
    let state = find (isState stateName) states    
    let stateHasCounties = fmap hasCounties state   

    countyName <- if stateHasCounties == Just(True) then do
                  putStrLn "County of recidence? "
                  county <- getLine
                  return (Just(county))
              else
                  return Nothing
    let county = countyName >>= (\c -> state >>= (\s -> getCounty c s))     
    
    let stateTax = getStateTax state
    let countyTax = getCountyTax county
    let tax = taxCalculator stateTax countyTax amount 
    let totalAmount = tax + amount

    putStrLn ("The tax is " ++ (show tax))
    putStrLn ("The total is " ++ (show totalAmount))

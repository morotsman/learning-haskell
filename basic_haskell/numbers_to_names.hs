import InputHelper
import qualified Data.Map as Map
import Data.Maybe as Maybe

main = do
    numberOfMonth <- getIntegerLine "Please enter the number of the month" 

    let months = Map.fromList [(1, "January"), (2, "Februari"), (3, "Mars"), (4, "April"), (5, "Maj"), (6,"Juni"), (7,"Juli"), (8, "Augusti"), (9, "September"), (10, "Oktober"), (11, "November"), (12, "December")]

    let nameOfMonth = Maybe.fromMaybe "unknown" (Map.lookup numberOfMonth months) 

    putStrLn ("The name of the month is: " ++ nameOfMonth) 

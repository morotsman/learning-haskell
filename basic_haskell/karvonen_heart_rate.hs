import Text.Read

type Age = Integer
type RestingHR = Integer
type Intensity = Integer
type TargetHR = Integer

targetHeartRate :: Age -> RestingHR -> Intensity -> TargetHR
targetHeartRate a r i = 
    let intensity = (fromIntegral i) / 100
        age = fromIntegral a
        restingHR = fromIntegral r
    in round $ (((220 - age) - restingHR) * intensity) + restingHR

formatHeader :: String
formatHeader = "Intensity   | Rate"

formatRow :: (Intensity,TargetHR) -> String
formatRow (i,t) = show i ++ "%         | " ++ show t ++ " bpm" 

formatTable :: [(Intensity,TargetHR)] -> [String]
formatTable = fmap formatRow

getInteger :: String -> IO Integer
getInteger message = do
    putStrLn message
    input <- fmap readMaybe getLine
    case input of 
        Just(a) -> return a
        Nothing -> getInteger message 


main = do
    restingPulse <- getInteger "Resting pulse:"
    age <- getInteger "Age:"

    let intensityAndTargetHeartRate = formatTable $ fmap (\i -> (i, targetHeartRate age restingPulse i)) [55,60..95] 

    putStrLn formatHeader
    mapM_ putStrLn intensityAndTargetHeartRate 
    



import Data.Char
import InputHelper

data TemperatureFormat = Celsius | Fahrenheit deriving (Show, Read, Ord, Eq, Bounded, Enum)

getFormatChoice :: IO TemperatureFormat
getFormatChoice = do
    putStrLn "Your choice: "
    choice <- fmap (map toLower) getLine
    if choice == "c" then 
        return Celsius 
    else if choice == "f" then
        return Fahrenheit
    else
        getFormatChoice

celsiusToFahrenheit :: Float -> Float
celsiusToFahrenheit c = (c*9/5) + 32

fahrenheitToCelsius :: Float -> Float
fahrenheitToCelsius f = (f-32)*5/9

main = do
    putStrLn "Press C to convert from Fahrenheit to Celsius."
    putStrLn "Pres F to convert from Celsius to Fahrenheit."
    choice <- getFormatChoice

    let convertFrom = if choice == Celsius then Fahrenheit else Celsius    
    temperature <- getNumericLine $ "Please enter the temperature in " ++ show convertFrom
    
    let convertedTemperature = if choice == Celsius then 
                                   fahrenheitToCelsius(temperature)
                               else 
                                   celsiusToFahrenheit(temperature) 

    putStrLn ("The temperature in " ++ show(choice) ++ " is " ++ show(convertedTemperature) ++ ".") 

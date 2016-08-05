import InputHelper


bmiCalculator :: Float -> Float -> Float
bmiCalculator weight height = weight/height^2


main = do
    weight <- getNumericLine "What is your weight? "
    height <- getNumericLine "What is your length? "

    let bmi = bmiCalculator weight height   

    putStrLn $ "Your bmi is " ++ show bmi
    
    let message = if bmi < 18.5 then
                      "You are underweigth."
                  else if bmi > 25 then
                      "You are overweight."
                  else
                      "You are normal."    

    putStrLn message




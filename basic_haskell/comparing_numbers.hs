import InputHelper

main = do
    firstNumber <- getIntegerLine "Enter the first number: "
    secondNumber <- getIntegerLine "Enter the second number: "
    thirdNumber <- getIntegerLine "Enter thirdNumber: "

    let maxNumber = maximum [firstNumber,secondNumber,thirdNumber]



    putStrLn $ "The largest number is " ++ show maxNumber

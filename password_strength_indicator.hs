import InputHelper
import Data.Char

data Strength = VeryWeek | Week | Normal | Strong | VeryStrong 

instance Show Strength where
    show VeryWeek = "very week"
    show Week = "week"
    show Normal = "normal"
    show Strong = "strong"
    show VeryStrong = "very strong"


veryWeek :: String -> Bool
veryWeek password = (all isDigit password) && (length password < 8)

weekPassword :: String -> Bool
weekPassword password = (all isLetter password) && (length password < 8)

isNormalLetter :: Char -> Bool
isNormalLetter letter = elem letter ['a'..'z'] || elem letter ['A'..'Z']

hasLetter :: String -> Bool
hasLetter = any isNormalLetter

hasDigit :: String -> Bool
hasDigit = any isDigit

strongPassword :: String -> Bool
strongPassword password = hasLetter password && hasDigit password && (length password >= 8)

isSpecialLetter :: Char -> Bool
isSpecialLetter letter = (isNormalLetter letter == False) && (isDigit letter == False) 

hasSpecialCharacter :: String -> Bool
hasSpecialCharacter = any isSpecialLetter 

veryStrong :: String -> Bool
veryStrong password = hasLetter password && hasDigit password && hasSpecialCharacter password && (length password >= 8) 

passwordValidator :: String -> Strength
passwordValidator password 
        | veryWeek password = VeryWeek
        | weekPassword password = Week
        | veryStrong password = VeryStrong
        | strongPassword password = Strong
        | otherwise = Normal


main = do
    password <- getStringLine "Enter password: "
    putStrLn ("The password " ++ password ++ " is a " ++ show (passwordValidator password) ++ " password.") 

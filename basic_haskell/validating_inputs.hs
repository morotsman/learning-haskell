import InputHelper
import Data.Char

type FirstName = String 
type LastName = String
type ZipCode = String
type EmployeeId = String


hasValue :: String -> Bool
hasValue value = length value > 0

hasValidName :: String -> Bool
hasValidName name = length name >= 2

validateName :: String -> String -> String
validateName name kind
     | hasValue name /= True = "The " ++ kind ++ " must be filled in."
     | hasValidName name /= True = name ++ " is not a valid " ++ kind ++ ". It is too short."
     | otherwise = ""   


hasValidEmployeeId :: String -> Bool
hasValidEmployeeId eId = length eId == 7 && 
                         isLetter (eId !! 0) &&
                         isLetter (eId !! 1) &&
                         (eId !! 2) == '-' &&
                         all isDigit (drop 3 eId)
 
validateEmployeeID :: String -> String
validateEmployeeID id 
    | hasValue id /= True = "The employee id must be filled in."
    | hasValidEmployeeId id /= True = id ++ " is not a valid ID."
    | otherwise = ""    

hasValidZipCode :: String -> Bool
hasValidZipCode = all isDigit

validateZipCode :: String -> String
validateZipCode zipCode 
    | hasValue zipCode /= True = "The zip code must be filled in."
    | hasValidZipCode zipCode /= True = "The zip code must be numeric."
    | otherwise = ""

validateInput :: FirstName -> LastName -> ZipCode -> EmployeeId -> [String]
validateInput firstName lastName zipCode employeeId = 
    let firstNameValidation = validateName firstName "first name"
        lastNameValidation  = validateName lastName  "last name"
        employeeIdValidation = validateEmployeeID employeeId
        zipCodeValidation = validateZipCode zipCode 
    in filter hasValue [firstNameValidation, lastNameValidation, employeeIdValidation, zipCodeValidation]


main = do
    firstName <- getStringLine "Enter the first name: "
    lastName <- getStringLine "Enter the last name: "
    zipCode <- getStringLine "Enter the ZIP code: "
    employeeId <- getStringLine "Enter an emplyee ID: "

    let validationMessages = validateInput firstName lastName zipCode employeeId
    if length validationMessages == 0 then
        putStrLn "There where no errors found."
    else
        putStrLn (show validationMessages)

main = do
    putStrLn "What is the length of the room in feet?"
    length <- getLine
    putStrLn "What is the width f the room in feet?"
    width <- getLine

    let areaInFeet = read(length) * read(width)
    let areaInMeters = areaInFeet * 0.09290304

    putStrLn ("You entered dimensions of " ++ length ++ " feet by " ++ width ++ " feet")
    putStrLn ("The are is")
    putStrLn (show (areaInFeet) ++ " square feet")
    putStrLn (show (areaInMeters) ++ " square meters")    



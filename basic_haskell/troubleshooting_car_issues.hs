import Text.Read
import Data.Maybe as Maybe

data Answer = N | Y deriving (Show, Read, Eq, Ord, Enum)

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

getAnswer :: String -> IO Answer
getAnswer message = do
    putStrLn message
    inputS <-  getLine
    let maybeAnswer = readMaybe inputS :: Maybe Answer
    case maybeAnswer of Just(a) -> return a
                        Nothing -> getAnswer message 


traverseTree :: Tree(String) -> IO ()
traverseTree tree = do
    case tree of Node(a) EmptyTree EmptyTree -> 
                     putStrLn a
                 Node(a) EmptyTree right -> do 
                     answer <- getAnswer a
                     if answer == Y then putStrLn "Sorry can't help you."
                     else traverseTree right
                 Node(a) left EmptyTree -> do
                     answer <- getAnswer a
                     if answer == Y then traverseTree left
                     else putStrLn "Sorry can't help you."
                 Node(a) left right -> do
                     answer <- getAnswer a
                     if answer == Y then traverseTree left
                     else traverseTree right

main = do

    let decisionTree = Node "Is the car silient when you turn the key?" 
                           (Node "Are the battery terminals corroded?"
                               (Node "Clean terminals and try again." EmptyTree EmptyTree)
                               (Node "Replace cables and try again." EmptyTree EmptyTree))
                           (Node "Does the car make a clicking noise?" 
                               (Node "Replace the battery." EmptyTree EmptyTree)  
                               (Node "Does the car crank up but fails to start?"
                                   (Node "Check spark plug connections" EmptyTree EmptyTree)
                                   (Node "Does the engine start and the die?"
                                        (Node "Does your care have fuel injection?"
                                            (Node "Get it in for service" EmptyTree EmptyTree)
                                            (Node "Check to ensure the choke is opening and closing" EmptyTree EmptyTree))
                                        EmptyTree)))
    
    traverseTree decisionTree

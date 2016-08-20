type Table = [(Int,Int,Int)] 


generateTable :: Int -> Int -> Table
generateTable table limit = [(table,a,table*a) | a <- [0..limit]]

generateTables :: Int -> Int -> [Table]
generateTables limitTables limit = [generateTable a limit | a <- [0..limitTables] ]
 
formatRow :: (Int,Int,Int) -> String
formatRow (a,b,result) = do
    show a ++ "*" ++ show b ++ "=" ++ show result  

formatTable :: Table -> [String]
formatTable = fmap formatRow

formatTables :: [Table] -> [[String]]
formatTables = fmap formatTable 

renderTable :: [String] -> IO ()
renderTable = mapM_ putStrLn

renderTables :: [[String]] -> IO ()
renderTables = mapM_ renderTable

main = do 
    renderTables $ formatTables $ generateTables 12 12   


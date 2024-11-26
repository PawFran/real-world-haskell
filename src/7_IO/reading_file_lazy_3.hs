import Data.Char(toUpper)

main :: IO ()
main = do 
            input <- readFile "quux.txt"
            writeFile "output.txt" (map toUpper input)
            putStrLn "done"
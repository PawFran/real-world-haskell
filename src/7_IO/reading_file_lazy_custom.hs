import Data.Char(toUpper)
import System.Environment
import Control.Monad(when)
import System.Exit

main =  do
        args <- getArgs
        
        when (length args /= 1) $ do
                putStrLn "Syntax: reading_file_lazy.hs filename"
                exitFailure
        
        let file_name = head args
        
        inpStr <- readFile file_name

        writeFile "output.txt" (processData inpStr)

processData :: String -> String
processData = map toUpper

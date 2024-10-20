import System.IO
import System.Environment
import Data.Char (toUpper)
import GHC.Driver.Session (outputFile)

-- import Prelude hiding (readFile, getLine, writeFile)
-- import System.IO.Encoding
-- import Data.Encoding.UTF8

main :: IO ()
main =  do
        a :: [String] <- getArgs

        let file_name = head a
        putStrLn $ "reading " ++ file_name

        inputHandle <- openFile file_name ReadMode
        outputHandle <- openFile "output.txt" WriteMode
        --    hSetEncoding inputHandle utf8

        inputStr <- hGetContents inputHandle
        let result = procesData inputStr

        hPutStr outputHandle result

        hClose inputHandle
        hClose outputHandle

        putStrLn "finished"


procesData :: String -> String
procesData = map toUpper

import System.IO
import Data.Char (toUpper)

-- import Prelude hiding (readFile, getLine, writeFile)
-- import System.IO.Encoding
-- import Data.Encoding.UTF8

main :: IO ()
main = do
       putStrLn "what file you want to read ?"
       file_name <- getLine

       inh <- openFile file_name ReadMode
    --    hSetEncoding inh utf8
       outh <- openFile "output.txt" WriteMode
       
       mainloop inh outh
       
       hClose inh
       hClose outh


mainloop :: Handle -> Handle -> IO ()
mainloop inh outh = 
    do
        endOfInFile <- hIsEOF inh
        if endOfInFile
            then return ()
        else do 
                inpStr <- hGetLine inh
                hPutStrLn outh (map toUpper inpStr)
                mainloop inh outh

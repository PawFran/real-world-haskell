import Data.Char(toUpper)

-- run this file from command line like:
    -- runghc reading_files_lazy_4.hs < input.txt > output.txt
        -- where input/output are stdin/stdout
    -- without output it will be printed on the screen
    -- without input in will interactively wait for user input in the loop
main :: IO () 
main =  interact (map toUpper)

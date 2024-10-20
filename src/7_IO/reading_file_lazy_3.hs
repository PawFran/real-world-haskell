import Data.Char(toUpper)

-- run this file from command line like (gitbash)
-- runghc reading_files_lazy_3.hs < input.txt > output.txt
-- where input/output are stdin/stdout
-- ex without providing out it will be printed onto screen

main :: IO () =  do
                    interact (map toUpper)

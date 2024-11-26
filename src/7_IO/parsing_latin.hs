import Data.List.Split (splitOn)
import Control.Monad(when)
import System.Exit(exitFailure)
import GHC.IO.Encoding (setLocaleEncoding, utf8)

data DictionaryRecord = DictionaryRecord
                        {
                            header :: String,
                            example :: String,
                            translations :: [String]
                        } deriving Show

-- example input
-- "impĕro, impĕrāre, imperāvī, imperātum [verb] [I]\n(Rogantibus potius quam imperantibus paremus)\n1. rozkazywać, dowodzić\n2. rządzić (nad) (+ dat)"
-- example output
-- DictionaryRecord {header = "impĕro, impĕrāre, imperāvī, imperātum [verb] [I]", 
--                   example = "(Rogantibus potius quam imperantibus paremus)",
--                   translations = ["1. rozkazywać, dowodzić", "2. rządzić (nad) (+ dat)"]
--                  }
-- TODO write tests
rawEntryToDictionaryRecord :: String -> DictionaryRecord
rawEntryToDictionaryRecord s = let x = lines s
                               in DictionaryRecord {
                                   header = x !! 0,
                                   example = x !! 1,
                                   translations = drop 2 x
                               }

main :: IO ()
main = do
    setLocaleEncoding utf8
    raw <- readFile "src/7_IO/latin.txt" 
    let entriesRaw :: [String] -- each entry (group of lines) is a single element of the list
        entriesRaw = splitOn "\n\n" raw

    when (any null entriesRaw) $ do
                putStrLn "problems with parsing"
                exitFailure

    let dictionary = map rawEntryToDictionaryRecord entriesRaw

    putStrLn $ "parsed " ++ show (length entriesRaw) ++ " records"
    putStrLn "printing first two records"
    print $ take 2 dictionary

main :: IO () 
main =  do
            interact (unlines . filter (elem 'f') . lines)

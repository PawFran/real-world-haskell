main :: IO () 
main =  interact (unlines . filter (elem 'f') . lines)

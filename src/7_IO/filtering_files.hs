

main :: IO () =  do
                    interact (unlines . filter (elem 'f') . lines)

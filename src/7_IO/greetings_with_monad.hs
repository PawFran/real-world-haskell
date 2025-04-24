-- >> is for sequencing actions
-- >>= is for the same but with assigning output to the second action

main ::  IO ()
main =  putStrLn "What's your name ?" >>
        getLine >>= (\x -> putStrLn ("hello " ++ x))

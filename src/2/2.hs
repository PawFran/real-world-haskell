add a b = a + b

myDrop n xs = if n <=0 || null xs
              then xs
              else myDrop (n-1) (tail xs)

lastButOne xs = last $ take 2 $ reverse xs
import Data.Char (digitToInt)
import Data.List (foldl', groupBy)

-- 1
safeHead :: [a] -> Maybe a
safeHead xs | null xs   = Nothing
            | otherwise = Just (head xs)

safeTail :: [a] -> Maybe [a]
safeTail (x:xs) | null xs   = Nothing
                | otherwise = Just (tail xs)

safeLast :: [a] -> Maybe a
safeLast xs | null xs   = Nothing
            | otherwise = Just (last xs)

safeInit :: [a] -> Maybe [a]
safeInit xs | null xs   = Nothing
            | otherwise = Just (init xs)

-- 2
--Write a function splitWith that acts similarly to words but takes a predicate and a
--list of any type, and then splits its input list on every element for which the predicate
--returns False:

-- splitWith :: (a -> Bool) -> [a] -> [[a]]
-- splitWith _ [] = []
-- splitWith p (x:xs) | p x       = ...
--                    | otherwise = ...

-- splitWith odd [1] == []
-- splitWith odd [2] == [[2]]
-- splitWith odd [2, 1, 2] == [[2], [2]]
-- splitWith odd [1, 2, 2, 3, 4, 5, 5, 6, 6] == [[2, 2], [4], [6, 6]]

-- myWords "the quick brown fox" == ["the","quick","brown","fox"]
-- myWords "the quick      brown fox" == ["the","quick","brown","fox"]
myWords [] = []
myWords xs = fst t : myWords (drop 1 (snd t))
                where t = break (== ' ') xs



-- 1 digit to int using fold
asIntFold :: String -> Int
asIntFold "-"       = error "asIntFold: not a number"
asIntFold ""        = error "asIntFold: empty string"
asIntFold ('-':xs)  = (-1) * asIntFold xs
asIntFold str       = foldl' (\x y -> 10*x + digitToInt y) 0 str

concatFold :: [[a]] -> [a]
concatFold = foldr (++) []

takeWhileRec :: (a -> Bool) -> [a] -> [a]
takeWhileRec _ [] = []
takeWhileRec p (x:xs)   | p x       = x : takeWhileRec p xs
                        | otherwise = []

takeWhileFold :: (a -> Bool) -> [a] -> [a]
takeWhileFold p xs = foldr step [] xs
                        where step x ys | p x       = x : ys
                                        | otherwise = []

anyFold :: (a -> Bool) -> [a] -> Bool
anyFold p xs = foldr step False xs
                where step x b | p x        = True
                               | otherwise  = b


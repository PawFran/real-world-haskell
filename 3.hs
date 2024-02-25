import Data.List

-- exercises
-- 1 & 2 
len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs

-- 3
mean :: [Double] -> Double
mean [] = 0
mean xs = sum xs / fromIntegral(length xs)

-- 4
makePalindrome :: [a] -> [a]
makePalindrome []       = []
makePalindrome (x:xs)   = [x] ++ makePalindrome xs ++ [x]

-- 5
isPalindrome :: Eq a => [a] -> Bool
isPalindrome []                 = True
isPalindrome (_:xs) | null xs   = True
isPalindrome xs                 = head xs == last xs && isPalindrome (allButFirstAndLast xs)
                                  where allButFirstAndLast xs = allButLast (tail xs)
                                        allButLast xs = take (length xs - 1) xs
-- test isPalindrome [] && isPalindrome [1] && not (isPalindrome [1, 2]) && (isPalindrome [1, 2, 1])

-- 6
listSort lst = sortBy (\xs ys -> compare (length xs) (length ys)) lst
-- test listSort [ [1..3], [1..4], [1], [] ]

-- 8
-- this version works only on Strings
intersperse :: a -> [[a]] -> [a]
intersperse c []                    = []
intersperse c xs | length xs == 1   = head xs
intersperse c (x:xs)                = x ++ [c] ++ Main.intersperse c xs
-- test Main.intersperse ',' ["qwerty", "asd"] == "qwerty,asd" && Main.intersperse ',' [] == []

-- 9
data Tree a = Node a (Tree a) (Tree a)
    | Empty
    deriving (Show)

-- treeHeight :: Tree -> Int
treeHeight Empty                = 0
treeHeight (Node a sub1 sub2)   = 1 + max (treeHeight sub1) (treeHeight sub2)

trivialTree     = Node "node" Empty Empty
simpleTree      = Node "parent" (Node "left child" Empty Empty) (Node "right child" Empty Empty)
moreComplexTree = Node "top" (Node "left" Empty Empty) (Node "right" Empty simpleTree)
-- test treeHeight Empty == 0 && treeHeight trivialTree == 1 && treeHeight simpleTree == 2 && treeHeight moreComplexTree == 4

-- 10
data Direction = Left | Right | Straight 
                 deriving (Show, Eq)

-- 11 TODO finish and test
data Point = Point {x :: Double, y :: Double} deriving Show

-- what if deltaX is 0 ?
slope :: Point -> Point -> Double
slope p1 p2 = deltaY p1 p2 / deltaX p1 p2
              where deltaX p1 p2 = x p2 - x p1
                    deltaY p1 p2 = y p2 - y p1

whichDirection :: Point -> Point -> Point -> Direction
whichDirection p1 p2 p3 | slope p1 p2 == slope p2 p3  = Main.Straight
                        | slope p1 p2 <  slope p2 p3  = Main.Right
                        | slope p1 p2 >  slope p2 p3  = Main.Left
-- test whichDirection (Point 0 0) (Point 2 1) (Point 4 2) == Main.Straight && 
--      whichDirection (Point 0 0) (Point 2 1) (Point 4 1) == Main.Right && 
--      whichDirection (Point 0 0) (Point 2 1) (Point 4 1.5) == Main.Right && 
--      whichDirection (Point 0 0) (Point 2 1) (Point 4 3) == Main.Left

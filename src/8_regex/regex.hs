import Text.Regex.Posix

-- for Bool it returns True/False info whether there's matching or not
"my left foot" =~ "foo" :: Bool
("your right hand" =~ "bar" :: Bool) == False
"your right hand" =~ "(hand|foot)" :: Bool

-- for Int it give number of matches
("a star called henry" =~ "planet" :: Int) == 0
("honorificabilitudinitatibus" =~ "[aeiou]" :: Int) == 13

-- for String it returns first substring that matches
("I, B. Ionsonii, uurit a lift'd batch" =~ "(uu|ii)" :: String) == "ii"
("hi ludi, F. Baconis nati, tuiti orbi" =~ "Shakespeare" :: String) == ""

-- for [String] it returns all matching strings
("I, B. Ionsonii, uurit a lift'd batch" =~ "(uu|ii)" :: [String]) == ["ii","uu"]
("hi ludi, F. Baconis nati, tuiti orbi" =~ "Shakespeare" :: [String]) == []

let pat = "(foo[a-z]*bar|quux)"

-- three matches: before pattern, pattern matched, after pattern
("before foodiebar after" =~ pat :: (String,String,String)) == ("before ","foodiebar"," after")
("no match here" =~ pat :: (String,String,String)) == ("no match here", "", "")

-- fourth is list of all groups
("before foodiebar after" =~ pat :: (String,String,String,[String])) == ("before ","foodiebar"," after",["foodiebar"])

-- starting offset and its length
("before foodiebar after" =~ pat :: (Int,Int)) == (7, 9)
-- all such matches
("i foobarbar a quux" =~ pat :: [(Int,Int)]) == [(2,9),(14,4)]
("eleemosynary" =~ pat :: (Int,Int)) == (1, 0)
("mondegreen" =~ pat :: [(Int,Int)]) == []

-- POSIX regex style is greedy
("foooooo" =~ ("foo|fo*")) == "foooooo"

import Text.Regex.Posix

main :: IO ()
main = do
    -- for Bool it returns True/False info whether there's matching or not
    print $ ("my left foot" =~ "foo" :: Bool)
    print $ ("your right hand" =~ "bar" :: Bool) == False
    print $ ("your right hand" =~ "(hand|foot)" :: Bool)

    -- for Int it give number of matches
    print $ ("a star called henry" =~ "planet" :: Int) == 0
    print $ ("honorificabilitudinitatibus" =~ "[aeiou]" :: Int) == 13

    -- for String it returns first substring that matches
    print $ ("I, B. Ionsonii, uurit a lift'd batch" =~ "(uu|ii)" :: String) == "ii"
    print $ ("hi ludi, F. Baconis nati, tuiti orbi" =~ "Shakespeare" :: String) == ""

    -- for [String] it returns all matching strings
    print $ ("I, B. Ionsonii, uurit a lift'd batch" =~ "(uu|ii)" :: [String]) == ["ii","uu"]
    print $ ("hi ludi, F. Baconis nati, tuiti orbi" =~ "Shakespeare" :: [String]) == []

    let pat = "(foo[a-z]*bar|quux)"

    -- three matches: before pattern, pattern matched, after pattern
    print $ ("before foodiebar after" =~ pat :: (String,String,String)) == ("before ","foodiebar"," after")
    print $ ("no match here" =~ pat :: (String,String,String)) == ("no match here", "", "")

    -- fourth is list of all groups
    print $ ("before foodiebar after" =~ pat :: (String,String,String,[String])) == ("before ","foodiebar"," after",["foodiebar"])

    -- starting offset and its length
    print $ ("before foodiebar after" =~ pat :: (Int,Int)) == (7, 9)
    -- all such matches
    print $ ("i foobarbar a quux" =~ pat :: [(Int,Int)]) == [(2,9),(14,4)]
    print $ ("eleemosynary" =~ pat :: (Int,Int)) == (1, 0)
    print $ ("mondegreen" =~ pat :: [(Int,Int)]) == []

    -- POSIX regex style is greedy
    print $ ("foooooo" =~ ("foo|fo*")) == "foooooo"

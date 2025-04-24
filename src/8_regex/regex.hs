import Text.Regex.TDFA

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

    -- for some types like [String] one has to use AllTextMatches and unwrap it using 'let'
    let AllTextMatches substrings = "I, B. Ionsonii, uurit a lift'd batch" =~ "(uu|ii)" :: AllTextMatches [] String
    print (substrings == ["ii", "uu"])
    
    let AllTextMatches substrings2 = "hi ludi, F. Baconis nati, tuiti orbi" =~ "Shakespeare" :: AllTextMatches [] String
    print (substrings2 == [])

    let pat = "(foo[a-z]*bar|quux)"

    -- three matches: before pattern, pattern matched, after pattern
    print $ ("before foodiebar after" =~ pat :: (String,String,String)) == ("before ","foodiebar"," after")
    print $ ("no match here" =~ pat :: (String,String,String)) == ("no match here", "", "")

    -- fourth is list of all groups
    print $ ("123-45-6789" =~ "([0-9]{3})-([0-9]{2})-([0-9]{4})" :: (String, String, String, [String])) == ("", "123-45-6789", "", ["123", "45", "6789"])

    -- starting offset and its length
    print $ ("before foodiebar after" =~ pat :: (Int,Int)) == (7, 9)
    print $ ("eleemosynary" =~ pat :: (Int,Int)) == (-1, 0)

    -- all such matches
    let AllMatches offsetLength = "i foobarbar a quux" =~ pat :: AllMatches [] (MatchOffset, MatchLength)
    print $ (offsetLength == [(2,9),(14,4)])
    
    let AllMatches offsetLength2 = "mondegreen" =~ pat :: AllMatches [] (MatchOffset, MatchLength)
    print $ (offsetLength2 == [])

    -- greedy
    print $ ("foooooo" =~ ("foo|fo*")) == "foooooo"

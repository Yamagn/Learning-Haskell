import Data.List
import Data.Char
import qualified Data.Map as Map

main = do
    print $ wordNums "we wa wee wa"
    print $ "art" `isIn` "party"
    print $ encode 3 "hey mark"
    print $ decode 3 "kh|#pdun"
    print $ firstTo40
    print $ firstTo 27
    print $ Map.lookup "betty" phoneBook
    print $ Map.lookup "grace" phoneBook
    let newBook = Map.insert "grace" "341-9021" phoneBook
    print $ Map.lookup "grace" newBook
    print $ Map.size phoneBook
    print $ string2digits "948-9282"
    let intBook = Map.map string2digits phoneBook
    print $ Map.lookup "betty" intBook

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

phoneBook :: Map.Map String String
phoneBook = Map.fromList $
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("patsy", "493-2928")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ]

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs)
    | key == k = Just v
    | otherwise = findKey key xs

findKey' :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey' key xs = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing xs

string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit


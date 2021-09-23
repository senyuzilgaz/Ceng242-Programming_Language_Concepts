module PE2 where

---------------------------------------------------------------------------------------------
------------------------- DO NOT CHANGE ABOVE OR FUNCTION SIGNATURES-------------------------
--------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
--------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
---------------------------------------------------------------------------------------------

-- Note: undefined is a value that causes an error when evaluated. Replace it with
-- a viable definition! Name your arguments as you like by changing the holes: _

--------------------------
-- Part I: Time to inf up!

-- naturals: The infinite list of natural numbers. That's it!
naturals :: [Integer]
naturals = [0..]

-- interleave: Interleave two lists, cutting off on the shorter list.
interleave :: [a] -> [a] -> [a]
interleave [] _ = []
interleave _ [] = []
interleave (xs:x) (ys:y) = [xs,ys]++ interleave x y

-- integers: The infinite list of integers. Ordered as [0, -1, 1, -2, 2, -3, 3, -4, 4...].
integers :: [Integer]
integers = interleave naturals [-1,-2..]

--------------------------------
-- Part II: SJSON Prettification

-- splitOn: Split string on first occurence of character.
addtup :: (String, String) -> (String, String) -> (String, String)
addtup (x, y) (a,b) = (x ++ a, y ++ b)
splitOn :: Char -> String -> (String, String)
splitOn _ "" = ("", "")
splitOn c (x:xs)
    |x==c = ("", xs)
    |otherwise = addtup ([x], "") (splitOn c xs)
    --addtup (x, "") (splitOn(c xs) )

-- tokenizeS: Transform an SJSON string into a list of tokens.
tokenizeS :: String -> [String]
tokenizeS "" = []
tokenizeS (xs:x) 
    | xs=='{' = ([[xs]] ++ (tokenizeS x))
    | xs=='}' = ([[xs]] ++ (tokenizeS x))
    | xs==',' = ([[xs]] ++ (tokenizeS x))
    | xs==':' = ([[xs]] ++ (tokenizeS x))
    | xs=='\'' = [fst(splitOn '\'' x)]++ (tokenizeS (snd(splitOn '\'' x)))
    | otherwise =tokenizeS x

-- prettifyS: Prettify SJSON, better tokenize first!
tt :: String -> [String]
tt "" = []
tt (xs:x) 
    | xs=='{' = ([[xs]] ++ (tt x))
    | xs=='}' = ([[xs]] ++ (tt x))
    | xs==',' = ([[xs]] ++ (tt x))
    | xs==':' = ([[xs]] ++ (tt x))
    | xs=='\'' = ["\'"]++[fst(splitOn '\'' x)]++ ["\'"] ++(tt (snd(splitOn '\'' x)))
    | otherwise =tt x
indent :: Integer -> String
indent 0 = ""
indent g = ("    " ++ indent(g-1) )

helpS :: [String] -> Integer -> String
helpS [] _ = ""
helpS (xs : x) p
    | xs=="{" = ( xs ++ "\n"++ indent(p+1) ++ helpS x (p+1)  )
    | xs=="}"= ( "\n" ++ indent(p-1) ++ xs ++ helpS x (p-1)  ) 
    | xs=="," = ( xs ++ "\n" ++ indent p ++ helpS x p )
    | xs==":" = ( xs ++ " " ++ helpS x p )
    | otherwise = ( xs ++ helpS x p )
prettifyS :: String -> String
prettifyS "" = ""
prettifyS k = helpS (tt k) 0


-- Good luck to you, friend and colleague!


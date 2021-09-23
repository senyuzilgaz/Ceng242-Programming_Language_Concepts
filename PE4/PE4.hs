module PE4 where

import Data.Maybe -- up to you if you want to use it or not

-- Generic DictTree definition with two type arguments
data DictTree k v = Node [(k, DictTree k v)] | Leaf v deriving Show

-- Lightweight Char wrapper as a 'safe' Digit type
newtype Digit = Digit Char deriving (Show, Eq, Ord) -- derive equality and comparison too!

-- Type aliases
type DigitTree = DictTree Digit String
type PhoneNumber = [Digit]


---------------------------------------------------------------------------------------------
------------------------- DO NOT CHANGE ABOVE OR FUNCTION SIGNATURES-------------------------
--------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
--------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
---------------------------------------------------------------------------------------------


----------
-- Part I:
-- Some Maybe fun! Basic practice with an existing custom datatype.

-- toDigit: Safely convert a character to a digit
toDigit :: Char -> Maybe Digit
toDigit a 
    |(a>='0' && a<='9') = Just (Digit a)
    |otherwise = Nothing

isPhoneNumber :: String -> Bool
isPhoneNumber [] = False
isPhoneNumber(x:xs) 
    | toDigit(x) == Nothing = True
    | otherwise = (isPhoneNumber xs)
    
amele :: String -> PhoneNumber
amele [] = []
amele (x:xs) = maybeToList(toDigit(x)) ++ (amele xs )
-- toDigits: Safely convert a bunch of characters to a list of digits.
--           Particularly, an empty string should fail.
toDigits :: String -> Maybe PhoneNumber
toDigits [] = Nothing
toDigits x
    | isPhoneNumber x = Nothing
    | otherwise = Just(amele x)
-----------
-- Part II:
-- Some phonebook business.
isLeaf::DigitTree -> Bool
isLeaf(Leaf _) = True
isLeaf(Node _) = False
lea :: DigitTree -> String
lea (Leaf x) = x
lea _ = "ham"
--numContacts: Count the number of contacts in the phonebook...
help:: [(Digit, DigitTree)] -> Int
help [] = 0
help(x:xs) 
    | isLeaf( snd(x) ) = 1 + help(xs)
    | otherwise = numContacts(snd(x))+help(xs)
numContacts :: DigitTree -> Int
numContacts (Leaf _ )= 1
numContacts( Node (x:xs)) = help([x]) + help(xs)

contacts :: [Digit]  -> DigitTree -> [(PhoneNumber,String)]
contacts v (Leaf x) = [(v, x)]
contacts v (Node(x:xs)) = bam v ([x]) ++ bam v xs

bam :: [Digit] ->[(Digit, DigitTree)]-> [(PhoneNumber, String)]
bam x [] = []
bam y (x:xs)
    | isLeaf(snd(x)) = [(y++[fst(x)],lea(snd(x)))] ++ bam y xs
    | otherwise = contacts (y++[fst(x)]) (snd(x)) ++ bam y xs
-- getContacts: Generate the contacts and their phone numbers in order given a tree. 
getContacts :: DigitTree -> [(PhoneNumber, String)]
getContacts x = contacts [] x

-- autocomplete: Create an autocomplete list of contacts given a prefix
-- e.g. autocomplete "32" areaCodes -> 
--      [([Digit '2'], "Adana"), ([Digit '6'], "Hatay"), ([Digit '8'], "Osmaniye")]
autocomplete :: String -> DigitTree -> [(PhoneNumber, String)]
autocomplete _ _ = []


-----------
-- Example Trees
-- Two example trees to play around with, including THE exampleTree from the text. 
-- Feel free to delete these or change their names or whatever!

exampleTree :: DigitTree
exampleTree = Node [
    (Digit '1', Node [
        (Digit '3', Node [
            (Digit '7', Node [
                (Digit '8', Leaf "Jones")])]),
        (Digit '5', Leaf "Steele"),
        (Digit '9', Node [
            (Digit '1', Leaf "Marlow"),
            (Digit '2', Node [
                (Digit '3', Leaf "Stewart")])])]),
    (Digit '3', Leaf "Church"),
    (Digit '7', Node [
        (Digit '2', Leaf "Curry"),
        (Digit '7', Leaf "Hughes")])]

areaCodes :: DigitTree
areaCodes = Node [
    (Digit '3', Node [
        (Digit '1', Node [
            (Digit '2', Leaf "Ankara")]),
        (Digit '2', Node [
            (Digit '2', Leaf "Adana"),
            (Digit '6', Leaf "Hatay"),
            (Digit '8', Leaf "Osmaniye")])]),
    (Digit '4', Node [
        (Digit '6', Node [
            (Digit '6', Leaf "Artvin")])])]


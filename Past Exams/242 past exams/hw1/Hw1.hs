module Hw1 where

type Mapping = [(String, String, String)]
data AST = EmptyAST | ASTNode String AST AST deriving (Show, Read)

writeExpression :: (AST, Mapping) -> String
evaluateAST :: (AST, Mapping) -> (AST, String)
-- DO NOT MODIFY OR DELETE THE LINES ABOVE -- 
-- IMPLEMENT writeExpression and evaluateAST FUNCTION ACCORDING TO GIVEN SIGNATURES -- 

resolveAST :: AST -> String
resolveAST (ASTNode oper leftAST rightAST)
                                        | oper == "num" = resolveAST leftAST
                                        | oper == "plus" = "(" ++ resolveAST leftAST ++ "+" ++ resolveAST rightAST ++ ")"
                                        | oper == "times" = "(" ++ resolveAST leftAST ++ "*" ++ resolveAST rightAST ++ ")"
                                        | oper == "negate" = "(-" ++ resolveAST leftAST ++ ")"
                                        | oper == "cat" = "(" ++ resolveAST leftAST ++ "++" ++ resolveAST rightAST ++ ")"
                                        | oper == "len" = "(length " ++ resolveAST leftAST ++ ")"
                                        | oper == "str" = "\"" ++ resolveAST leftAST ++ "\""
                                        | otherwise = oper

-- Modifies mapping triplet into desired format.
mapScribe :: (String, String, String) -> String
mapScribe (frst, scnd, thrd)
                            | scnd == "num" = frst ++ "=" ++ thrd
                            | scnd == "str" = frst ++ "=" ++ "\"" ++ thrd ++ "\""

-- Creates let ...in block content according to given mapping list.
resolveMap :: Mapping -> String -> String
resolveMap [] seed = "let " ++ (init seed) ++ " in "
resolveMap (head:tail) seed = resolveMap tail ( seed ++ (mapScribe head) ++ ";")

-- A helper function that changes variables with proper literals according to given mapping.
pimpMyOper :: String -> Mapping -> String
pimpMyOper myOper [] = myOper
pimpMyOper myOper ((frst, scnd, thrd):mapTail) =
                                                if myOper == frst then pimpMyOper thrd mapTail
                                                else pimpMyOper myOper mapTail

-- Solves the expression with no unknown variables.
solveAST :: AST -> Mapping -> String
solveAST (ASTNode oper leftAST rightAST) myMap
                                            | oper == "num" = solveAST leftAST myMap
                                            | oper == "plus" = show $ (+) (read (solveAST leftAST myMap)::Int) (read (solveAST rightAST myMap)::Int)
                                            | oper == "times" = show $ (*) (read (solveAST leftAST myMap)::Int) (read (solveAST rightAST myMap)::Int)
                                            | oper == "negate" = show $ (*) (-1) (read (solveAST leftAST myMap)::Int)
                                            | oper == "cat" = solveAST leftAST myMap ++ solveAST rightAST myMap
                                            | oper == "len" = show $ length $ solveAST leftAST myMap
                                            | oper == "str" = solveAST leftAST myMap
                                            | otherwise = pimpMyOper oper myMap

writeExpression (myAST, []) = resolveAST myAST
writeExpression (myAST, myMap) = (resolveMap myMap "") ++ (resolveAST myAST)

evaluateAST (myAST, myMap) = (myAST, solveAST myAST myMap)
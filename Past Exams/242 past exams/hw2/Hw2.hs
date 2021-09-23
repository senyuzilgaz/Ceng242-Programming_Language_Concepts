module Hw2 where

data ASTResult = ASTError String | ASTJust (String, String, Int) deriving (Show, Read)
data ASTDatum = ASTSimpleDatum String | ASTLetDatum String deriving (Show, Read)
data AST = EmptyAST | ASTNode ASTDatum AST AST deriving (Show, Read)

isNumber :: String -> Bool
eagerEvaluation :: AST -> ASTResult
normalEvaluation :: AST -> ASTResult
-- DO NOT MODIFY OR DELETE THE LINES ABOVE -- 
-- IMPLEMENT isNumber, eagerEvaluation and normalEvaluation FUNCTIONS ACCORDING TO GIVEN SIGNATURES -- 

helpIN :: String -> Bool
helpIN w@(x:xs) = if length w == 1 then x `elem` ['0'..'9']
                  else x `elem` ['0'..'9'] && helpIN xs

isNumber [] = False
isNumber "" = False
isNumber "-" = False
isNumber (x:xs) = if (x `elem` ['0'..'9']) then helpIN xs
                  else if (x == '-') then helpIN xs
                  else False

eagerEvaluation _ = ASTError "oops"
normalEvaluation _ = ASTError "oops"
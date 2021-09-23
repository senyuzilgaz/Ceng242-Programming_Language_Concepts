module PE3 where

data Cell = SpaceCraft Int | Sand | Rock Int | Pit deriving (Eq, Read, Show)

type Grid = [[Cell]]
type Coordinate = (Int, Int)

data Move = North | East | South | West | PickUp | PutDown deriving (Eq, Read, Show)

data Robot = Robot { name :: String,
                     location :: Coordinate,
                     capacity :: Int,
                     energy :: Int,
                     storage :: Int } deriving (Read, Show)

-------------------------------------------------------------------------------------------
--------------------------------- DO NOT CHANGE ABOVE -------------------------------------
------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
-------------------------------------------------------------------------------------------
-------------------------------------- PART I ---------------------------------------------
isInGrid :: Grid -> Coordinate -> Bool
isInGrid grid coor
    | fst(coor) < 0 || snd(coor) < 0 = False 
    | ( x > fst(coor) && y > snd(coor) ) = True
    | otherwise = False
    where
        x=length(grid !! 0)
        y=length(grid)

-------------------------------------------------------------------------------------------




rockInt :: Cell -> Int
rockInt (SpaceCraft _)  = 0
rockInt Sand = 0
rockInt Pit  = 0
rockInt (Rock i)  = i


countHelp2 :: [Cell] -> Int -> Int
countHelp2 [] _ = 0
countHelp2 y counn
    | counn >= length(y) = 0 
    | otherwise = rockInt(y !! counn) + countHelp2 y (counn+1)

countHelp :: Grid -> Int -> Int
countHelp [] _ = 0
countHelp x coun
    | coun >= length(x) = 0
    | otherwise = (countHelp2 (x!!coun)  0)  + (countHelp x (coun+1) )
    
totalCount :: Grid -> Int
totalCount [[]] = 0
totalCount x
    = countHelp x 0
-------------------------------------------------------------------------------------------
isPit:: Cell -> Bool
isPit (SpaceCraft _)  = False
isPit Sand = False
isPit Pit  = True
isPit (Rock _)  = False
conca :: Int -> [Int] -> [Coordinate]
conca a b = [(x,a) | x <- b]

cordinateHelp2 :: [Cell] -> Int -> [Int]
cordinateHelp2 [] _ = []
cordinateHelp2 y counn
    | counn >= length(y) = []
    | isPit (y !! counn) = [counn] ++ cordinateHelp2 y (counn+1)
    | otherwise = cordinateHelp2 y (counn+1)

    
cordinateHelp :: Grid -> Int -> [Coordinate]
cordinateHelp [] _ = []
cordinateHelp x coun
    | coun >= length(x) = []
    | otherwise = ( conca coun (cordinateHelp2 (x!!coun)  0)  ) ++ cordinateHelp x (coun+1) 
 
coordinatesOfPits :: Grid -> [Coordinate]
coordinatesOfPits [[]] = []
coordinatesOfPits x = cordinateHelp x 0

-------------------------------------------------------------------------------------------

tracePath :: Grid -> Robot -> [Move] -> [Coordinate]
tracePath grid robot moves = []

------------------------------------- PART II ----------------------------------------------

energiseRobots :: Grid -> [Robot] -> [Robot]
energiseRobots grid robots = robots

-------------------------------------------------------------------------------------------

applyMoves :: Grid -> Robot -> [Move] -> (Grid, Robot)
applyMoves grid robot moves = (grid, robot)

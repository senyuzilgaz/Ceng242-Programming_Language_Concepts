module PE1 where

import Text.Printf


-- This function takes a Double and rounds it to 2 decimal places as requested in the PE --
getRounded :: Double -> Double
getRounded x = read s :: Double
               where s = printf "%.2f" x

-------------------------------------------------------------------------------------------
----------------------- DO NOT CHANGE ABOVE OR FUNCTION SIGNATURES-------------------------
------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
-------------------------------------------------------------------------------------------

convertTL :: Double -> String -> Double
convertTL x "USD" = getRounded (x/8.18)
convertTL x "EUR" = getRounded (x/9.62)
convertTL x "BTC" = getRounded (x/473497.31)


-------------------------------------------------------------------------------------------

countOnWatch :: [String] -> String -> Int -> Int
countOnWatch [] b c = 0
countOnWatch (x:xs) b c
    | c==0 =0
    | x==[] =0
    | x==b =1+(countOnWatch xs b (c-1) )
    | otherwise = (countOnWatch xs b (c-1))

-------------------------------------------------------------------------------------------
tata :: Int -> Int
tata a
    | a `rem` 3==0 = a-1
    | a `rem` 4==0 = (2*a) `rem` 10
    | a `rem` 5==0 = (a+3) `rem` 10
    | otherwise = (a+4) `rem` 10

encrypt :: Int -> Int
encrypt x =( tata (x `rem` 10) + 10*tata ((x`div`10) `rem` 10) + 100*tata ((x`div`100) `rem` 10) + 1000*tata (x`div`1000)  )

-------------------------------------------------------------------------------------------
helper :: (Double, Int) -> Double
helper (num, year)
    | (year>=2)&&(num>=10000) =getRounded( num*(1+0.115/12)^(12*year) )
    | (year>=2)&&(num<10000)  =getRounded( num*(1+0.095/12)^(12*year) )
    | (year<2)&&(num>=10000)  =getRounded( num*(1+0.105/12)^(12*year) )
    | (year<2)&&(num<10000)   =getRounded( num*(1+0.090/12)^(12*year) )
 



compoundInterests :: [(Double, Int)] -> [Double]
compoundInterests x 
    = map helper x



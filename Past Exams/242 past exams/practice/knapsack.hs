module knapsack where

maxOf :: Int -> Int -> Int
maxOf a b = if a > b then a
            else b

-- In this implementation, calculation is exhaustive.
-- No memoization involved.
-- recKS weight_cap weight_arr value_arr item_count best_value
recKS :: Int -> [Int] -> [Int] -> Int -> Int
recKS 0 _ _ _ = 0
recKS _ _ _ 0 = 0
recKS w wt v n = if wt!!(n-1) > w then recKS w wt v (n-1)
                     else maxOf (v!!(n-1) + ( recKS (w-wt!!(n-1)) wt v (n-1) ) ) (recKS w wt v (n-1))

-- In this implementation, calculation is exhaustive too.
-- This time, memoization is utilized.

-- This function creates memory array.
-- Columns represent weight, rows represent item count.
-- Note that first row should be initialized with all 0.
-- e.g: [[0,0,0,0,0,0,0,0], [0], [0], [0], [0]]
-- memKS item_arr(weight, value) weight item_count memory_arr[w][n]
memKSHelper :: [(Int, Int)] -> Int -> Int -> [[Int]] -> [[Int]]
memKSHelper _ 0 _ ma = ma
memKSHelper _ _ 0 ma = ma
memKSHelper [] _ _ ma = ma
memKSHelper all@(fst:rst) w n ma = 


-- memKS item_arr(weight, value) weight_cap best_value
memKS :: [(Int, Int)] -> Int -> Int
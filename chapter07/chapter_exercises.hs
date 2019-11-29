module Chapter07Exercises where

tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

-- a) rewrite using divMod

tensDigit' :: Integral a => a -> a
tensDigit' x = d
  where xLast = fst (divMod x 10)
        d     = snd (divMod xLast 10)

-- b) Does the divMod version have the same type as the original? Yes.
-- Answer: Yes.


-- c) version for the hundreds digit
hundredsDigit :: Integral a => a -> a
hundredsDigit x = d2
  where d0    = fst (divMod x 10)
        d1    = tensDigit d0
        d2    = snd (divMod d1 10)

-- 2. Implement the function of the type a -> a -> a -> Bool -> a once
-- each using a cese expressiona and once using with a guard
foldBool :: a -> a -> Bool -> a
foldBool x _ True = x
foldBool _ y False = y

-- using case expression

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b =
  case b of
    True -> x
    False -> y

-- using guard

foldBool3 :: a -> a -> Bool -> a
foldBool3 x y b | b == True = x
                | otherwise = y

-- 3. Fill in the definition

g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c) 


{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

1. All function applications return a value. Determine the value
returned by these function applications and the type of that
value.
a) (* 9) 6
b) head [(0,"doge"),(1,"kitteh")]
c) head [(0 :: Integer ,"doge"),(1,"kitteh")]
d) if False then True else False
e) length [1, 2, 3, 4, 5]
f) (length [1, 2, 3, 4]) > (length "TACOCAT")

-- Answers:

a) Num a => a
b) Num a => (a, [Char])
c) (Integer, [Char])
d) Bool
e) Int
f) Bool

-- 2. Given
-- x = 5
-- y = x + 5
-- w = y * 10
-- What is the type of w?

w :: Num a => a
w = undefined


-- 3. Given
-- x = 5
-- y = x + 5
-- z y = y * 10
-- What is the type of z?

z :: (Num a) => a -> a
z = undefined

-- 4. Given
-- x = 5
-- y = x + 5
-- f = 4 / y
-- What is the type of f?

f :: (Fractional a) => a
f = undefined

-- 5. Given
-- x = "Julie"
-- y = " <3 "
-- z = "Haskell"
-- f = x ++ y ++ z
-- What is the type of f?

f1 :: [Char]
f1 = undefined


-- Does it compile?
-- For each set of expressions, figure out which expression, if any, causes
-- the compiler to squawk at you (n.b. we do not mean literal squawking)
-- and why. Fix it if you can.

1. bigNum = (^) 5 $ 10
wahoo = bigNum $ 10

-- ($) operator has type (a -> b) -> a -> b therefore it won't compile when it finds wahoo because bigNum as type Num a => a
-- It works in bigNum because of the partial application of (^) :: a -> (b -> a) which returns (a -> b)
-- Fixed it by changing bigNum type to Num a => a -> b
-- Answer:

bigNum x = (^) 5 $ x
wahoo = bigNum $ 10


2. x = print
y = print "woohoo!"
z = x "hello world"

-- Exercise 2 compiles normally

3. a = (+)
b = 5
c = b 10
d = c 200

-- It won't compile as b and c are not functions. The compiler considers b and c functions taking 10 and 200 as arguments respectively.
-- If the intention was to sum b and c, then we need to use the operation (+) defined in a
-- Answer:

a = (+)
b = 5
c = a b 10
d = a c 200


a = 12 + b -- It won't compile as b has not yet been defined in scope
b = 10000 * c -- It won't compile as c has not yet been defined in scope



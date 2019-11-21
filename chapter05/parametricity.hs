module Parametricity where


-- Parametricity
-- 1. Given the type a -> a, which is the type for id, attempt
-- to make a function that terminates successfully that does
-- something other than returning the same value. This is
-- impossible, but you should try it anyway.

f :: a -> a
f = \x -> x

-- or
-- f x = id x

-- 2. We can get a more comfortable appreciation of parametricity
-- by looking at a -> a -> a. This hypothetical
-- function a -> a -> a has two–and only two–implementations.
-- Write both possible versions of a -> a -> a. After
-- doing so, try to violate the constraints of parametrically
-- polymorphic values we outlined above.

g :: a -> a -> a
g x = \y -> x

-- or 
-- g x y = y

-- 3. Implement a -> b -> b. How many implementations can
-- it have? Does the behavior change when the types of 𝑎
-- and 𝑏 change?

h :: a -> b -> b
h x = \y -> y
-- or
-- h x y = y

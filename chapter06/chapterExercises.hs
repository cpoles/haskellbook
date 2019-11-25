
-- Ex. 1

data Person = Person Bool

instance Show Person where
  show _ = "Person"

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- Ex. 2

data Mood = Blah | Woot deriving (Eq, Show)

settleDown x = if x == Woot then Blah else x

-- Ex. 3

-- a 
-- Acceptable inputs are Blah | Woot as the function type is Mood -> Mood

-- b
-- It won't compile as Mood does not derive from Num

-- c
-- It won't compile as (>) operator has not been defined as instance of Ord

-- Ex 4.

type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
-- s1 wont compile as it is partially applied and with only two arguments it will return Object -> Sentence and the
-- Show typeclass does not support the function types

s2 = Sentence "Julie" "loves" "dogs" -- this will complie normally

-- Ex. 5
data Rocks = Rocks String deriving (Eq, Show)

data Yeah = Yeah Bool deriving (Eq, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Show)

-- 1
phew = Papu "chases" True -- it won't compile as it Papu constructor takes Rocks and Yeah as arguments

truth = Papu (Rocks "chomskydoz") (Yeah True) -- it will compile normally

equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p' -- it will compile as Rocks, Yeah and Papu have instances of Eq

comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p' -- it won't compile as papu have no instance of Ord

-- Match the types
-- 1
i :: Num a => a
i = 1

i :: a -- this will not compile because the compiler does not know if a is an instance of Num
i = 1

-- 2
f :: Float
f = 1.0

f :: Num a => a -- this will not compile as the compiler expects an instance for Fractional

-- 3

g :: Float
g = 1.0

g :: Fractional a => a

-- 4

h :: Float
h = 1.0

h :: RealFrac a => a -- it will compile as Real Frac has instances for Float and Double

-- 5

freud :: a -> a
freud x = x

freud :: Ord a => a -> a -- it will compile normally. As long as x has an instance for Ord a, freud will work.

-- 6 

freud' :: a -> a
freud' x = x

freud' :: Int -> Int -- it will compile. However, only Ints will work. There is no typeclass constraint more generic than Int

-- 7

myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX

sigmund :: a -> a -- it won't s it expects a generic type and not an Int. (From myX)

-- 8 

sigmund' :: Int -> Int
sigmund' x = myX

sigmund' :: Num a => a -> a -- It won;t compile as it expects a generic type and not a concrete type Int

-- 9
import Data.List

jung :: Ord a => [a] -> a
jung xs = head (sort xs)

jung :: [Int] -> Int -- this compiles and works for Int types only. Int has an instance of Ord and therefore can be sorted.

-- 10
young :: [Char] -> Char
young xs = head (sort xs)

young :: Ord a => [a] -> a -- it compiles and works for any type which has an instance of Ord

-- 11

mySort :: [Char] -> [Char]
mySort = sort -- it will only work for Char type

-- 12
signifier :: [Char] -> Char
signifier xs = head (mySort xs) -- it will work only for Char type

signifier :: Ord a => [a] -> a -- it won't compile as mySort needs a concrete type Char and the signature now has a constrained polymorphic type a.



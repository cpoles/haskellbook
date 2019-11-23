-- Write the Eq instance for the datatype provided.

data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn i) (TisAn i') = i == i'

-------------------

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two i j) (Two i' j') = (i == i') && (j == j') 

-------------------

data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt i) (TisAnInt i')     = i == i'
  (==) (TisAString s) (TisAString s') = s == s'
  (==) (TisAString _) _               = False
  (==) (TisAnInt _) _                 = False

---------

data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair x y) (Pair x' y') = (x == x') && (y == y')

---------
data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple a' b') = (a == a') && (b == b')

data Which a = ThisOne a | ThatOne a

instance (Eq a) => Eq (Which a) where 
  (==) (ThisOne a) (ThisOne a') = a == a'
  (==) (ThatOne a) (ThatOne a') = a == a'
  (==) (ThisOne _) _            = False
  (==) (ThatOne _) _            = False

----
data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a')     = a == a'
  (==) (Goodbye b) (Goodbye b') = b == b'
  (==) (Hello _) _              = False
  (==) (Goodbye _) _            = False
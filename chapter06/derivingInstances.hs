data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Wed Wed = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True

  -- (/=) undefined . It will compile with warnings

data Identity a = Identity a

  -- instance Eq (Identity a) where
  --   (==) (Identity v) (Identity v') = v == v'

-- the instance of Eq above won't compile as v and v' which are of type a have no instance of Eq. 
-- The data constructor argument of type a must have an instance of Eq to be tested for equality

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'

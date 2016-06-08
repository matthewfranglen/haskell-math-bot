{-# LANGUAGE OverloadedStrings #-}
module Apply
    (
        apply
    )
    where

import Evaluate (Expression(..))

apply :: Expression -> Integer -> Integer
apply (Constant x) _   = x
apply CurrentValue x   = x
apply (Add x y) v      = (apply x v) + (apply y v)
apply (Subtract x y) v = (apply x v) - (apply y v)
apply (Multiply x y) v = (apply x v) * (apply y v)
apply (Divide x y) v   = (apply x v) `div` (apply y v)

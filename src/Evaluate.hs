{-# LANGUAGE OverloadedStrings #-}
module Evaluate
    (
        Expression(..),
        evaluate
    )
    where

import Text.Read (readMaybe)

data Expression = CurrentValue
                | Constant Integer
                | Add Expression Expression
                | Subtract Expression Expression
                | Multiply Expression Expression
                | Divide Expression Expression

evaluate :: String -> Expression
evaluate = parse . tokenize

data Token = TVerb String
           | TConstant Integer

tokenize :: String -> [Token]
tokenize xs = map f $ words xs
    where f xs' = case readMaybe xs' :: Maybe Integer of
                    Just i  -> TConstant i
                    Nothing -> TVerb xs'

parse :: [Token] -> Expression
parse ((TVerb v):xs)                 = parseVerb v CurrentValue $ parse xs
parse ((TConstant x):(TVerb v):xs)   = parseVerb v (Constant x) $ parse xs
parse ((TConstant x):[])             = Constant x
parse []                             = CurrentValue
parse _                              = error "Unknown expression"

parseVerb :: String -> Expression -> Expression -> Expression
parseVerb v x y | v == "add"      = Add x y
                | v == "subtract" = Subtract x y
                | v == "multiply" = Multiply x y
                | v == "divide"   = Divide x y
                | otherwise       = error $ "No such verb " ++ v

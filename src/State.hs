{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
module State
    (
        State(..),
        value
    )
    where

import Control.Lens

data State = State {
        _value :: Integer
    }

makeLenses ''State

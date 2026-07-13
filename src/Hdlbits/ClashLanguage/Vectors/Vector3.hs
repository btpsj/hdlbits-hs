module Hdlbits.ClashLanguage.Vectors.Vector3 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/Vector3
topEntity ::
  "a" ::: BitVector 5 ->
  "b" ::: BitVector 5 ->
  "c" ::: BitVector 5 ->
  "d" ::: BitVector 5 ->
  "e" ::: BitVector 5 ->
  "f" ::: BitVector 5 ->
  ( "w" ::: BitVector 8,
    "x" ::: BitVector 8,
    "y" ::: BitVector 8,
    "z" ::: BitVector 8
  )
topEntity a b c d e f = (w, x, y, z)
  where
    w = a ++# slice d4 d2 b
    x = slice d1 d0 b ++# c ++# slice d4 d4 d
    y = slice d3 d0 d ++# slice d4 d1 e
    z = slice d0 d0 e ++# f ++# (0b11 :: BitVector 2)
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

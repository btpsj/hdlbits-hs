module Hdlbits.ClashLanguage.Vectors.Vector2 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/vector2
topEntity ::
  "in" ::: BitVector 32->
  "out" ::: BitVector 32
topEntity input = pack $ reverse x
  where
    x :: Vec 4 (BitVector 8)
    x = unpack input

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

module Hdlbits.ClashLanguage.Vectors.Vector4 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/Vectorr
topEntity ::
  "in" ::: BitVector 8 ->
  "out" ::: BitVector 32
topEntity input = pack x ++# input
  where
    x :: Vec 24 Bit
    x = repeat $ msb input
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

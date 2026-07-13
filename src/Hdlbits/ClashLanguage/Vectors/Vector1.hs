module Hdlbits.ClashLanguage.Vectors.Vector1 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/Wire
topEntity ::
  "in" ::: BitVector 16->
  ( "out_hi" ::: BitVector 8,
    "out_lo" ::: BitVector 8
  )
topEntity input = (slice d15 d8 input, slice d7 d0 input)
-- topEntity = split

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

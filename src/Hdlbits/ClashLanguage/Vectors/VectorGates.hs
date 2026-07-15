module Hdlbits.ClashLanguage.Vectors.VectorGates where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/Vectorgates
topEntity ::
  "a" ::: BitVector 3 ->
  "b" ::: BitVector 3 ->
  ( "out_or_bitwise" ::: BitVector 3,
    "out_or_logical" ::: Bit,
    "out_not" ::: BitVector 6
  )
topEntity a b = (outOrBitwise, outOrLogical, outNot)
  where
    outOrBitwise = a .|. b
    outOrLogical = reduceOr outOrBitwise
    outNot = pack (complement b :> complement a :> Nil)
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

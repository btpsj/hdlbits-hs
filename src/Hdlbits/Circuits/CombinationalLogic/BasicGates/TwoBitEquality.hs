module Hdlbits.Circuits.CombinationalLogic.BasicGates.TwoBitEquality where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

topEntity ::
  "A" ::: BitVector 2 ->
  "B" ::: BitVector 2 ->
  "z" ::: Bit
topEntity a b = reduceAnd . complement $ a `xor` b
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

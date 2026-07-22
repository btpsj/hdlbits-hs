module Hdlbits.Circuits.CombinationalLogic.BasicGates.TwoGates where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

topEntity :: "in1" ::: Bit -> "in2" ::: Bit -> "in3" ::: Bit -> "out" ::: Bit
topEntity in1 in2 in3 = in12 `xor` in3
  where
    in12 = complement $ in1 `xor` in2
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

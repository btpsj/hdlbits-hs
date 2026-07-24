module Hdlbits.Circuits.CombinationalLogic.BasicGates.SimpleCircuitB where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

circuitB :: Bit -> Bit -> Bit
circuitB = (complement .) . xor

topEntity ::
  "x" ::: Bit ->
  "y" ::: Bit ->
  "z" ::: Bit
topEntity = circuitB
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

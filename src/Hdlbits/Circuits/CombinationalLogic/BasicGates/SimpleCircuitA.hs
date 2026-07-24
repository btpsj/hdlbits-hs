module Hdlbits.Circuits.CombinationalLogic.BasicGates.SimpleCircuitA where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- z = (x ^ y) & x  ==  x & ~y
circuitA :: Bit -> Bit -> Bit
circuitA = (. complement) . (.&.)

topEntity ::
  "x" ::: Bit ->
  "y" ::: Bit ->
  "z" ::: Bit
topEntity = circuitA
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

module Hdlbits.Circuits.CombinationalLogic.BasicGates.CombineCircuits where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude
import Hdlbits.Circuits.CombinationalLogic.BasicGates.SimpleCircuitA (circuitA)

circuitB :: Bit -> Bit -> Bit
circuitB = (complement .) . xor

topEntity ::
  "x" ::: Bit ->
  "y" ::: Bit ->
  "z" ::: Bit
topEntity x y = z
  where
    a = circuitA x y
    b = circuitB x y
    aOrB = a .|. b
    aAndB = a .&. b
    z = aOrB `xor` aAndB
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

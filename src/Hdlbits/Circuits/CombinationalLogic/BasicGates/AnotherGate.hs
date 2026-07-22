module Hdlbits.Circuits.CombinationalLogic.BasicGates.AnotherGate where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

topEntity :: "in1" ::: Bit -> "in2" ::: Bit -> "out" ::: Bit
topEntity in1 in2 = in1 .&. complement in2
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

module Hdlbits.Circuits.CombinationalLogic.BasicGates.Wire where

import Clash.Prelude
import Clash.Annotations.TH (makeTopEntityWithName)

topEntity :: "in" ::: Bit -> "out" ::: Bit
topEntity x = x

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

module Hdlbits.Circuits.CombinationalLogic.BasicGates.Gnd where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

topEntity :: "out" ::: Bit
topEntity = low
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

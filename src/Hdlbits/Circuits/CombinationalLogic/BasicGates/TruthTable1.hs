module Hdlbits.Circuits.CombinationalLogic.BasicGates.TruthTable1 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

topEntity ::
  "x1" ::: Bit ->
  "x2" ::: Bit ->
  "x3" ::: Bit ->
  "f" ::: Bit
topEntity x1 x2 x3 = case pack (x1, x2, x3) of
  $(bitPattern "000") -> 0
  $(bitPattern "100") -> 0
  $(bitPattern "010") -> 1
  $(bitPattern "110") -> 1
  $(bitPattern "001") -> 0
  $(bitPattern "101") -> 1
  $(bitPattern "011") -> 0
  $(bitPattern "111") -> 1
  _ -> 1
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

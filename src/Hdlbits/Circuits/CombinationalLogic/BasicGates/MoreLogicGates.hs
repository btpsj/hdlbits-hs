module Hdlbits.Circuits.CombinationalLogic.BasicGates.MoreLogicGates where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

topEntity ::
  "a" ::: Bit ->
  "b" ::: Bit ->
  (
    "out_and" ::: Bit,
    "out_or" ::: Bit,
    "out_xor" ::: Bit,
    "out_nand" ::: Bit,
    "out_nor" ::: Bit,
    "out_xnor" ::: Bit,
    "out_anotb" ::: Bit
  )
topEntity a b = (outAnd, outOr, outXor, outNand, outNor, outXnor, outAnotB)
  where
    outAnd = a .&. b
    outOr = a .|. b
    outXor = a `xor` b
    outNand = complement outAnd
    outNor = complement outOr
    outXnor = complement outXor
    outAnotB = a .&. complement b
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

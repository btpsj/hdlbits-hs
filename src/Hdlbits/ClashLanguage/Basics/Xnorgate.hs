module Hdlbits.ClashLanguage.Basics.Xnorgate where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/Xnorgate
topEntity ::
  "a" ::: Bool ->
  "b" ::: Bool ->
  "out" ::: Bool
topEntity a b = not $ a `xor` b
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

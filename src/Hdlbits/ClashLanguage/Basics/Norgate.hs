module Hdlbits.ClashLanguage.Basics.Norgate where

import Clash.Prelude
import Clash.Annotations.TH (makeTopEntityWithName)

-- https://hdlbits.01xz.net/wiki/Wire
topEntity ::
  "a" ::: Bool ->
  "b" ::: Bool ->
  "out" ::: Bool
topEntity a b = not $ a .|. b

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

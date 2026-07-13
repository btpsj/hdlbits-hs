module Hdlbits.ClashLanguage.Basics.Andgate where

import Clash.Prelude
import Clash.Annotations.TH (makeTopEntityWithName)

-- https://hdlbits.01xz.net/wiki/Wire
topEntity ::
  "a" ::: Bool ->
  "b" ::: Bool ->
  "out" ::: Bool
topEntity = (.&.)

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

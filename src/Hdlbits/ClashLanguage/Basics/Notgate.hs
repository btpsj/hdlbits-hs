module Hdlbits.ClashLanguage.Basics.Notgate where

import Clash.Prelude
import Clash.Annotations.TH (makeTopEntityWithName)

-- https://hdlbits.01xz.net/wiki/Wire
topEntity ::
  "in" ::: Bool ->
  "out" ::: Bool
topEntity = not

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

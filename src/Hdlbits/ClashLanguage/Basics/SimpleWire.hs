module Hdlbits.ClashLanguage.Basics.SimpleWire where

import Clash.Prelude
import Clash.Annotations.TH (makeTopEntityWithName)

-- https://hdlbits.01xz.net/wiki/Wire
topEntity :: "in" ::: Bit -> "out" ::: Bit
topEntity x = x

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

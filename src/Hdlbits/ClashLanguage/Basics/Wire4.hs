module Hdlbits.ClashLanguage.Basics.Wire4 where

import Clash.Prelude
import Clash.Annotations.TH (makeTopEntityWithName)

-- https://hdlbits.01xz.net/wiki/Wire
topEntity ::
  "a" ::: Bit ->
  "b" ::: Bit ->
  "c" ::: Bit ->
  (
    "w" ::: Bit,
    "x" ::: Bit,
    "y" ::: Bit,
    "z" ::: Bit
  )
topEntity a b c = (a, b, b, c)

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

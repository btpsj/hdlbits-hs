module Hdlbits.ClashLanguage.ModulesHierarchy.Module where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

modA :: Bit -> Bit -> Bit
modA in1 in2 = undefined

-- https://hdlbits.01xz.net/wiki/Vectorr
topEntity ::
  "a" ::: Bit ->
  "b" ::: Bit ->
  "out" ::: Bit
topEntity = undefined
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

module Hdlbits.ClashLanguage.Vectors.VectorR where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/Vectorr
topEntity ::
  "in" ::: Vec 8 Bit ->
  "out" ::: Vec 8 Bit
topEntity = reverse
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

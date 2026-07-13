module Hdlbits.ClashLanguage.Vectors.Vector0 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude
import Clash.Sized.Vector.ToTuple (VecToTuple(vecToTuple))

-- https://hdlbits.01xz.net/wiki/Wire
topEntity ::
  "vec" ::: Vec 3 Bool ->
  ( "outv" ::: Vec 3 Bool,
    "o2" ::: Bool,
    "o1" ::: Bool,
    "o0" ::: Bool
  )
topEntity vec = (vec, a, b, c)
  where
    (a, b, c) = vecToTuple vec
-- The following give a warning about non-exhaustive pattern matching which
-- is a known false positive
-- Can also be fixed with {-# OPTIONS_GHC -Wno-incomplete-patterns #-}
-- topEntity vec@(a :> b :> c :> Nil) = (vec, c, b, a)

{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

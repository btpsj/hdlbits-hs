module Hdlbits.ClashLanguage.Vectors.Gates4 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

reduceAnd' :: (BitPack a) => a -> Bit
reduceAnd' v = foldr (.&.) 1 (bv2v $ pack v)

reduceOr' :: (BitPack a) => a -> Bit
reduceOr' v = foldr (.|.) 1 (bv2v $ pack v)

reduceXor' :: (BitPack a) => a -> Bit
reduceXor' v = foldr xor 1 (bv2v $ pack v)

-- https://hdlbits.01xz.net/wiki/Vectorgates
topEntity ::
  "in" ::: BitVector 4 ->
  ( "out_and" ::: Bit,
    "out_or" ::: Bit,
    "out_xor" ::: Bit
  )
topEntity input = (reduceAnd' input, reduceOr' input, reduceXor' input)
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

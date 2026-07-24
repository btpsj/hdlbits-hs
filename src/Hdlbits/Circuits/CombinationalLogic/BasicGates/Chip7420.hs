module Hdlbits.Circuits.CombinationalLogic.BasicGates.Chip7420 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

nand4Input :: Bit -> Bit -> Bit -> Bit -> Bit
nand4Input a b c d = complement . reduceAnd $ pack (a, b, c, d)

topEntity ::
  "p1a" ::: Bit ->
  "p1b" ::: Bit ->
  "p1c" ::: Bit ->
  "p1d" ::: Bit ->
  "p2a" ::: Bit ->
  "p2b" ::: Bit ->
  "p2c" ::: Bit ->
  "p2d" ::: Bit ->
  ( "p1y" ::: Bit,
    "p2y" ::: Bit
  )
topEntity p1a p1b p1c p1d p2a p2b p2c p2d = (p1y, p2y)
  where
    p1y = nand4Input p1a p1b p1c p1d
    p2y = nand4Input p2a p2b p2c p2d
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

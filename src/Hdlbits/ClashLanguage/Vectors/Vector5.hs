module Hdlbits.ClashLanguage.Vectors.Vector5 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/Vectorr
topEntity ::
  "a" ::: Bit ->
  "b" ::: Bit ->
  "c" ::: Bit ->
  "d" ::: Bit ->
  "e" ::: Bit ->
  "out" ::: BitVector 25
topEntity a b c d e = as ++# bs ++# cs ++# ds ++# es
  where
    abcde = pack $ a :> b :> c :> d :> e :> Nil
    as = complement $ abcde `xor` pack (repeat a)
    bs = complement $ abcde `xor` pack (repeat b)
    cs = complement $ abcde `xor` pack (repeat c)
    ds = complement $ abcde `xor` pack (repeat d)
    es = complement $ abcde `xor` pack (repeat e)
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

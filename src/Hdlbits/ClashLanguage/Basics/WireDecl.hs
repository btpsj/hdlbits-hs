module Hdlbits.ClashLanguage.Basics.WireDecl where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- https://hdlbits.01xz.net/wiki/Wire_decl
topEntity ::
  "a" ::: Bit ->
  "b" ::: Bit ->
  "c" ::: Bit ->
  "d" ::: Bit ->
  ( "out" ::: Bit,
    "out_n" ::: Bit
  )
topEntity a b c d = (out, outN)
  where
    aAndb = a .&. b
    cAndd = c .&. d
    out = aAndb .|. cAndd
    outN = complement out
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

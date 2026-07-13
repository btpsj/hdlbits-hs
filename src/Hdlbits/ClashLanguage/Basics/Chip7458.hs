module Hdlbits.ClashLanguage.Basics.Chip7458 where

import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

circuitP1 :: Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool
circuitP1 p1a p1b p1c p1d p1e p1f = abcAnd .|. defAnd
  where
    abcAnd = p1a .&. p1b .&. p1c
    defAnd = p1d .&. p1e .&. p1f

circuitP2 :: Bool -> Bool -> Bool -> Bool -> Bool
circuitP2 p2a p2b p2c p2d = abAnd .|. cdAnd
  where
    abAnd = p2a .&. p2b
    cdAnd = p2c .&. p2d

-- https://hdlbits.01xz.net/wiki/7458
topEntity ::
  "p1a" ::: Bool ->
  "p1b" ::: Bool ->
  "p1c" ::: Bool ->
  "p1d" ::: Bool ->
  "p1e" ::: Bool ->
  "p1f" ::: Bool ->
  "p2a" ::: Bool ->
  "p2b" ::: Bool ->
  "p2c" ::: Bool ->
  "p2d" ::: Bool ->
  ( "p1y" ::: Bool,
    "p2y" ::: Bool
  )
topEntity p1a p1b p1c p1d p1e p1f p2a p2b p2c p2d = (p1y, p2y)
  where
    p1y = circuitP1 p1a p1b p1c p1d p1e p1f
    p2y = circuitP2 p2a p2b p2c p2d
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

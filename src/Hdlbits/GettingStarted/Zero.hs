module Hdlbits.GettingStarted.Zero where

import Clash.Prelude

-- | HDLBits problem / Zero / (<https://hdlbits.01xz.net/wiki/Zero>):
-- a circuit with no inputs and one output that always drives 1.
topEntity :: Bit
topEntity = low

-- Name the generated entity and its output port after the HDLBits problem.
{-# ANN topEntity
  (Synthesize
    { t_name = "top_module"
    , t_inputs = []
    , t_output = PortName "zero"
    }) #-}

-- Make sure GHC does not apply any optimizations to the boundaries of the design.
{-# OPAQUE topEntity #-}

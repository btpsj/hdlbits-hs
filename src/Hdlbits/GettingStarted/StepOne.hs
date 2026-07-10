module Hdlbits.GettingStarted.StepOne where

import Clash.Prelude

-- | HDLBits problem /Step one/ (<https://hdlbits.01xz.net/wiki/Step_one>):
-- a circuit with no inputs and one output that always drives 1.
--
-- 'high' is Clash's constant-1 'Bit', the equivalent of Verilog's @1'b1@.
-- Modelled with 'Bool' instead, the output would simply be 'True'.
--
-- >>> one
-- 1
one :: Bit
one = high

-- | The synthesizable design: no input ports, one output port stuck at 1.
topEntity :: Bit
topEntity = one

-- Name the generated entity and its output port after the HDLBits problem.
{-# ANN topEntity
  (Synthesize
    { t_name = "top_module"
    , t_inputs = []
    , t_output = PortName "one"
    }) #-}

-- Make sure GHC does not apply any optimizations to the boundaries of the design.
{-# OPAQUE topEntity #-}

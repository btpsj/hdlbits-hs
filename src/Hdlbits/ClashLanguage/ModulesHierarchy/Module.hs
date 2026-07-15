module Hdlbits.ClashLanguage.ModulesHierarchy.Module where

import Clash.Annotations.Primitive (HDL (Verilog), Primitive (InlineYamlPrimitive), hasBlackBox)
import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- | External module @mod_a@ supplied by the HDLBits grader. It only exists as
-- a Verilog blackbox; there is no Haskell simulation model.
modA :: Bit -> Bit -> Bit
modA _in1 _in2 = errorX "modA: no simulation model (mod_a is supplied by HDLBits)"
{-# OPAQUE modA #-}
{-# ANN modA hasBlackBox #-}
{-# ANN modA (InlineYamlPrimitive [Verilog] $ unlines
      [ "BlackBox:"
      , "  name: Hdlbits.ClashLanguage.ModulesHierarchy.Module.modA"
      , "  kind: Declaration"
      , "  template: |-"
      , "    wire ~GENSYM[modA_out][1];"
      , "    mod_a ~GENSYM[mod_a_inst][0] (.in1(~ARG[0]), .in2(~ARG[1]), .out(~SYM[1]));"
      , "    assign ~RESULT = ~SYM[1];"
      ]) #-}

-- https://hdlbits.01xz.net/wiki/Module
topEntity ::
  "a" ::: Bit ->
  "b" ::: Bit ->
  "out" ::: Bit
topEntity a b = modA a b
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

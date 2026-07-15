module Hdlbits.ClashLanguage.ModulesHierarchy.ModuleName where

import Clash.Annotations.Primitive (HDL (Verilog), Primitive (InlineYamlPrimitive), hasBlackBox)
import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- | External module @mod_a@ supplied by the HDLBits grader: ports @out1@,
-- @out2@, @in1@..@in4@ declared in an unspecified order, so they must be
-- connected by name. It only exists as a Verilog blackbox; there is no
-- Haskell simulation model. The two output ports become the result tuple
-- @(out1, out2)@.
modA :: Bit -> Bit -> Bit -> Bit -> (Bit, Bit)
modA _a _b _c _d = errorX "modA: no simulation model (mod_a is supplied by HDLBits)"
{-# OPAQUE modA #-}
{-# ANN modA hasBlackBox #-}
{-# ANN modA (InlineYamlPrimitive [Verilog] $ unlines
      [ "BlackBox:"
      , "  name: Hdlbits.ClashLanguage.ModulesHierarchy.Modulename.modA"
      , "  kind: Declaration"
      , "  template: |-"
      , "    wire ~GENSYM[modA_out1][1];"
      , "    wire ~GENSYM[modA_out2][2];"
      , "    mod_a ~GENSYM[mod_a_inst][0] (.out1(~SYM[1]), .out2(~SYM[2]), .in1(~ARG[0]), .in2(~ARG[1]), .in3(~ARG[2]), .in4(~ARG[3]));"
      , "    assign ~RESULT = {~SYM[1], ~SYM[2]};"
      ]) #-}

-- https://hdlbits.01xz.net/wiki/Module_name
topEntity ::
  "a" ::: Bit ->
  "b" ::: Bit ->
  "c" ::: Bit ->
  "d" ::: Bit ->
  ( "out1" ::: Bit,
    "out2" ::: Bit
  )
topEntity a b c d = modA a b c d
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

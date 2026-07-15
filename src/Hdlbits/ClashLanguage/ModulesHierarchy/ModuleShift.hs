module Hdlbits.ClashLanguage.ModulesHierarchy.ModuleShift where

import Clash.Annotations.Primitive (HDL (Verilog), Primitive (InlineYamlPrimitive), hasBlackBox)
import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

myDff :: Bit -> Bit -> Bit
myDff _clk _d = errorX "myDff: no simulation model (myDff is supplied by HDLBits)"
{-# OPAQUE myDff #-}
{-# ANN myDff hasBlackBox #-}
{-# ANN myDff (InlineYamlPrimitive [Verilog] $ unlines
      [ "BlackBox:"
      , "  name: Hdlbits.ClashLanguage.ModulesHierarchy.ModuleShift.myDff"
      , "  kind: Declaration"
      , "  template: |-"
      , "    wire ~GENSYM[myDff_out][1];"
      , "    my_dff ~GENSYM[my_diff_inst][0] (.clk(~ARG[0]), .d(~ARG[1]), .q(~SYM[1]));"
      , "    assign ~RESULT = ~SYM[1];"
      ]) #-}

-- https://hdlbits.01xz.net/wiki/Module_shift
topEntity ::
  "clk" ::: Bit ->
  "d" ::: Bit ->
  "q" ::: Bit
topEntity clk = myDff clk . myDff clk . myDff clk
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

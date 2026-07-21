module Hdlbits.ClashLanguage.ModulesHierarchy.ModuleShift8 where

import Clash.Annotations.Primitive (HDL (Verilog), Primitive (InlineYamlPrimitive), hasBlackBox)
import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

myDff8 :: Bit -> BitVector 8 -> BitVector 8
myDff8 _clk _d = errorX "myDff8: no simulation model (myDff is supplied by HDLBits)"
{-# OPAQUE myDff8 #-}
{-# ANN myDff8 hasBlackBox #-}
{-# ANN
  myDff8
  ( InlineYamlPrimitive [Verilog]
      $ unlines
        [ "BlackBox:",
          "  name: Hdlbits.ClashLanguage.ModulesHierarchy.ModuleShift8.myDff8",
          "  kind: Declaration",
          "  template: |-",
          "    wire [7:0] ~GENSYM[myDff_out][1];",
          "    my_dff8 ~GENSYM[my_diff_inst][0] (.clk(~ARG[0]), .d(~ARG[1]), .q(~SYM[1]));",
          "    assign ~RESULT = ~SYM[1];"
        ]
  )
  #-}

-- https://hdlbits.01xz.net/wiki/Module_shift8
topEntity ::
  "clk" ::: Bit ->
  "d" ::: BitVector 8 ->
  "sel" ::: BitVector 2 ->
  "q" ::: BitVector 8
topEntity clk d sel = q
  where
    q1 = myDff8 clk d
    q2 = myDff8 clk q1
    q3 = myDff8 clk q2
    q = case sel of
      $(bitPattern "00") -> d
      $(bitPattern "01") -> q1
      $(bitPattern "10") -> q2
      _ -> q3
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

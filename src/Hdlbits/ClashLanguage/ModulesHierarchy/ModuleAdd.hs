module Hdlbits.ClashLanguage.ModulesHierarchy.ModuleAdd where

import Clash.Annotations.Primitive (HDL (Verilog), Primitive (InlineYamlPrimitive), hasBlackBox)
import Clash.Annotations.TH (makeTopEntityWithName)
import Clash.Prelude

-- | External module @add16@ supplied by the HDLBits grader: a 16-bit adder
-- with carry in and carry out. The Verilog netlist comes from the blackbox
-- below; this body is only the simulation model.
--
-- It deliberately is not 'errorX'. A bottoming body gets a diverging demand
-- signature, which @OPAQUE@ does not suppress, and GHC then rewrites the
-- tuple pattern match in 'topEntity' into @case ... of {}@ — erasing the
-- call before Clash ever sees it, so the blackbox never fires.
add16 :: BitVector 16 -> BitVector 16 -> Bit -> (BitVector 16, Bit)
add16 a b cin = (truncateB s, msb s)
  where
    s :: BitVector 17
    s = extend a + extend b + extend (pack cin)
{-# OPAQUE add16 #-}
{-# ANN add16 hasBlackBox #-}
{-# ANN
  add16
  ( InlineYamlPrimitive [Verilog] $
      unlines
        [ "BlackBox:",
          "  name: Hdlbits.ClashLanguage.ModulesHierarchy.ModuleAdd.add16",
          "  kind: Declaration",
          "  template: |-",
          "    wire [15:0] ~GENSYM[add16_sum][1];",
          "    wire ~GENSYM[add16_cout][2];",
          "    add16 ~GENSYM[add16_inst][0] (.a(~ARG[0]), .b(~ARG[1]), .cin(~ARG[2]), .sum(~SYM[1]), .cout(~SYM[2]));",
          "    assign ~RESULT = {~SYM[1], ~SYM[2]};"
        ]
  )
  #-}

-- https://hdlbits.01xz.net/wiki/Module_add
topEntity ::
  "a" ::: BitVector 32 ->
  "b" ::: BitVector 32 ->
  "sum" ::: BitVector 32
topEntity a b = abSum
  where
    topA = slice d31 d16 a
    topB = slice d31 d16 b
    (topSum, _) = add16 topA topB topBott

    bottA = slice d15 d0 a
    bottB = slice d15 d0 b
    (bottSum, topBott) = add16 bottA bottB 0
    abSum = topSum ++# bottSum
{-# OPAQUE topEntity #-}

makeTopEntityWithName 'topEntity "top_module"

# HDLBits in Clash

Solutions to the Verilog exercises on [HDLBits](https://hdlbits.01xz.net) using [Clash](https://clash-lang.org/), a Haskell-based hardware description language that compiles to Verilog/VHDL.

## Building

```bash
stack build
stack run clash -- Hdlbits.ClashLanguage.ModulesHierarchy.ModuleShift --verilog
# Outputs a Verilog file at:
# verilog/Hdlbits.ClashLanguage.ModulesHierarchy.ModuleShift.topEntity/top_module.v
```

For more information on building, see [`BUILD.md`](./BUILD.md)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

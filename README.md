# RTL Practice

SystemVerilog design and verification practice, working toward a career in chip design.

## Projects

| Folder | Description | Status |
|---|---|---|
| `week1/` | Parameterized counter with a self-checking testbench | Done |

## Tools

- Verilator and Icarus Verilog for simulation
- Surfer for waveform viewing
- VS Code on macOS

## Running a simulation

From a project folder:

```
verilator --binary --timing --trace --top-module <tb_name> <tb_file>.sv <design_file>.sv
./obj_dir/V<tb_name>
```

Simulations print PASS or FAIL and write a `wave.vcd` waveform file.
